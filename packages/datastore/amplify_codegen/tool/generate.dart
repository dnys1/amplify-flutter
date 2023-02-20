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

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:smithy_codegen/smithy_codegen.dart';

const packageName = 'amplify_codegen';
final outputPath = path.join(
  path.dirname(Platform.script.path),
  '..',
  'lib',
);

Future<void> main(List<String> arguments) async {
  final smithyJson = File(
    path.join(
      path.dirname(Platform.script.path),
      '..',
      '.dart_tool',
      'model.json',
    ),
  ).readAsStringSync();
  final smithyAst = parseAstJson(smithyJson);

  // Generate SDK for combined operations
  final libraries = generateForAst(
    smithyAst,
    packageName: packageName,
    basePath: 'src/model',
    generateServer: true,
  );

  final dependencies = <String>{};
  for (final library in libraries.values.expand((lib) => lib.libraries)) {
    final smithyLibrary = library.smithyLibrary;
    final outPath = path.join(
      outputPath,
      smithyLibrary.libRelativePath,
    );
    final output = library.emit();
    dependencies.addAll(library.dependencies);
    final outFile = File(outPath);
    await outFile.create(recursive: true);
    await outFile.writeAsString(output);
  }

  // Run built_value generator
  final buildRunnerCmd = await Process.start(
    'dart',
    [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ],
  );
  buildRunnerCmd.stdout
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen(stdout.writeln);
  buildRunnerCmd.stderr
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen(stderr.writeln);
  final exitCode = await buildRunnerCmd.exitCode;
  if (exitCode != 0) {
    exitError('`dart run build_runner build` failed: $exitCode.');
  }

  stdout
    ..writeln('Successfully generated SDK')
    ..writeln('Make sure to add the following dependencies:');
  for (final dep in dependencies.toList()..sort()) {
    stdout.writeln('- $dep');
  }
}

Never exitError(Object error) {
  stderr.writeln(error);
  exit(1);
}
