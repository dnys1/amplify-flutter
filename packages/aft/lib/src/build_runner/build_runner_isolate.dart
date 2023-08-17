// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:build_runner/build_script_generate.dart';
import 'package:build_runner_core/build_runner_core.dart';
import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;
import 'package:retry/retry.dart';
import 'package:stack_trace/stack_trace.dart';

/// Runs `build_runner` in [packageRoot] using an [Isolate].
///
/// Creates a custom build script using `build_runner` directly, then
/// spawns an isolate using [Isolate.spawnUri]. The default build
/// script cannot be used directly since there is no way to communicate
/// the package in which to run the script otherwise.
Future<void> runBuildRunnerIsolate(String packageRoot) async {
  // Generate the default build script to create directories and necessary sums.
  final buildRunnerCmd = await Process.run(
    'dart',
    [
      'run',
      'build_runner',
      'generate-build-script',
    ],
    workingDirectory: packageRoot,
  );
  final exitCode = buildRunnerCmd.exitCode;
  if (exitCode != 0) {
    throw Exception(
      '`dart run build_runner generate-build-script` failed '
      '($exitCode): ${buildRunnerCmd.stdout}\n${buildRunnerCmd.stderr}.',
    );
  }

  // Isolate.spawnUri requires the current directory to be overriden
  // otherwise it will treat the directory from which this script
  // is executed as the current directory.
  final scriptPath = await Isolate.run(() async {
    final packageGraph = await PackageGraph.forPath(packageRoot);
    final builderApplications = await findBuilderApplications(
      packageGraph: packageGraph,
    );
    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      useNullSafetySyntax: true,
    );
    final sendPort = refer('SendPort', 'dart:isolate');
    final run = refer('run', 'package:build_runner/build_runner.dart');
    final directory = refer('Directory', 'dart:io');
    final library = Library(
      (b) => b
        ..body.addAll([
          declareFinal('_builders')
              .assign(
                literalList(
                  builderApplications,
                  refer(
                    'BuilderApplication',
                    'package:build_runner_core/build_runner_core.dart',
                  ),
                ),
              )
              .statement,
          Code.scope(
            (allocate) => '''
void main(List<String> args, ${allocate(sendPort)} sendPort) async {
  // Override the current directory to the package's root so that this
  // can be run from an isolate in any directory.
  ${allocate(directory)}.current = r'$packageRoot';
  final result = await ${allocate(run)}(
    args,
    _builders,
  );
  sendPort.send(result);
}
''',
          ),
        ]),
    );
    final scriptPath = p.join(
      packageRoot,
      '.dart_tool',
      'build',
      'entrypoint',
      'aft_build.dart',
    );
    await File(scriptPath).writeAsString(
      library.accept(emitter).toString(),
    );
    return scriptPath;
  });

  final result = ReceivePort();
  final onError = ReceivePort();
  await retry(
    () => Isolate.spawnUri(
      p.toUri(scriptPath),
      ['build', '--delete-conflicting-outputs'],
      result.sendPort,
      packageConfig: p.toUri(
        p.join(packageRoot, '.dart_tool', 'package_config.json'),
      ),
      onError: onError.sendPort,
    ),
    onRetry: (e) {
      print(
        'Error spawning build script isolate, this is likely due to a Dart '
        'SDK update. Retrying...',
      );
      result.close();
      onError.close();
    },
    retryIf: (e) => e is IsolateSpawnException,
    maxAttempts: 2,
  );
  final resultCode = await Future.any([
    result.first.then((res) => res as int),
    onError.first.then((err) {
      final [error, stackTrace as String] = err as List<Object>;
      return Future<int>.error(error, Trace.parse(stackTrace).terse);
    }),
  ]);
  if (resultCode != 0) {
    throw Exception('`dart run build_runner build` failed: $resultCode.');
  }
}
