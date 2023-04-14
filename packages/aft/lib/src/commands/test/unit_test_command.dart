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

import 'dart:async';
import 'dart:io';

import 'package:aft/aft.dart';
import 'package:aft/src/test_reports/print_results.dart';
import 'package:aft/src/test_reports/test_folio.dart';
import 'package:path/path.dart' as p;

/// Command to run Flutter and Dart unit tests.
class UnitTestCommand extends BaseTestCommand {
  UnitTestCommand() {
    argParser.addOption(
      'platform',
      abbr: 'p',
      help: 'Platform to test',
      defaultsTo: 'vm',
      allowed: [
        'vm',
        'chrome',
        'firefox',
        'safari',
        'wasm',
      ],
    );
  }

  @override
  String get description => 'Runs Flutter and Dart unit tests';

  @override
  String get name => 'unit';

  late final platform = argResults!['platform'] as String;

  late final bool isWasm = platform == 'wasm';

  Future<void> compileWasmTests(PackageInfo package) async {
    // Write tester to `build` directory.
    File(
      p.join(
        package.path,
        'build',
        'test_dart2wasm.js',
      ),
    )
      ..createSync(recursive: true)
      ..writeAsStringSync(_testWasmJs);

    final testFiles = package.unitTestDirectory!
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => p.basename(file.path).endsWith('_test.dart'));
    for (final file in testFiles) {
      final relativePath = p.relative(
        file.path,
        from: package.unitTestDirectory!.path,
      );
      final outputPath = p.join(
        'build',
        '${p.basenameWithoutExtension(relativePath)}.browser_test.dart.wasm',
      );
      final outputDir = Directory(p.dirname(outputPath));
      if (!outputDir.existsSync()) {
        outputDir.createSync(recursive: true);
      }

      const sdkPath =
          '/Users/dillonnys/dev/dart-sdk/sdk/xcodebuild/ReleaseARM64/dart-sdk';
      final dartAotRuntime = p.join(sdkPath, 'bin', 'dartaotruntime');
      final arguments = [
        p.join(
          sdkPath,
          'bin',
          'snapshots',
          'dart2wasm_product.snapshot',
        ),
        '--enable-asserts',
        '--dart-sdk=$sdkPath',
        '--libraries-spec=${p.join(sdkPath, 'lib', 'libraries.json')}',
        p.join(package.unitTestDirectory!.path, relativePath),
        outputPath,
      ];

      logger.info(
        'Compiling $relativePath to $outputPath: "dart $arguments"...',
      );
      final proc = await Process.start(
        dartAotRuntime,
        arguments,
        workingDirectory: package.path,
        mode: ProcessStartMode.inheritStdio,
      );
      if (await proc.exitCode != 0) {
        exitError('Failed to compile tests to WebAssembly');
      }
    }
  }

  @override
  Future<void> run() async {
    await super.run();
    final packageToTest = await this.packageToTest;
    if (packageToTest.unitTestDirectory == null) {
      exitError('No unit tests for package');
    }

    final folioBuilder = TestFolioBuilder()..testType = TestType.unit;

    if (isWasm) {
      await compileWasmTests(packageToTest);
    }

    final testReports = await executeTests(
      packageToTest,
      arguments: argResults!.rest,
    );
    folioBuilder.addReports(testReports);

    final folio = folioBuilder.build();
    printResults(folio);
    exitCode = folio.exitCode;
  }
}

const _testWasmJs = r'''
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// This script runs in HTML files and loads and instantiates dart unit tests
// that are compiled to WebAssembly. It is based off of the `test/dart.js`
// script from the `test` dart package.

window.onload = async function () {
  // Sends an error message to the server indicating that the script failed to
  // load.
  //
  // This mimics a MultiChannel-formatted message.
  var sendLoadException = function (message) {
    window.parent.postMessage({
      "href": window.location.href,
      "data": [0, { "type": "loadException", "message": message }],
      "exception": true,
    }, window.location.origin);
  }

  // Listen for dartLoadException events and forward to the server.
  window.addEventListener('dartLoadException', function (e) {
    sendLoadException(e.detail);
  });

  // The basename of the current page.
  var name = window.location.href.replace(/.*\//, '').replace(/#.*/, '');

  // Find <link rel="x-dart-test">.
  var links = document.getElementsByTagName("link");
  var testLinks = [];
  var length = links.length;
  for (var i = 0; i < length; ++i) {
    if (links[i].rel == "x-dart-test") testLinks.push(links[i]);
  }

  if (testLinks.length != 1) {
    sendLoadException(
      'Expected exactly 1 <link rel="x-dart-test"> in ' + name + ', found ' +
      testLinks.length + '.');
    return;
  }

  var link = testLinks[0];

  if (link.href == '') {
    sendLoadException(
      'Expected <link rel="x-dart-test"> in ' + name + ' to have an "href" ' +
      'attribute.');
    return;
  }

  let dart2wasm_runtime;
  let moduleInstance;
  try {
    dart2wasm_runtime = await import('./dart2wasm_runtime.mjs');
    const dartModulePromise = WebAssembly.compileStreaming(fetch(link.href + ".browser_test.dart.wasm"));
    moduleInstance = await dart2wasm_runtime.instantiate(dartModulePromise, {});
  } catch (exception) {
    const message = `Failed to fetch and instantiate wasm module: ${exception}`;
    sendLoadException(message);
  }

  if (moduleInstance) {
    try {
      await dart2wasm_runtime.invoke(moduleInstance);
    } catch (exception) {
      const message = `Exception while invoking test: ${exception}`;
      sendLoadException(message);
    }
  }
};
''';
