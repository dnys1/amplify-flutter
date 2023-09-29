// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';

import 'package:aws_common/src/js/promise.dart';

/// {@template aws_common.js.readable_stream}
/// An object containing methods and properties that define how the constructed
/// [ReadableStream] will behave.
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class UnderlyingSource {
  /// {@macro aws_common.js.readable_stream}
  factory UnderlyingSource({
    /// This is a method, called immediately when the object is constructed.
    ///
    /// The contents of this method are defined by the developer, and should aim
    /// to get access to the stream source, and do anything else required to set
    /// up the stream functionality. If this process is to be done
    /// asynchronously, it can return a promise to signal success or failure.
    ///
    /// The `controller` parameter passed to this method is a
    /// [ReadableStreamDefaultController] or a [ReadableByteStreamController],
    /// depending on the value of the `type` property. This can be used by the
    /// developer to control the stream during set up.
    FutureOr<void> Function(ReadableStreamController controller)? start,

    /// This method, also defined by the developer, will be called repeatedly
    /// when the stream's internal queue of chunks is not full, up until it
    /// reaches its high water mark.
    ///
    /// If pull() returns a promise, then it won't be called again until that
    /// promise fulfills; if the promise rejects, the stream will become
    /// errored.
    ///
    /// The `controller` parameter passed to this method is a
    /// [ReadableStreamDefaultController] or a [ReadableByteStreamController],
    /// depending on the value of the type property. This can be used by the
    /// developer to control the stream as more chunks are fetched.
    FutureOr<void> Function(ReadableStreamController controller)? pull,

    /// This method, also defined by the developer, will be called if the app
    /// signals that the stream is to be cancelled
    /// (e.g. if `ReadableStream.cancel` is called).
    ///
    /// The contents should do whatever is necessary to release access to the
    /// stream source. If this process is asynchronous, it can return a promise
    /// to signal success or failure. The reason parameter contains a
    /// `DOMString` describing why the stream was cancelled.
    FutureOr<void> Function([
      String? reason,
      ReadableStreamController? controller,
    ])? cancel,
  }) {
    return UnderlyingSource._(
      start: (ReadableStreamController controller) {
        return Promise.fromFuture(
          Future(() async {
            await start?.call(controller);
            return null;
          }),
        );
      }.toJS,
      pull: (ReadableStreamController controller) {
        return Promise.fromFuture(
          Future(() async {
            await pull?.call(controller);
            return null;
          }),
        );
      }.toJS,
      cancel: (
        JSString? reason,
        ReadableStreamController? controller,
      ) {
        return Promise.fromFuture(
          Future(() async {
            await cancel?.call(reason?.toDart, controller);
            return null;
          }),
        );
      }.toJS,
    );
  }

  external factory UnderlyingSource._({
    JSFunction? start,
    JSFunction? pull,
    JSFunction? cancel,
  });
}

/// {@template aws_common.js.readable_stream_controller}
/// Interface for accessing the internal state/queue of a [ReadableStream].
///
/// Similar to a Dart [StreamController].
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableStreamController implements JSObject {}

/// {@macro aws_common.js.readable_stream_controller}
extension PropsReadableStreamController on ReadableStreamController {
  /// The desired size required to fill the stream's internal queue.
  external JSNumber get desiredSize;

  /// Closes the associated stream.
  external JSVoid close();

  /// Enqueues a given chunk in the associated stream.
  external JSVoid enqueue(JSUint8Array chunk);

  /// Causes any future interactions with the associated stream to error with [e].
  external JSVoid error(JSAny e);
}

/// {@template aws_common.js.readable_stream_default_controller}
/// A default [ReadableStreamController], for [ReadableStream]s which are not
/// byte streams.
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableStreamDefaultController
    extends ReadableStreamController {}

/// {@template aws_common.js.readable_byte_stream_controller}
/// A [ReadableStreamController] for [ReadableStream]s which are not
/// byte streams.
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableByteStreamController extends ReadableStreamController {}

/// {@template aws_common.js.readable_stream}
/// Represents a readable stream of byte data.
/// {@endtemplate}
@JS()
@staticInterop
abstract class ReadableStream implements JSObject {
  /// {@macro aws_common.js.readable_stream}
  external factory ReadableStream([UnderlyingSource underlyingSource]);
}

/// Used to expand [ReadableStream] and treat `ReadableStream.stream` as a
/// `late final` property so that multiple accesses return the same value.
final Expando<ReadableStreamView> _readableStreamViews =
    Expando('ReadableStreamViews');

/// {@macro aws_common.js.readable_stream}
extension PropsReadableStream on ReadableStream {
  /// Whether or not the readable stream is locked to a reader.
  external JSBoolean get locked;

  /// Returns a Promise that resolves when the stream is canceled.
  ///
  /// Calling this method signals a loss of interest in the stream by a
  /// consumer. The supplied reason argument will be given to the underlying
  /// source, which may or may not use it.
  Future<void> cancel([String? reason]) =>
      callMethod<JSPromise>('cancel'.toJS, reason?.toJS).toDart;

  /// Creates a reader and locks the stream to it.
  ///
  /// While the stream is locked, no other reader can be acquired until this one
  /// is released.
  ReadableStreamDefaultReader getReader() => callMethod('getReader'.toJS);

  /// Creates a Dart [Stream] from `this`.
  ReadableStreamView get stream =>
      _readableStreamViews[this] ??= ReadableStreamView(this);

  /// The progress (in bytes) of [stream].
  Stream<int> get progress => stream.progress;
}

/// {@template aws_common.js.readable_stream_reader}
/// Interface for reading data from a [ReadableStream].
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableStreamReader implements JSObject {}

/// {@macro aws_common.js.readable_stream_reader}
extension PropsReadableStreamReader on ReadableStreamReader {
  /// Returns a Promise that fulfills when the stream closes, or rejects if the
  /// stream throws an error or the reader's lock is released.
  ///
  /// This property enables you to write code that responds to an end to the
  /// streaming process.
  Future<void> get closed => getProperty<JSPromise>('closed'.toJS).toDart;

  /// Returns a Promise that resolves when the stream is canceled.
  ///
  /// Calling this method signals a loss of interest in the stream by a
  /// consumer. The supplied reason argument will be given to the underlying
  /// source, which may or may not use it.
  Future<void> cancel([String? reason]) =>
      callMethod<JSPromise>('cancel'.toJS, reason?.toJS).toDart;

  /// Releases the reader's lock on the stream.
  external JSVoid releaseLock();
}

/// {@template aws_common.js.readable_stream_byob_reader}
/// A reader for a [ReadableStream] that supports zero-copy reading from an
/// underlying byte source.
///
/// It is used for efficient copying from underlying sources where the data is
/// delivered as an "anonymous" sequence of bytes, such as files.
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableStreamBYOBReader extends ReadableStreamReader {}

/// {@template aws_common.js.readable_stream_default_reader}
/// A default reader that can be used to read stream data supplied from a
/// network (such as a fetch request).
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableStreamDefaultReader extends ReadableStreamReader {}

/// {@macro aws_common.js.readable_stream_default_reader}
extension PropsReadableStreamDefaultReader on ReadableStreamDefaultReader {
  /// Returns a promise providing access to the next chunk in the stream's
  /// internal queue.
  Future<ReadableStreamChunk> read() => callMethod<JSPromise>('read'.toJS)
      .toDart
      .then((value) => value as ReadableStreamChunk);
}

/// {@template aws_common.js.readable_stream_chunk}
/// A chunk in a [ReadableStream]'s internal queue, obtained using a
/// [ReadableStreamReader].
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class ReadableStreamChunk {}

/// {@macro aws_common.js.readable_stream_chunk}
extension PropsReadableStreamChunk on ReadableStreamChunk {
  /// The chunk of data.
  ///
  /// Always `null` when [done] is `true`.
  external JSUint8Array? get value;

  /// Whether the stream is done producing values.
  external JSBoolean get done;
}

/// {@template aws_common.js.readable_stream_view}
/// Wraps a [ReadableStream] as a Dart [Stream].
/// {@endtemplate}
final class ReadableStreamView extends StreamView<List<int>> {
  /// {@macro aws_common.js.readable_stream_view}
  factory ReadableStreamView(ReadableStream stream) {
    final controller = StreamController<List<int>>();
    final progressController = StreamController<int>.broadcast();
    _pipeFrom(
      stream,
      controller.sink,
      progressController.sink,
    ).whenComplete(() {
      controller.close();
      progressController.close();
    });
    return ReadableStreamView._(
      controller.stream,
      progressController.stream,
    );
  }

  /// Creates an empty [ReadableStreamView] which emits a single `done` event.
  const ReadableStreamView.empty()
      : this._(const Stream.empty(), const Stream.empty());

  const ReadableStreamView._(super.stream, this.progress);

  /// The number of bytes read so far.
  ///
  /// Closes when `this` closes.
  final Stream<int> progress;

  static Future<void> _pipeFrom(
    ReadableStream stream,
    StreamSink<List<int>> sink,
    StreamSink<int> progressSink,
  ) async {
    try {
      final reader = stream.getReader();
      var bytesRead = 0;
      while (true) {
        final chunk = await reader.read();
        final value = chunk.value?.toDart;
        if (chunk.done.toDart || value == null) {
          break;
        }
        bytesRead += value.length;
        sink.add(value);
        progressSink.add(bytesRead);
      }
    } on JSAny catch (e, st) {
      sink.addError(e.dartify()!, st);
    } on Object catch (e, st) {
      sink.addError(e, st);
    }
  }
}

/// {@template aws_common.js.stream_to_readable_stream}
/// Creates a [ReadableStream] from `this`.
/// {@endtemplate}
extension StreamToReadableStream on Stream<List<int>> {
  /// {@macro aws_common.js.stream_to_readable_stream}
  ReadableStream asReadableStream({
    void Function(Object, StackTrace)? onError,
  }) {
    return ReadableStream(
      UnderlyingSource(
        start: (controller) async {
          try {
            await for (final chunk in this) {
              controller.enqueue(Uint8List.fromList(chunk).toJS);
            }
            controller.close();
          } on Object catch (e, st) {
            if (onError == null) {
              // Cannot call `close` on an error'd controller.
              return controller.error(e.jsify()!);
            }
            onError.call(e, st);
            controller.close();
          }
        },
      ),
    );
  }
}
