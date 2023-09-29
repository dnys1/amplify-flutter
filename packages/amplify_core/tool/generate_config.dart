#!/usr/bin/env dart
// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:convert';
import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:jni/jni.dart';
import 'package:path/path.dart' as path;
import 'package:smithy/ast.dart' hide ServiceShape;
import 'package:smithy/ast.dart' as smithy_ast;
import 'package:smithy_codegen/smithy_codegen.dart';
import 'package:smithy_codegen/src/generator/types.dart';

import 'smithy.g.dart';

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
  final tempOutputs =
      Directory.systemTemp.createTempSync('amplify_core_config_');
  final ast = await _transform(
    tempOutputs: tempOutputs,
  );
  stdout.writeln('Generated AST: $ast');
  await _generateFor(ast: ast);
}

Future<SmithyAst> _transform({
  required Directory tempOutputs,
}) async {
  stdout.writeln('Generating AST...');

  final modelImport = Platform.script.resolve('../model').toFilePath();

  var model = Model.assembler().use(
    (assembler) => assembler
        .discoverModels1()
        .addImport(modelImport.toJString())
        .assemble()
        .unwrap(),
  );

  ModelTransformer.create().use((transformer) {
    model = transformer.changeStringEnumsToEnumShapes1(model);
    model = transformer.flattenAndRemoveMixins(model);
    model = transformer.getModelWithoutTraitShapes(model);
  });

  final serializer = ModelSerializer.builder().use(
    (b) => b.includePrelude(false).build(),
  );
  final jsonRef = serializer.use((serializer) {
    return Node.prettyPrintJson(
      Node.fromRef(serializer.serialize(model).reference),
    );
  });

  return parseAstJson(jsonRef.toDartString(deleteOriginal: true));
}

Future<void> _generateFor({
  required SmithyAst ast,
}) async {
  final outputPath = path.join(
    'lib',
    'src',
    'generated',
  );
  final dir = Directory(outputPath);
  if (dir.existsSync()) {
    dir.deleteSync(recursive: true);
  } else {
    dir.createSync(recursive: true);
  }

  // Add dummy service
  ast = ast.rebuild((b) {
    final serviceShape = smithy_ast.ServiceShape(
      (s) => s
        ..shapeId = const ShapeId(
          namespace: 'com.amazonaws.amplify.core',
          shape: 'AmplifyConfigurationService',
        ),
    );

    b.shapes![serviceShape.shapeId] = serviceShape;
  });

  const packageName = 'amplify_core';
  const topLevelConfig = ShapeId(
    namespace: 'com.amazonaws.amplify.core',
    shape: 'AWSAmplifyConfig',
  );
  const localStorageSizeSymbol = Reference(
    'LocalStorageSize',
    'package:amplify_core/amplify_config.dart',
  );
  final outputs = generateForAst(
    ast,
    packageName: packageName,
    // Don't generate the top-level type. We'll create the wrapper ourselves
    // so that we can specialize that interface.
    //
    // If we had static extensions, we wouldn't need this, since we could
    // extend with a static `parse` or `fromJson` method.
    additionalShapes: ast.shapes.keys.where((id) => id != topLevelConfig),
    generateServer: true,
    basePath: 'src/generated',
    shapeOverrides: {
      ShapeId.parse('com.amazonaws.amplify.core#Uri'):
          ShapeOverrides(DartTypes.core.uri),
      ShapeId.parse('com.amazonaws.amplify.core#LogLevel'):
          const ShapeOverrides(
        Reference('LogLevel', 'package:amplify_core/amplify_core.dart'),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#UserLogLevel'):
          const ShapeOverrides(
        Reference('UserLogLevel', 'package:amplify_core/amplify_core.dart'),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#AmplifyCategory'):
          const ShapeOverrides(
        Reference('Category', 'package:amplify_core/amplify_core.dart'),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#AuthFlowType'):
          const ShapeOverrides(
        Reference(
          'AuthenticationFlowType',
          'package:amplify_core/amplify_core.dart',
        ),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#AuthMfaType'):
          const ShapeOverrides(
        Reference('MfaType', 'package:amplify_core/amplify_core.dart'),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#AuthMfaEnforcementLevel'):
          const ShapeOverrides(
        Reference('MfaStatus', 'package:amplify_core/amplify_config.dart'),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#AuthProvider'):
          const ShapeOverrides(
        Reference('AuthProvider', 'package:amplify_core/amplify_core.dart'),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#AuthUserAttributeKey'):
          const ShapeOverrides(
        Reference(
          'CognitoUserAttributeKey',
          'package:amplify_core/amplify_core.dart',
        ),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#StorageAccessLevel'):
          const ShapeOverrides(
        Reference(
          'StorageAccessLevel',
          'package:amplify_core/amplify_core.dart',
        ),
      ),
      ShapeId.parse('com.amazonaws.amplify.core#Seconds'):
          ShapeOverrides.friendly(
        friendlySymbol: const Reference('Duration'),
        transformFromFriendly: (
          Expression ref, {
          required bool isNullable,
        }) {
          final getter = isNullable ? ref.nullSafeProperty : ref.property;
          return getter('inSeconds');
        },
        transformToFriendly: (
          Expression value, {
          required bool isNullable,
          required bool isConst,
        }) {
          final constructor = isConst
              ? refer('Duration').constInstance
              : refer('Duration').newInstance;
          return constructor([], {'seconds': value});
        },
      ),
      ShapeId.parse('com.amazonaws.amplify.core#Megabytes'):
          ShapeOverrides.friendly(
        friendlySymbol: localStorageSizeSymbol,
        transformFromFriendly: (Expression ref, {required bool isNullable}) {
          final getter = isNullable ? ref.nullSafeProperty : ref.property;
          return getter('inMegabytes');
        },
        transformToFriendly: (
          Expression value, {
          required bool isNullable,
          required bool isConst,
        }) {
          final constructor = isConst
              ? localStorageSizeSymbol.constInstanceNamed
              : localStorageSizeSymbol.newInstanceNamed;
          return constructor('MB', [value]);
        },
      ),
    },
  );

  final dependencies = <String>{};
  for (final library in outputs.values.expand((out) => out.libraries)) {
    if (library.smithyLibrary.libraryType case final libraryType
        when libraryType != SmithyLibrary_LibraryType.MODEL &&
            libraryType != SmithyLibrary_LibraryType.COMMON) {
      continue;
    }
    final smithyLibrary = library.smithyLibrary;
    final outPath = smithyLibrary.projectRelativePath;
    final output = library.emit();
    dependencies.addAll(library.dependencies);
    File(outPath)
      ..createSync(recursive: true)
      ..writeAsStringSync(output);
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
    stderr.write(
      '`dart run build_runner build` failed for $outputPath: $exitCode.',
    );
    exit(exitCode);
  }
}
