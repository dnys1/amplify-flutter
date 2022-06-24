// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'dart:js_util' as js_util;

import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:worker_bee/src/common.dart';
import 'package:worker_bee/src/exception/worker_bee_exception.dart';
import 'package:worker_bee/src/js/interop/common.dart';
import 'package:worker_bee/src/js/message_port_channel.dart';
import 'package:worker_bee/src/preamble.dart';
import 'package:worker_bee/worker_bee.dart';

/// The result of serializing a message using the registered `built_value`
/// serializers.
///
/// Objects needing transfer between contexts, e.g. [MessagePort]s, will be
/// included in the [transfer] array.
class _WorkerSerializeResult {
  const _WorkerSerializeResult(this.value, this.transfer);

  /// The serialized value.
  final Object? value;

  /// Objects needing transfer between contexts, e.g. [MessagePort]s.
  final List<Object> transfer;
}

/// {@macro worker_bee.worker_bee_impl}
mixin WorkerBeeImpl<Request extends Object, Response>
    on WorkerBeeCommon<Request, Response> {
  // Controllers used to manage web worker.
  StreamController<Request>? _controller;
  StreamController<Response>? _incomingMessages;
  StreamChannel<LogMessage>? _logsChannel;

  /// The spawned worker instance.
  Worker? _worker;

  @override
  String get jsEntrypoint;

  @override
  List<String> get fallbackUrls => const [];

  @override
  String? get workerEntrypointOverride {
    if (currentUri.path.isNotEmpty && !currentUri.path.endsWith(jsEntrypoint)) {
      return currentUri.path;
    }
    return null;
  }

  /// Serializes an object using the registered `built_value` serializers.
  _WorkerSerializeResult _serialize(Object? object) {
    final transfer = <Object>[];
    final serialized = runZoned(
      () => serializers.serialize(
        object,
        // Do not specify type so that it is serialized into the array.
        specifiedType: FullType.unspecified,
      ),
      zoneValues: {
        #transfer: transfer,
      },
    );
    return _WorkerSerializeResult(serialized, transfer);
  }

  /// Deserializes an object using the registered `built_value` serializers.
  @optionalTypeArgs
  T _deserialize<T extends Object?>(Object? object) {
    final deserialized = runZoned(
      () => serializers.deserialize(
        object,
        // Do not specify type so that it pulls from the array.
        specifiedType: FullType.unspecified,
      ) as T,
      zoneValues: {
        #addPendingOperation: addPendingOperation,
      },
    );
    return deserialized;
  }

  @override
  void completeError(Object error, [StackTrace? stackTrace]) {
    if (isWebWorker) {
      final serialized = _serialize(error);
      error = serialized.value!;
      self.postMessage(serialized.value, serialized.transfer);
    }
    super.completeError(error, stackTrace);
  }

  @override
  @nonVirtual
  Future<void> connect({
    StreamChannel<LogMessage>? logsChannel,
  }) async {
    return runTraced(
      () async {
        await super.connect(logsChannel: logsChannel);
        final channel = StreamChannelController<Object?>(sync: true);
        self.addEventListener(
          'message',
          Zone.current.bindUnaryCallback<void, Event>((Event event) {
            event as MessageEvent;
            logger.finest('Got message: ${event.data}');
            final serialized = event.data;
            final message = _deserialize<Request>(serialized);
            channel.foreign.sink.add(message);
          }),
        );
        channel.foreign.stream.listen(
          Zone.current.bindUnaryCallback((message) {
            logger.finest('Sending message: $message');
            final serialized = _serialize(message);
            self.postMessage(serialized.value, serialized.transfer);
          }),
        );
        logger.finest('Ready');
        self.postMessage('ready');
        final result = await run(
          channel.local.stream.asBroadcastStream().cast(),
          channel.local.sink.cast(),
        );
        logger.finest('Finished');
        self.postMessage('done');

        final serializedResult = _serialize(result);
        self.postMessage(serializedResult.value, serializedResult.transfer);

        // Allow streams to flush, then close underlying resources.
        await close();
      },
      onError: completeError,
    );
  }

  EntrypointLoader _createLoader(Object entrypoint) {
    if (entrypoint is EntrypointLoader) {
      return () async {
        final library = await entrypoint();
        final blob = Blob(
          js_util.jsify([library]) as Object,
          BlobInitOptions(type: 'text/javascript'),
        );
        return URL.createObjectURL(blob);
      };
    }
    return () => Future.value(entrypoint as String);
  }

  @override
  @nonVirtual
  Future<void> spawn({
    String? jsEntrypoint,
    EntrypointLoader? loadJsEntrypoint,
  }) async {
    return runTraced(
      () async {
        for (final entrypointLoader in [
          if (jsEntrypoint != null) _createLoader(jsEntrypoint),
          _createLoader(this.jsEntrypoint),
          ...fallbackUrls.map(_createLoader),
          if (loadJsEntrypoint != null) _createLoader(loadJsEntrypoint)
        ]) {
          // Spawn the worker using the specified script.
          try {
            final entrypoint = await entrypointLoader();
            logger.finest('Spawning worker at $entrypoint');
            _worker = Worker(entrypoint);
          } on Object catch (e, st) {
            logger.severe('Could not launch worker', e, st);
            continue;
          }

          try {
            /// Captures errors occurring before a `ready` event is received.
            final errorBeforeReady = Completer<void>();

            // Whether `run` has completed on the web worker.
            var done = false;

            // Create the controller to handle message passing.
            _controller = StreamController<Request>(
              sync: true,
              onCancel: () {
                final error = WorkerBeeExceptionImpl(
                  'Worker quit unexpectedly',
                );
                if (ready.isCompleted) {
                  if (!done) {
                    completeError(error);
                  }
                } else {
                  errorBeforeReady.completeError(error);
                }
              },
            );

            // Listen for error messages on the worker.
            //
            // Some browsers do not currently support the `messageerror` event:
            // https://developer.mozilla.org/en-US/docs/Web/API/Worker/messageerror_event#browser_compatibility
            _worker!.addEventListener('messageerror', (Event event) {
              event as MessageEvent;
              final error = WorkerBeeExceptionImpl(
                'Could not serialize message: ${event.data}',
              );
              if (ready.isCompleted) {
                completeError(error);
              } else {
                errorBeforeReady.completeError(error);
              }
            });
            _worker!.onError = (Event event) {
              Object error;
              if (event is ErrorEvent) {
                final eventJson = JSON.stringify(event.error);
                error = WorkerBeeExceptionImpl('${event.message} ($eventJson)');
              } else {
                error = WorkerBeeExceptionImpl('An unknown error occurred');
              }
              if (ready.isCompleted) {
                completeError(error);
              } else {
                errorBeforeReady.completeError(error);
              }
            };

            // Passes outgoing messages to the worker instance.
            _controller!.stream.listen(
              Zone.current.bindUnaryCallback((message) {
                logger.finest('Sending message: $message');
                final serialized = _serialize(message);
                _worker!.postMessage(serialized.value, serialized.transfer);
              }),
            );

            // Listen to worker
            _incomingMessages = StreamController<Response>(sync: true);
            _worker!.onMessage =
                Zone.current.bindUnaryCallback((MessageEvent event) {
              if (event.data is String) {
                if (event.data == 'ready') {
                  logger.finest('Received ready event');
                  ready.complete();
                  return;
                }
                if (event.data == 'done') {
                  logger.finest('Received done event');
                  done = true;
                  return;
                }
              }
              final serialized = event.data;
              final message = _deserialize(serialized);
              logger.finest('Got message: $message');
              if (message is WorkerBeeException) {
                if (ready.isCompleted) {
                  _incomingMessages!.addError(message, message.stackTrace);
                  completeError(message, message.stackTrace);
                } else {
                  errorBeforeReady.completeError(message, message.stackTrace);
                }
                return;
              }
              message as Response?;
              if (message is Response && !done) {
                _incomingMessages!.add(message);
              }
              if (done) {
                complete(message);
              }
            });

            // Send assignment and logs channel
            final jsLogsChannel = MessageChannel();
            _logsChannel = MessagePortChannel<LogMessage>(
              jsLogsChannel.port1,
              serializers: serializers,
            );
            _logsChannel!.stream.listen(
              Zone.current.bindUnaryCallback((message) {
                if (logsController.isClosed) return;
                logsController.add(message);
              }),
            );
            _worker!.postMessage(name, [jsLogsChannel.port2]);

            await Future.any<void>([
              ready.future,
              errorBeforeReady.future,
            ]);

            stream = _incomingMessages!.stream;
            sink = _controller!.sink;

            return;
          } on Object catch (e, st) {
            logger.severe('Error initializing worker', e, st);
            continue;
          }
        }

        throw WorkerBeeExceptionImpl('Could not launch web worker.');
      },
      onError: completeError,
    );
  }

  @override
  Future<void> close({
    bool force = false,
  }) async {
    // Close the request/response channels.
    await _incomingMessages?.close();
    await _controller?.close();
    _incomingMessages = null;
    _controller = null;

    // Await pending operations which may need logging utilities.
    await super.close(force: force);

    // Close remote logging.
    await _logsChannel?.sink.close();
    _logsChannel = null;

    // Close local logging.
    await logsController.close();

    _worker?.terminate();
    _worker = null;
  }
}
