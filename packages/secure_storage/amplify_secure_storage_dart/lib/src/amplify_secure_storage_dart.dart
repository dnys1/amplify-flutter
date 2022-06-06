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

// ignore_for_file: close_sinks

import 'dart:async';

import 'package:amplify_secure_storage_dart/src/interfaces/amplify_secure_storage_interface.dart';
import 'package:amplify_secure_storage_dart/src/mixins/amplify_secure_storage_mixin.dart';
import 'package:amplify_secure_storage_dart/src/types/amplify_secure_storage_config.dart';
import 'package:amplify_secure_storage_dart/src/worker/secure_storage_action.dart';
import 'package:amplify_secure_storage_dart/src/worker/secure_storage_request.dart';
import 'package:amplify_secure_storage_dart/src/worker/secure_storage_worker.dart';
import 'package:aws_common/aws_common.dart';
import 'package:worker_bee/worker_bee.dart';

/// {@template amplify_secure_storage_dart.amplify_secure_storage_dart}
/// Secure Storage implementation in Dart, supporting web and desktop platforms.
///
///  Example:
/// ```dart
/// // create storage instance
/// AmplifySecureStorageDart storage = AmplifySecureStorageDart();
///
/// // write to storage
/// storage.write(key: 'my_key', value: 'my value');
///
/// // read from storage
/// final value = await storage.read(key: 'my_key');
///
/// // delete from storage
/// storage.delete(key: 'my_key');
/// ```
/// {@endtemplate}
class AmplifySecureStorageDart extends AmplifySecureStorageInterface
    with AmplifySecureStorageDartMixin {
  /// {@macro amplify_secure_storage_dart.amplify_secure_storage_dart}
  AmplifySecureStorageDart({
    required AmplifySecureStorageConfig config,
  }) : super(config: config);
}

class AmplifySecureStorageWorker extends AmplifySecureStorageInterface {
  AmplifySecureStorageWorker({
    required AmplifySecureStorageConfig config,
  }) : super(config: config);

  final _workerMemo = AsyncMemoizer<SecureStorageWorker>();
  Future<SecureStorageWorker> get worker => _workerMemo.runOnce(() async {
        final worker = SecureStorageWorker.create();
        // TODO(dnys1): Log
        worker.logs.listen(safePrint);
        await worker.spawn();
        worker.add(
          SecureStorageRequest(
            (b) => b
              ..action = SecureStorageAction.init
              ..config.replace(config),
          ),
        );
        await worker.stream.first;
        return worker;
      });

  @override
  Future<void> delete({required String key}) async {
    final worker_ = await worker;
    final request = SecureStorageRequest(
      (b) => b
        ..action = SecureStorageAction.delete
        ..key = key,
    );
    worker_.add(request);
    await worker_.stream.firstWhere(
      (event) => event.id == request.id,
    );
  }

  @override
  Future<String?> read({required String key}) async {
    final worker_ = await worker;
    final request = SecureStorageRequest(
      (b) => b
        ..action = SecureStorageAction.read
        ..key = key,
    );
    worker_.add(request);
    final resp = await worker_.stream.firstWhere(
      (event) => event.id == request.id,
    );
    return resp.value;
  }

  @override
  Future<void> write({required String key, required String value}) async {
    final worker_ = await worker;
    final request = SecureStorageRequest(
      (b) => b
        ..action = SecureStorageAction.write
        ..key = key
        ..value = value,
    );
    worker_.add(request);
    await worker_.stream.firstWhere((event) => event.id == request.id);
  }
}
