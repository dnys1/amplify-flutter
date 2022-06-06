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

import 'package:amplify_secure_storage_dart/amplify_secure_storage_dart.dart';
import 'package:aws_common/aws_common.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'secure_storage_action.dart';

part 'secure_storage_request.g.dart';

abstract class SecureStorageRequest
    implements Built<SecureStorageRequest, SecureStorageRequestBuilder> {
  factory SecureStorageRequest([
    void Function(SecureStorageRequestBuilder) updates,
  ]) = _$SecureStorageRequest;
  SecureStorageRequest._();

  @BuiltValueHook(finalizeBuilder: true)
  static void _init(SecureStorageRequestBuilder b) {
    b.id ??= uuid();
  }

  /// Unique ID for the request, typically a UUID.
  String get id;
  SecureStorageAction get action;
  AmplifySecureStorageConfig? get config;
  String? get key;
  String? get value;

  static Serializer<SecureStorageRequest> get serializer =>
      _$secureStorageRequestSerializer;
}
