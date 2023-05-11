// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:convert';
import 'dart:io';

import 'package:aws_common/aws_common.dart';
import 'package:file/local.dart';
import 'package:glob/glob.dart';
import 'package:jni/internal_helpers_for_jnigen.dart';
import 'package:jni/jni.dart';
import 'package:path/path.dart' as path;
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:smithy/ast.dart' hide ServiceShape;
import 'package:smithy_codegen/smithy_codegen.dart';

import 'smithy.g.dart';

final modelsPath = path.join(Directory.current.path, 'models');
const skipProtocols = [
  'shared',
];
const awsProtocols = [
  'awsJson1_0',
  'awsJson1_1',
  'awsQuery',
  'restJson1',
  'restXml',
  'restXmlWithNamespace'
];

Future<void> main(List<String> args) async {
  final jars = Directory.fromUri(Platform.script.resolve('../mvn_jar'))
      .listSync()
      .map((e) => e.path)
      .where((path) => path.endsWith('.jar'))
      .toList();
  stdout.writeln('Found jars:\n${jars.join('\n')}');
  if (jars.isEmpty) {
    stderr.writeln('Must run `dart run jni:setup` first');
    exit(1);
  }
  Jni.spawn(
    dylibDir: Platform.script.resolve('../build/jni_libs').toFilePath(),
    classPath: jars,
  );
  final glob = Glob(args.length == 1 ? args.single : '*');
  final futures = <Future<void> Function()>[];
  final entites = glob.listFileSystemSync(
    const LocalFileSystem(),
    root: modelsPath,
  );
  final tempOutputs = Directory.systemTemp.createTempSync('smithy_goldens_');
  for (final modelEnt in entites.whereType<Directory>()) {
    final modelPath = path.relative(modelEnt.path, from: modelsPath);
    final protocolName = path.basename(modelPath);
    if (skipProtocols.contains(protocolName)) {
      continue;
    }
    for (final version in SmithyVersion.values) {
      final ast = await _transform(
        version,
        modelPath,
        protocolName: protocolName,
        tempOutputs: tempOutputs,
      );
      futures.add(
        () => _generateFor(
          ast: ast,
          version: version,
          protocolName: protocolName,
        ),
      );
    }
  }
  await Future.wait<void>(futures.map((fut) => fut()));
}

Future<SmithyAst> _transform(
  SmithyVersion version,
  String modelPath, {
  required String protocolName,
  required Directory tempOutputs,
}) async {
  stdout.writeln('Generating AST for $modelPath');

  final modelImport =
      Platform.script.resolve('../models/$modelPath').toFilePath();
  final sharedImport = Platform.script.resolve('../models/shared').toFilePath();

  var model = Model.assembler().use((assembler) => assembler
      .discoverModels1()
      .addImport(sharedImport.toJString())
      .addImport(modelImport.toJString())
      .assemble()
      .unwrap());

  ModelTransformer.create().use((transformer) {
    model = transformer.changeStringEnumsToEnumShapes1(model);
    model = transformer.flattenAndRemoveMixins(model);
    final serviceShapes =
        model.getServiceShapes().castTo(JArray.type(ServiceShape.type));
    for (var i = 0; i < serviceShapes.length; i++) {
      final serviceShape = ServiceShape.fromRef(
        serviceShapes.elementAt(i, JniCallType.objectType).object,
      );
      model = transformer.copyServiceErrorsToOperations(model, serviceShape);
    }
    model = switch (version) {
      SmithyVersion.v1 => transformer.downgradeToV1(model),
      _ => model,
    };
    model = transformer.getModelWithoutTraitShapes(model);
  });

  final serializer = ModelSerializer.builder().use(
    (b) => b.includePrelude(false).build(),
  );
  final jsonRef = serializer.use((serializer) {
    // TODO(dnys1): Fix UTF8 encoding.
    /// Does this need support for modified UTF8?
    /// https://docs.oracle.com/javase/8/docs/technotes/guides/jni/spec/types.html#modified_utf_8_strings
    return Node.prettyPrintJson(
      Node.fromRef(serializer.serialize(model).reference),
    );
  });

  return parseAstJson(jsonRef.toDartString());
}

Future<void> _generateFor({
  required SmithyAst ast,
  required SmithyVersion version,
  required String protocolName,
}) async {
  stdout.writeln('Generating Dart client for $protocolName (${version.name})');
  final outputPath = path.join(
    version == SmithyVersion.v1 ? 'lib' : 'lib2',
    protocolName,
  );
  final dir = Directory(outputPath);
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }

  final packageName = '${protocolName.snakeCase}_${version.name}';
  final outputs = generateForAst(
    ast,
    packageName: packageName,
    additionalShapes: const [
      ShapeId(namespace: 'aws.protocoltests.config', shape: 'AwsConfig'),
    ],
    generateServer: true,
  );

  final Set<String> dependencies = {};
  for (var library in outputs.values.expand((out) => out.libraries)) {
    final smithyLibrary = library.smithyLibrary;
    final outPath = path.join(outputPath, smithyLibrary.projectRelativePath);
    final output = library.emit();
    dependencies.addAll(library.dependencies);
    File(outPath)
      ..createSync(recursive: true)
      ..writeAsStringSync(output);
  }

  // Create dummy pubspec
  final pubspecPath = path.join(outputPath, 'pubspec.yaml');
  final pubspec = Pubspec(packageName);
  final localSmithyPath = Directory.current.uri.resolve('..').path;
  final pubspecYaml = PubspecGenerator(
    pubspec,
    dependencies,
    smithyPath: path.relative(localSmithyPath, from: outputPath),
  ).generate();
  File(pubspecPath).writeAsStringSync(pubspecYaml);

  // Create analysis options
  final analysisOptionsPath = path.join(outputPath, 'analysis_options.yaml');
  File(analysisOptionsPath).writeAsStringSync('''
include: package:lints/recommended.yaml

analyzer:
  errors:
    avoid_unused_constructor_parameters: ignore
    deprecated_member_use_from_same_package: ignore
    non_constant_identifier_names: ignore
''');

  // Create mono_pkg for testing
  final dartTestPath = path.join(outputPath, 'dart_test.yaml');
  File(dartTestPath).writeAsStringSync('''
override_platforms:
  firefox:
    settings:
      arguments: -headless
''');

  // Run `dart pub get`
  final pubGetRes = await Process.run(
    'dart',
    [
      'pub',
      'get',
    ],
    workingDirectory: outputPath,
    stdoutEncoding: utf8,
    stderrEncoding: utf8,
  );
  if (pubGetRes.exitCode != 0) {
    stderr.write('`dart pub get` failed for $outputPath: ');
    stderr.writeln(pubGetRes.stdout);
    stderr.writeln(pubGetRes.stderr);
    exit(pubGetRes.exitCode);
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
    workingDirectory: outputPath,
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
    stderr.write(
      '`dart run build_runner build` failed for $outputPath: $exitCode.',
    );
    exit(exitCode);
  }
}
