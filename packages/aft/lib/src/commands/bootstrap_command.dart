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

import 'package:aft/aft.dart';
import 'package:aft/src/util.dart';
import 'package:async/async.dart';
import 'package:path/path.dart' as path;
import 'package:pool/pool.dart';
import 'package:yaml_edit/yaml_edit.dart';

/// Command to bootstrap/link Dart/Flutter packages in the repo.
class BootstrapCommand extends AmplifyCommand {
  @override
  String get description => 'Links all packages in the Amplify Flutter repo '
      'to prepare for local development';

  @override
  String get name => 'bootstrap';

  @override
  List<String> get aliases => ['bs'];

  /// Pool for spawned processes, to keep the number of Dart instances at bay.
  final Pool _processPool = Pool(8);

  /// Creates an empty `amplifyconfiguration.dart` file.
  Future<void> _createEmptyConfig(PackageInfo package) async {
    // Only create for example apps.
    if (package.pubspecInfo.pubspec.publishTo == null) {
      return;
    }
    final file = File(
      path.join(package.path, 'lib', 'amplifyconfiguration.dart'),
    );
    if (await file.exists() ||
        !await Directory(path.join(package.path, 'lib')).exists()) {
      return;
    }
    await file.create();
    await file.writeAsString(
      '''
const amplifyconfig = \'\'\'{
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0"
}\'\'\';
''',
    );
  }

  /// Creates a `pubspec_overrides.yaml` file for [package].
  Future<void> _createPubspecOverride(
    PackageInfo package,
    Map<String, String> dependencyPaths,
  ) async {
    final yaml = YamlEditor(
      '''
# Generated with `aft`. Do not modify by hand or check into source control.
dependency_overrides:
''',
    )..update(
        ['dependency_overrides'],
        dependencyPaths.map((name, path) => MapEntry(name, {'path': path})),
      );
    await File(path.join(package.path, 'pubspec_overrides.yaml'))
        .writeAsString(yaml.toString());
  }

  Future<void> _pubUpgrade(PackageInfo package) async {
    final cmd = await _processPool.withResource(() {
      return Process.start(
        package.flavor.entrypoint,
        ['pub', 'upgrade'],
        workingDirectory: package.path,
      );
    });
    final errors = StringBuffer();
    cmd.captureStderr(sink: errors.writeln);
    if (verbose) {
      cmd
        ..captureStdout(prefix: '[${package.name}] ')
        ..captureStderr(prefix: '[${package.name}] ');
    }
    if (await cmd.exitCode != 0) {
      exitError(
        'Error running `${package.flavor.entrypoint} pub upgrade` '
        'for ${package.name}:\n'
        '$errors',
      );
    }
  }

  /// Collects all direct and transitive dependencies
  Map<String, String> _collectDependencies(
    PackageInfo rootPackage,
    Map<String, PackageInfo> allPackages,
  ) {
    final dependencyPaths = <String, String>{};
    final seen = <String>{};

    void collectSubdependencies(PackageInfo package) {
      if (seen.contains(package.name)) {
        return;
      }
      seen.add(package.name);
      final localDeps = [
        ...package.pubspecInfo.pubspec.dependencies.keys,
        ...package.pubspecInfo.pubspec.devDependencies.keys,
      ].map((dep) => allPackages[dep]).whereType<PackageInfo>();
      for (final dependency in localDeps) {
        if (dependency.name == rootPackage.name) {
          continue;
        }
        dependencyPaths[dependency.name] =
            path.relative(dependency.path, from: rootPackage.path);
        collectSubdependencies(dependency);
      }
    }

    collectSubdependencies(rootPackage);
    return dependencyPaths;
  }

  @override
  Future<void> run() async {
    final localPackageMap = await allPackages;

    final futureGroup = FutureGroup<void>();
    for (final package in localPackageMap.values) {
      final dependencyPaths = _collectDependencies(package, localPackageMap);
      futureGroup.add(
        () async {
          await _createEmptyConfig(package);
          await _createPubspecOverride(package, dependencyPaths);
          await _pubUpgrade(package);
        }(),
      );
    }
    futureGroup.close();
    await futureGroup.future;

    stdout.writeln('Packages successfully linked!');
  }
}
