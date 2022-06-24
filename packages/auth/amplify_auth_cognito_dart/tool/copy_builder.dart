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

import 'package:build/build.dart';

/// Factory for the build script.
Builder copyBuilder(BuilderOptions options) => _CopyBuilder(options);

/// Copies the generated workers to [_publishedWorkersJs].
class _CopyBuilder extends Builder {
  _CopyBuilder(this.options);

  final BuilderOptions options;
  bool get isDebug => options.config['debug'] as bool;

  late final _publishedWorkersJs = AssetId(
    'amplify_auth_cognito_dart',
    isDebug
        ? 'lib/src/workers.js.debug.dart'
        : 'lib/src/workers.js.release.dart',
  );

  @override
  late final Map<String, List<String>> buildExtensions = {
    'lib/src/workers.*.dart.js': [
      'lib/src/workers.js.debug.dart',
      'lib/src/workers.js.release.dart'
    ]
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    // if (buildStep.inputId != _generatedWorkersJs) {
    //   throw StateError(
    //     'Unexpected input for `CopyBuilder` expected only $_generatedWorkersJs',
    //   );
    // }
    print(buildStep.inputId);

    final library = '''
/// Compiled workers (${isDebug ? 'Debug' : 'Release'} mode)
const workerJs = r\'\'\'
${await buildStep.readAsString(buildStep.inputId)}
\'\'\';
''';
    await buildStep.writeAsString(_publishedWorkersJs, library);
  }
}
