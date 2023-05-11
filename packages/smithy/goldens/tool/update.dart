// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:collection/collection.dart';
import 'package:git/git.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:yaml_edit/yaml_edit.dart';

import 'generate.dart';

/// Updates the Smithy models in `models` and the version used in JNI.
Future<void> main(List<String> args) async {
  final smithyVersion = await updateModels(
    overrideSmithyVersion: args.firstOrNull,
  );

  final mavenDeps = [
    'software.amazon.smithy:smithy-model:$smithyVersion',
    'software.amazon.smithy:smithy-aws-apigateway-traits:$smithyVersion',
    'software.amazon.smithy:smithy-aws-cloudformation-traits:$smithyVersion',
    'software.amazon.smithy:smithy-aws-iam-traits:$smithyVersion',
    'software.amazon.smithy:smithy-aws-traits:$smithyVersion',
    'software.amazon.smithy:smithy-mqtt-traits:$smithyVersion',
    'software.amazon.smithy:smithy-protocol-test-traits:$smithyVersion',
    'software.amazon.smithy:smithy-validation-model:$smithyVersion',
  ];

  final smithyBuild = File.fromUri(
    Platform.script.resolve('../smithy-build.json'),
  );
  smithyBuild.writeAsStringSync(
    prettyPrintJson({'mavenDependencies': mavenDeps}),
  );

  final jniGen = File.fromUri(
    Platform.script.resolve('../jnigen.yaml'),
  );
  final jniGenYaml = YamlEditor(jniGen.readAsStringSync());
  jniGenYaml.update(['maven_downloads', 'source_deps'], mavenDeps);
  jniGen.writeAsStringSync(jniGenYaml.toString());

  // Re-run jnigen
  Directory.fromUri(
    Platform.script.resolve('../mvn_jar'),
  ).deleteSync(recursive: true);
  Directory.fromUri(
    Platform.script.resolve('../mvn_java'),
  ).deleteSync(recursive: true);
  await _run(['dart', 'run', 'jni:setup']);
  await _run(['dart', 'run', 'jnigen', '--config=jnigen.yaml']);
}

Future<void> _run(List<String> args) async {
  final process = await Process.start(
    args.first,
    args.sublist(1),
    mode: ProcessStartMode.inheritStdio,
    runInShell: true,
    workingDirectory: Platform.script.resolve('..').toFilePath(),
  );
  if (await process.exitCode != 0) {
    throw Exception('Could not run `${args.join(' ')}`');
  }
}

/// Updates v2 models from git and returns the latest Smithy version.
///
/// v1 models are no longer committed to git and are fixed at the last commit
/// in which they were updated.
Future<String> updateModels({
  String? overrideSmithyVersion,
}) async {
  const url = 'https://github.com/awslabs/smithy';
  final tmpDir = Directory.systemTemp.createTempSync('smithy');
  final process = await Process.start(
    'git',
    [
      'clone',
      url,
      tmpDir.path,
    ],
    mode: ProcessStartMode.inheritStdio,
    workingDirectory: Directory.current.path,
  );
  if (await process.exitCode != 0) {
    stderr.writeln('Could not clone $url');
    exit(1);
  }
  final repo = await GitDir.fromExisting(tmpDir.path);

  var smithyVersion = overrideSmithyVersion;
  if (smithyVersion == null) {
    final refs = await repo.showRef(tags: true);
    final tags = refs.map((ref) {
      try {
        return Version.parse(ref.reference.split('/').last);
      } on FormatException {
        return null;
      }
    }).nonNulls;
    final latestTag = maxBy(tags, (tag) => tag)!;
    stdout.writeln('Latest tag: $latestTag');
    smithyVersion = latestTag.toString();
  }
  await repo.runCommand(['checkout', smithyVersion]);
  for (final protocol in awsProtocols) {
    final src = path.join(
      tmpDir.path,
      'smithy-aws-protocol-tests',
      'model',
      protocol,
    );
    final dest = _replaceDirectory(
      path.join(modelsPath, protocol),
    );
    await _copy(src, dest);
  }

  // Copy shared types
  final sharedPath = _replaceDirectory(
    path.join(modelsPath, 'shared'),
    create: true,
  );
  const sharedModels = [
    'aws-config.smithy',
    'shared-types.smithy',
  ];
  for (final sharedModel in sharedModels) {
    final sourcePath = path.join(
      tmpDir.path,
      'smithy-aws-protocol-tests',
      'model',
      sharedModel,
    );
    await _copy(sourcePath, sharedPath);
  }

  // Replace `coral` references
  final allModelFiles =
      Directory(modelsPath).listSync(recursive: true).whereType<File>();
  for (final file in allModelFiles) {
    final content = file.readAsStringSync();
    file.writeAsStringSync(content.replaceAll('coral', 'example'));
  }

  return smithyVersion;
}

String _replaceDirectory(String path, {bool create = false}) {
  final dir = Directory(path);
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
  if (create) {
    dir.createSync(recursive: true);
  }
  return path;
}

Future<void> _copy(String from, String to) async {
  final process = await Process.start(
    'cp',
    ['-R', from, to],
    mode: ProcessStartMode.inheritStdio,
    workingDirectory: Directory.current.path,
  );
  if (await process.exitCode != 0) {
    stderr.writeln('Could not copy $from to $to');
    exit(1);
  }
}
