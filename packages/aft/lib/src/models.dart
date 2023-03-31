// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:io';

import 'package:aft/src/flutter_platform.dart';
import 'package:aft/src/models/raw_config.dart';
import 'package:aft/src/util.dart';
import 'package:aws_common/aws_common.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

export 'models/config.dart';
export 'models/package_selector.dart';
export 'models/raw_config.dart';

/// Packages which report as an example app, but should be considered as
/// publishable for some purposes.
const falsePositiveExamples = [
  'aft',
  'smithy_codegen',
  'smoke_test',
  'amplify_auth_cognito_test',
  'amplify_secure_storage_test',

  // Smithy Golden packages
  'aws_json1_0_v1',
  'aws_json1_1_v1',
  'rest_json1_v1',
  'rest_xml_v1',
  'rest_xml_with_namespace_v1',
  'aws_json1_0_v2',
  'aws_json1_1_v2',
  'rest_json1_v2',
  'rest_xml_v2',
  'rest_xml_with_namespace_v2',
];

/// The flavor of a package, e.g. Dart/Flutter.
enum PackageFlavor {
  flutter('Flutter', 'flutter'),
  dart('Dart', 'dart');

  const PackageFlavor(this.displayName, this.entrypoint);

  final String displayName;
  final String entrypoint;
}

class PubVersionInfo {
  const PubVersionInfo(this.allVersions);

  final List<Version> allVersions;

  Version? get latestVersion =>
      allVersions.where((version) => !version.isPreRelease).lastOrNull;

  /// Absolute path to the package.
  final String path;

  /// The package's pubspec.
  final PubspecInfo pubspecInfo;

  /// The package flavor, e.g. Dart or Flutter.
  final PackageFlavor flavor;

  /// The integration test directory within the enclosing directory, if any
  Directory? get integTestDirectory {
    final expectedPath = p.join(path, 'integration_test');
    final integTestDir = Directory(expectedPath);
    if (!integTestDir.existsSync()) {
      return null;
    }
    return integTestDir;
  }

  /// The unit test directory within the enclosing directory, if any
  Directory? get unitTestDirectory {
    final expectedPath = p.join(path, 'test');
    final unitTestDir = Directory(expectedPath);
    if (!unitTestDir.existsSync()) {
      return null;
    }
    return unitTestDir;
  }

  /// The example app for this package, if any.
  PackageInfo? get example {
    final expectedPath = p.join(path, 'example');
    final exampleDir = Directory(expectedPath);
    if (!exampleDir.existsSync()) {
      return null;
    }
    return PackageInfo.fromDirectory(exampleDir);
  }

  /// The platforms a package supports, typically for example apps.
  List<FlutterPlatform>? get platforms {
    final platforms = <FlutterPlatform>[];
    for (final value in FlutterPlatform.values) {
      final expectedPath = p.join(path, value.name);
      final platformDirectory = Directory(expectedPath);
      if (platformDirectory.existsSync()) {
        platforms.add(value);
      }
    }
    if (platforms.isEmpty) {
      return null;
    }
    return platforms;
  }

  /// Whether the package needs `build_runner` to be run.
  ///
  /// Used as a pre-publish check to ensure that generated code is
  /// up-to-date before publishing.
  bool get needsBuildRunner {
    return pubspecInfo.pubspec.devDependencies.containsKey('build_runner') &&
        // aft should not be used to run `build_runner` in example projects
        (pubspecInfo.pubspec.publishTo != 'none' ||
            falsePositiveExamples.contains(name));
  }

  /// Skip package checks for Flutter packages when running in CI without
  /// Flutter, which may happen when testing Dart-only packages or specific
  /// Dart versions.
  bool get skipChecks {
    final isCI = getEnv('CI') == 'true' || getEnv('CI') == '1';
    return isCI &&
        getEnv('FLUTTER_ROOT') == null &&
        flavor == PackageFlavor.flutter;
  }

  @override
  List<Object?> get props => [
        name,
        path,
        pubspecInfo,
        flavor,
      ];

  @override
  int compareTo(PackageInfo other) {
    return path.compareTo(other.path);
  }

  Version? get latestPrerelease =>
      allVersions.where((version) => version.isPreRelease).lastOrNull;
}

extension AmplifyVersion on Version {
  Version get nextPreRelease => Version(
        major,
        minor,
        patch,
        pre: preRelease.map((el) {
          if (el is! int) return el;
          return el + 1;
        }).join('.'),
      );

  /// The next version according to Amplify rules for incrementing.
  Version nextAmplifyVersion(VersionBumpType type) {
    final newBuild = (build.singleOrNull as int? ?? 0) + 1;
    if (preRelease.isEmpty) {
      switch (type) {
        case VersionBumpType.patch:
          return major == 0 ? replace(build: [newBuild]) : nextPatch;
        case VersionBumpType.nonBreaking:
          return major == 0 ? nextPatch : nextMinor;
        case VersionBumpType.breaking:
          return major == 0 ? nextMinor : nextMajor;
      }
    }
    if (type == VersionBumpType.breaking) {
      return nextPreRelease;
    }
    return replace(build: [newBuild]);
  }

  /// The constraint to use for this version in pubspecs.
  String amplifyConstraint({Version? minVersion}) {
    final Version maxVersion;
    if (preRelease.isEmpty) {
      final currentMinor = Version(major, minor, 0);
      minVersion ??= currentMinor;
      maxVersion = Version(major, minor + 1, 0);
    } else {
      final currentPreRelease = Version(
        major,
        minor,
        patch,
        pre: preRelease.join('.'),
      );
      minVersion ??= currentPreRelease;
      maxVersion = nextPreRelease;
    }
    return '>=$minVersion <$maxVersion';
  }

  /// Creates a copy of this version with the given fields replaced.
  Version replace({
    int? major,
    int? minor,
    int? patch,
    List<Object>? preRelease,
    List<Object>? build,
  }) {
    String? pre;
    if (preRelease != null) {
      pre = preRelease.join('.');
    } else if (this.preRelease.isNotEmpty) {
      pre = this.preRelease.join('.');
    }
    String? buildString;
    if (build != null) {
      buildString = build.join('.');
    } else if (this.build.isNotEmpty) {
      buildString = this.build.join('.');
    }
    return Version(
      major ?? this.major,
      minor ?? this.minor,
      patch ?? this.patch,
      pre: pre,
      build: buildString,
    );
  }
}

enum DependencyType {
  dependency('dependencies', 'dependency'),
  devDependency('dev_dependencies', 'dev dependency'),
  dependencyOverride('dependency_overrides', 'dependency override');

  const DependencyType(this.key, this.description);

  /// The key in the `pubspec.yaml`.
  final String key;

  /// The human description of a dependency of this type.
  final String description;
}

extension PubspecX on Pubspec {
  /// The package flavor of this pubspec.
  PackageFlavor get flavor {
    if (dependencies.keys.contains('flutter')) {
      return PackageFlavor.flutter;
    }
    return PackageFlavor.dart;
  }
}
