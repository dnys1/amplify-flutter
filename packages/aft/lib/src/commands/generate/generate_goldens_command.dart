// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:aft/aft.dart';
import 'package:aws_common/aws_common.dart';
import 'package:file/local.dart';
import 'package:git/git.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:smithy/ast.dart';
import 'package:smithy_codegen/smithy_codegen.dart';
import 'package:stream_transform/stream_transform.dart';

const skipProtocols = [
  'shared',
];
const awsProtocols = [
  'awsJson1_0',
  'awsJson1_1',
  'awsQuery',
  'ec2Query',
  'restJson1',
  'restXml',
  'restXmlWithNamespace',
];
// Skip generating V1 since we use V2-specific traits and test descriptions.
const skipV1 = [
  'custom',
];

/// Command for generating the AWS SDK for a given package and `sdk.yaml` file.
class GenerateGoldensCommand extends AmplifyCommand {
  GenerateGoldensCommand() {
    argParser.addFlag(
      'update',
      help: 'Whether to update test models from git',
      defaultsTo: false,
      negatable: false,
    );
  }

  @override
  String get name => 'goldens';

  @override
  String get description => 'Generates Smithy goldens';

  @override
  bool get hidden => true;

  late final goldensRoot = p.join(rootDir.path, 'packages/smithy/goldens');
  late final modelsPath = p.join(goldensRoot, 'models');
  late final update = argResults!['update'] as bool;

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
      workingDirectory: goldensRoot,
    );
    if (await process.exitCode != 0) {
      stderr.writeln('Could not copy $from to $to');
      exit(1);
    }
  }

  /// Updates v2 models from git.
  ///
  /// v1 models are no longer committed to git and are fixed at the last commit
  /// in which they were updated.
  Future<void> updateModels() async {
    const url = 'https://github.com/awslabs/smithy';
    final tmpDir = await Directory.systemTemp.createTemp('smithy');
    final process = await Process.start(
      'git',
      [
        'clone',
        url,
        tmpDir.path,
      ],
      mode: ProcessStartMode.inheritStdio,
    );
    if (await process.exitCode != 0) {
      stderr.writeln('Could not clone $url');
      exit(1);
    }

    final versions = await repo.git
        .tags()
        .map((tag) {
          try {
            return Version.parse(tag.tag);
          } on Object {
            return null;
          }
        })
        .whereNotNull()
        .toList();
    versions.sort();
    final latestVersion = versions.last.toString();
    logger.info('Updating models to Smithy $latestVersion');

    final gitDir = await GitDir.fromExisting(tmpDir.path);
    await gitDir.runCommand(
      ['checkout', latestVersion],
      echoOutput: false,
      throwOnError: true,
    );

    for (final protocol in awsProtocols) {
      final src = p.join(
        tmpDir.path,
        'smithy-aws-protocol-tests',
        'model',
        protocol,
      );
      final dest = _replaceDirectory(
        p.join(modelsPath, protocol),
      );
      await _copy(src, dest);
    }

    // Copy shared types
    final sharedPath = _replaceDirectory(
      p.join(modelsPath, 'shared'),
      create: true,
    );
    const sharedModels = [
      'aws-config.smithy',
      'shared-types.smithy',
    ];
    for (final sharedModel in sharedModels) {
      final sourcePath = p.join(
        tmpDir.path,
        'smithy-aws-protocol-tests',
        'model',
        sharedModel,
      );
      await _copy(sourcePath, sharedPath);
    }

    // Replace `coral` references
    final allModelFiles =
        await Directory(modelsPath).list(recursive: true).toList();
    for (final file in allModelFiles.whereType<File>()) {
      final content = await file.readAsString();
      await file.writeAsString(content.replaceAll('coral', 'example'));
    }

    // Update smithy-build.json and smithy-version
    final smithyBuildJson = File(p.join(goldensRoot, 'smithy-build.json'));
    await smithyBuildJson.writeAsString(
      prettyPrintJson({
        'mavenDependencies': [
          'software.amazon.smithy:smithy-model:$latestVersion',
          'software.amazon.smithy:smithy-aws-apigateway-traits:$latestVersion',
          'software.amazon.smithy:smithy-aws-cloudformation-traits:$latestVersion',
          'software.amazon.smithy:smithy-aws-iam-traits:$latestVersion',
          'software.amazon.smithy:smithy-aws-traits:$latestVersion',
          'software.amazon.smithy:smithy-mqtt-traits:$latestVersion',
          'software.amazon.smithy:smithy-protocol-test-traits:$latestVersion',
          'software.amazon.smithy:smithy-validation-model:$latestVersion',
        ],
      }),
    );
    final smithyVersion = File(p.join(goldensRoot, 'smithy-version'));
    await smithyVersion.writeAsString(latestVersion);
  }

  Future<SmithyAst> _transform(
    SmithyVersion version,
    String modelPath, {
    required String protocolName,
    required String tempOutputsPath,
  }) async {
    stdout.writeln('Generating AST for $modelPath');

    final tempModel = File(
      p.join(tempOutputsPath, '${modelPath}_${version.name}.json'),
    );
    final result = await Process.run(
      './gradlew',
      [
        'run',
        '--args="$modelsPath" "${tempModel.path}" "$protocolName" "${version.name.toUpperCase()}"',
      ],
      stdoutEncoding: utf8,
      stderrEncoding: utf8,
      workingDirectory: goldensRoot,
    );
    if (result.exitCode != 0) {
      stderr
        ..write('Could not generate model for $modelPath: ')
        ..writeln(result.stdout)
        ..writeln(result.stderr);
      exit(result.exitCode);
    }

    final astJson = await tempModel.readAsString();
    return parseAstJson(astJson);
  }

  Future<void> _generateFor({
    required SmithyAst ast,
    required SmithyVersion version,
    required String protocolName,
  }) async {
    stdout
        .writeln('Generating Dart client for $protocolName (${version.name})');
    final outputPath = p.join(
      goldensRoot,
      version == SmithyVersion.v1 ? 'lib' : 'lib2',
      protocolName,
    );
    final dir = Directory(outputPath);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }

    final packageName = '${protocolName.snakeCase}_${version.name}';
    final outputs = await Isolate.run(
      () => generateForAst(
        ast,
        packageName: packageName,
        additionalShapes: const [
          ShapeId(namespace: 'aws.protocoltests.config', shape: 'AwsConfig'),
        ],
      ),
    );

    final dependencies = <String>{};
    for (final library in outputs.values.expand((out) => out.libraries)) {
      final smithyLibrary = library.smithyLibrary;
      final outPath = p.join(outputPath, smithyLibrary.projectRelativePath);
      final output = library.emit();
      dependencies.addAll(library.dependencies);
      final outFile = File(outPath);
      await outFile.create(recursive: true);
      await outFile.writeAsString(output);
    }

    // Create dummy pubspec
    final pubspecPath = p.join(outputPath, 'pubspec.yaml');
    final pubspec = Pubspec(packageName);
    final localSmithyPath = Directory(goldensRoot).uri.resolve('..').path;
    final pubspecYaml = await Isolate.run(
      () => PubspecGenerator(
        pubspec,
        dependencies,
        smithyPath: p.relative(localSmithyPath, from: outputPath),
      ).generate(),
    );
    await File(pubspecPath).writeAsString(pubspecYaml);

    // Create analysis options
    final analysisOptionsPath = p.join(outputPath, 'analysis_options.yaml');
    await File(analysisOptionsPath).writeAsString('''
include: package:lints/recommended.yaml

analyzer:
  errors:
    avoid_unused_constructor_parameters: ignore
    deprecated_member_use_from_same_package: ignore
    non_constant_identifier_names: ignore
''');

    // Create mono_pkg for testing
    final dartTestPath = p.join(outputPath, 'dart_test.yaml');
    await File(dartTestPath).writeAsString('''
override_platforms:
  firefox:
    settings:
      arguments: -headless
''');

    final buildYamlPath = p.join(outputPath, 'build.yaml');
    await File(buildYamlPath).writeAsString(r'''
targets:
  $default:
    builders:
      built_value_generator:built_value:
        generate_for:
          include:
            - lib/**/model/**.dart
''');

    // Run built_value generator
    final package = PackageInfo.fromDirectory(Directory(outputPath))!;
    await runBuildRunner(
      package,
      logger: logger,
      verbose: verbose,
    );
  }

  @override
  Future<void> run() async {
    await super.run();
    if (update) {
      await updateModels();
    }
    final glob =
        Glob(argResults!.rest.length == 1 ? argResults!.rest.single : '*');
    final futures = <Future<void>>[];
    final entites = await glob
        .listFileSystem(const LocalFileSystem(), root: modelsPath)
        .toList();
    final tempOutputs =
        (await Directory.systemTemp.createTemp('smithy_goldens_')).path;
    for (final modelEnt in entites.whereType<Directory>()) {
      final modelPath = p.relative(modelEnt.path, from: modelsPath);
      final protocolName = p.basename(modelPath);
      if (skipProtocols.contains(protocolName)) {
        continue;
      }
      for (final version in SmithyVersion.values) {
        if (version == SmithyVersion.v1 && skipV1.contains(protocolName)) {
          continue;
        }
        futures.add(() async {
          final ast = await _transform(
            version,
            modelPath,
            protocolName: protocolName,
            tempOutputsPath: tempOutputs,
          );
          return _generateFor(
            ast: ast,
            version: version,
            protocolName: protocolName,
          );
        }());
      }
    }
    await Future.wait<void>(futures);
  }
}
