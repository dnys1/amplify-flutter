// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: avoid_unused_constructor_parameters

import 'dart:async';

import 'package:aws_common/aws_common.dart';

/// {@template amplify_core.io.aws_file_platform}
/// A cross platform implementation of [AWSFile].
/// {@endtemplate}
abstract class AWSFilePlatform extends AWSFile {
  /// {@macro amplify_core.io.aws_file_platform}
  AWSFilePlatform() : super.protected();

  /// {@macro amplify_core.io.aws_file.from_stream}
  factory AWSFilePlatform.fromStream(
    Stream<List<int>> stream, {
    String? name,
    String? contentType,
    required int size,
  }) {
    throw UnimplementedError(
      'AWSFile is not available in the current platform',
    );
  }

  /// {@macro amplify_core.io.aws_file.from_path}
  factory AWSFilePlatform.fromPath(
    String path, {
    String? name,
    String? contentType,
  }) {
    throw UnimplementedError(
      'AWSFile is not available in the current platform',
    );
  }

  /// {@macro amplify_core.io.aws_file.from_path}
  factory AWSFilePlatform.fromData(
    List<int> data, {
    String? name,
    String? contentType,
  }) {
    throw UnimplementedError(
      'AWSFile is not available in the current platform',
    );
  }
}
