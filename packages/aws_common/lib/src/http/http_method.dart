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

/// Valid HTTP methods for AWS requests.
enum HttpMethod {
  /// HTTP GET
  get,

  /// HTTP HEAD
  head,

  /// HTTP POST
  post,

  /// HTTP PUT
  put,

  /// HTTP PATCH
  patch,

  /// HTTP DELETE
  delete,

  /// HTTP CONNECT
  connect,

  /// HTTP OPTIONS
  options,

  /// HTTP TRACE
  trace,
}

/// Helpers for [HttpMethod].
extension HttpMethodX on HttpMethod {
  /// Parses the HTTP method from [method].
  static HttpMethod fromString(String method) =>
      HttpMethod.values.firstWhere((el) => method.toUpperCase() == el.value);

  /// {@template aws_common.http_method_value}
  /// Returns the uppercased HTTP method, e.g. 'POST'.
  /// {@endtemplate}
  String get value => toString().split('.')[1].toUpperCase();

  /// {@macro aws_common.http_method_value}
  String canonicalize() => value.toUpperCase();

  /// Whether this method requires a body.
  bool get hasBody {
    switch (this) {
      case HttpMethod.post:
      case HttpMethod.put:
      case HttpMethod.patch:
        return true;
      default:
        return false;
    }
  }
}
