// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

@JS()
library js_promise;

import 'dart:js_interop';

import 'package:aws_common/src/js/common.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

@JS()
@staticInterop
class PromiseResolver<T extends Object?> {}

extension PromiseResolverExtension<T extends Object?> on PromiseResolver<T> {
  void resolve(T result) => js_util
      .callMethod(this, 'call', <Object>[this, if (result != null) result]);
}

@JS()
@staticInterop
class PromiseRejecter {}

extension PromiseRejecterExtension on PromiseRejecter {
  void reject(Object? error) => js_util
      .callMethod(this, 'call', <Object>[this, if (error != null) error]);
}

/// Type-safe JS Promises
@JS('Promise')
@staticInterop
abstract class Promise<T extends Object?> {
  /// A constructor for a JS promise
  external factory Promise(JSFunction executor);
}

/// The type of function that is used to create a Promise<T>
typedef PromiseExecutor<T extends Object?> = void Function(
  PromiseResolver<T> resolve,
  PromiseRejecter reject,
);

final Object _promiseCtor = js_util.getProperty(self, 'Promise');

JSPromise futureToPromise<T extends Object?>(Future<T> future) {
  return js_util.callConstructor(_promiseCtor, [
    allowInterop((PromiseResolver<T> resolver, PromiseRejecter rejecter) {
      future.then(
        (T value) => resolver.resolve(value),
        onError: (Object? error) {
          rejecter.reject(error);
        },
      );
    }),
  ]) as JSPromise;
}
