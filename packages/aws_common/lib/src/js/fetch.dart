// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';

import 'package:aws_common/aws_common.dart';
import 'package:aws_common/src/js/abort.dart';
import 'package:aws_common/src/js/common.dart';
import 'package:aws_common/src/js/promise.dart';
import 'package:aws_common/src/js/readable_stream.dart';

/// How to handle a redirect response of a [Request].
enum RequestRedirect with JSEnum {
  /// Automatically follow redirects.
  follow,

  /// Abort with an error if a redirect occurs.
  error,

  /// Caller intends to process the response in another context.
  manual,
}

/// The mode used for a [Request].
enum RequestMode with JSEnum {
  /// Allows cross-origin requests, for example to access various APIs offered
  /// by 3rd party vendors.
  cors,

  /// Prevents the method from being anything other than `HEAD`, `GET` or
  /// `POST`, and the headers from being anything other than simple headers.
  ///
  /// If any ServiceWorkers intercept these requests, they may not add or
  /// override any headers except for those that are simple headers. In
  /// addition, JavaScript may not access any properties of the resulting
  /// [Response]. This ensures that ServiceWorkers do not affect the semantics
  /// of the Web and prevents security and privacy issues arising from leaking
  /// data across domains.
  noCors,

  /// If a request is made to another origin with this mode set, the result is
  /// an error. You could use this to ensure that a request is always being made
  /// to your origin.
  sameOrigin,
}

/// {@template aws_common.js.request_init}
/// Defines the resource that you wish to [fetch].
/// {@endtemplate}
@JS()
@anonymous
@staticInterop
abstract class RequestInit {
  /// {@macro aws_common.js.request_init}
  factory RequestInit({
    RequestMode mode = RequestMode.cors,
    RequestRedirect redirect = RequestRedirect.follow,

    /// The keepalive option can be used to allow the request to outlive the
    /// page.
    bool keepalive = false,
    AbortSignal? signal,
    AWSHttpMethod method = AWSHttpMethod.get,
    Map<String, String>? headers,
    Object? /*Stream<List<int>>|List<int>|null*/ body,
  }) {
    // `fetch` does not allow bodies for these methods.
    final cannotHaveBody =
        method == AWSHttpMethod.get || method == AWSHttpMethod.head;
    final jsBody = switch (body) {
      == null || _ when cannotHaveBody => null,
      Stream<List<int>> _ => body.asReadableStream(),
      Uint8List _ => body.toJS,
      List<int> _ => Uint8List.fromList(body).toJS,
      _ => throw ArgumentError('Invalid body: $body (${body.runtimeType})'),
    };
    return RequestInit._(
      mode: mode.jsValue,
      redirect: redirect.jsValue,
      headers: headers.jsify() as JSObject?,
      method: method.value.toJS,
      signal: signal,
      keepalive: keepalive.toJS,
      body: jsBody ?? jsUndefined(),
      // Added for full compatibility with all `fetch` impls:
      // https://developer.chrome.com/articles/fetch-streaming-requests/#half-duplex
      duplex: 'half'.toJS,
    );
  }

  external factory RequestInit._({
    JSString? mode,
    JSString? redirect,
    JSObject? headers,
    JSString? duplex,
    AbortSignal? signal,
    JSBoolean? keepalive,
    JSString? method,
    JSObject? body,
  });
}

/// {@template aws_common.js.headers}
/// The Headers interface of the Fetch API allows you to perform various
/// actions on HTTP request and response headers.
///
/// These actions include retrieving, setting, adding to, and removing headers
/// from the list of the request's headers.
/// {@endtemplate}
@JS()
@staticInterop
abstract class Headers implements JSObject {
  /// {@macro aws_common.js.headers}
  factory Headers(Map<String, String> headers) =>
      Headers._(headers.jsify() as JSObject);

  external factory Headers._(JSObject headers);
}

/// {@macro aws_common.js.headers}
extension PropsHeaders on Headers {
  /// Alias for [get].
  String? operator [](String name) => get(name.toJS)?.toDart;

  /// Alias for [set].
  void operator []=(String name, String value) => set(name.toJS, value.toJS);

  /// Appends a new value onto an existing header inside a Headers object, or
  /// adds the header if it does not already exist.
  external JSVoid append(JSString name, JSString value);

  /// Deletes a header.
  external JSVoid delete(JSString name);

  /// Returns a String sequence of all the values of a header within a
  /// [Headers] object with a given [name].
  external JSString? get(JSString name);

  /// Returns a boolean stating whether a [Headers] object contains a certain
  /// [header].
  external JSBoolean has(JSString header);

  /// Sets a new value for an existing header inside a [Headers] object, or adds
  /// the header if it does not already exist.
  external JSVoid set(JSString name, JSString value);

  /// Executes [callback] once for each array element.
  void forEach(
    JSVoid Function(JSString value, JSString key, Headers parent) callback,
  ) =>
      callMethod('forEach'.toJS, callback.toJS);
}

/// {@template aws_common.js.request}
/// The Request interface of the Fetch API represents a resource request.
/// {@endtemplate}
@JS()
@staticInterop
abstract class Request {
  /// {@macro aws_common.js.request}
  external factory Request(JSString url, [RequestInit? init]);
}

/// {@template aws_common.js.response}
/// The Response interface of the Fetch API represents the response to a
/// request.
/// {@endtemplate}
@JS()
@staticInterop
abstract class Response implements JSObject {
  /// {@macro aws_common.js.response}
  external factory Response(JSString url, [RequestInit? init]);
}

/// Used to expand [Response] and treat `Response.body` as a `late final`
/// property so that multiple accesses return the same value.
final Expando<ReadableStreamView> _responseStreams = Expando('ResponseStreams');

/// {@macro aws_common.js.response}
extension PropsResponse on Response {
  /// The response's body as a Dart [Stream].
  ReadableStreamView get body => _responseStreams[this] ??=
      getProperty<ReadableStream?>('body'.toJS)?.stream ??
          const ReadableStreamView.empty();

  /// The response's headers.
  Map<String, String> get headers {
    final Map<String, String> headers = CaseInsensitiveMap({});
    getProperty<Headers>('headers'.toJS).forEach((value, key, _) {
      headers[key.toDart] = value.toDart;
    });
    return headers;
  }

  /// The status code of the response.
  external JSNumber get status;

  /// The status message corresponding to [status].
  external JSString get statusText;

  /// Whether or not the response is the result of a redirect.
  external JSBoolean get redirected;

  external JSPromise blob();
}

@JS('fetch')
external Promise<Response> _fetch(JSString url, [RequestInit? init]);

/// The global fetch() method starts the process of fetching a resource from
/// the network, returning a promise which is fulfilled once the response is
/// available.
Future<Response> fetch(String url, [RequestInit? init]) {
  return _fetch(url.toJS, init).future;
}
