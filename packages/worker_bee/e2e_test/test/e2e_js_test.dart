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

@TestOn('browser')

import 'package:e2e_test/e2e_test.dart';
import 'package:e2e_test/src/workers.debug.compiled.dart' as debug;
import 'package:e2e_test/src/workers.release.compiled.dart' as release;
import 'package:test/test.dart';

void main() {
  Future<String> loadDebug() async {
    return debug.workerJs;
  }

  Future<String> loadRelease() async {
    return release.workerJs;
  }

  group('WorkerBee', () {
    group('', () {
      test(
        'dart2Js',
        () => testWorker(
          jsEntrypoint: 'packages/e2e_test/src/workers.debug.js',
        ),
      );

      test(
        'dart2Js (m, O4)',
        () => testWorker(
          jsEntrypoint: 'packages/e2e_test/src/workers.release.js',
        ),
      );
    });

    group('| no result', () {
      test(
        'dart2Js',
        () => testWorkerNoResult(loader: loadDebug),
      );

      test(
        'dart2Js (m, O4)',
        () => testWorkerNoResult(loader: loadRelease),
      );
    });

    group('| void result', () {
      test(
        'dart2Js',
        () => testWorkerVoidResult(loader: loadDebug),
      );

      test(
        'dart2Js (m, O4)',
        () => testWorkerVoidResult(loader: loadRelease),
      );
    });

    group('| null result', () {
      test(
        'dart2Js',
        () => testWorkerNullResult(loader: loadDebug),
      );

      test(
        'dart2Js (m, O4)',
        () => testWorkerNullResult(loader: loadRelease),
      );
    });

    group('| throws', () {
      test(
        'dart2Js',
        () => testWorkerThrows(loader: loadDebug),
      );

      test(
        'dart2Js (m, O4)',
        () => testWorkerThrows(loader: loadRelease),
      );
    });
  });
}
