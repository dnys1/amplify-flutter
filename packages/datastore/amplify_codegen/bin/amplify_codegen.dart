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

import 'dart:io';

import 'package:amplify_codegen/src/generate.dart';
import 'package:amplify_codegen/src/model/codegen_plugin_service.dart';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:smithy/src/http/http_server.dart';

void main(List<String> args) async {
  final argParser = ArgParser()..addFlag('serve', defaultsTo: false);
  final argResults = argParser.parse(args);
  if (argResults['serve'] as bool) {
    final server = await shelf_io.serve(
      CodegenPluginServer(),
      InternetAddress.loopbackIPv4,
      3000,
    );
    print('Serving on ${server.address.address}:${server.port}');
  } else {
    await codegenProject(Directory.current.path);
  }
}

class CodegenPluginServer extends CodegenPluginServerBase {
  @override
  Future<void> codegen(CodegenRequest input, Context context) async {
    print('Got request: $input');
  }

  @override
  Future<Response> handleUncaughtError(Object error, StackTrace st) {
    throw UnimplementedError();
  }
}

Future<void> codegenProject(String projectRoot) async {
  final apiDir = Directory.fromUri(
    Uri.file(projectRoot).resolve('amplify/backend/api/'),
  );
  final apis = apiDir.listSync().whereType<Directory>();
  if (apis.length != 1) {
    throw CodegenError(
      message: 'Expected exactly one API, '
          'found ${apis.length} in ${apiDir.path}',
    );
  }
  final schemaPath = apis.single.uri.resolve('schema.graphql').toFilePath();
  final schema = File(schemaPath).readAsStringSync();
  stdout.writeln('Generating schema for $schemaPath');
  final generated = generateForSchema(schema);
  final outputPath = Directory.current.uri.resolve('lib/models/').toFilePath();
  final outputDir = Directory(outputPath)..createSync(recursive: true);
  for (final entry in generated.entries) {
    final filename = entry.key;
    stdout.writeln('  -- Generated $filename');
    File.fromUri(outputDir.uri.resolve(filename))
        .writeAsStringSync(entry.value.emit());
  }
  Process.runSync('dart', ['fix', '--apply', outputPath]);
  Process.runSync('dart', ['format', '--fix', outputPath]);
}
