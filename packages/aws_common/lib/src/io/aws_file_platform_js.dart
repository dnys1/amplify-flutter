// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';
import 'dart:js_interop';
import 'dart:math';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:aws_common/src/js/fetch.dart';
import 'package:aws_common/src/js/file.dart';

/// The html implementation of [AWSFile].
sealed class AWSFilePlatform extends AWSFile {
  /// Creates an [AWSFile] from html [File].
  factory AWSFilePlatform.fromFile(
    File file, {
    String? contentType,
  }) = _AWSFilePlatformFile;

  /// Creates an [AWSFile] from html [Blob].
  factory AWSFilePlatform.fromBlob(
    Blob blob, {
    String? name,
    String? contentType,
  }) = _AWSFilePlatformBlob;

  /// {@macro amplify_core.io.aws_file.from_path}
  factory AWSFilePlatform.fromPath(
    String path, {
    String? name,
    String? contentType,
  }) = _AWSFilePlatformPath;

  /// {@macro amplify_core.io.aws_file.from_stream}
  factory AWSFilePlatform.fromStream(
    Stream<List<int>> stream, {
    String? name,
    String? contentType,
    required int size,
  }) = _AWSFilePlatformStream;

  /// {@macro amplify_core.io.aws_file.from_path}
  factory AWSFilePlatform.fromData(
    List<int> data, {
    String? name,
    String? contentType,
  }) = _AWSFilePlatformData;

  AWSFilePlatform._() : super.protected();
}

abstract base class _AWSFilePlatformBlobLike extends AWSFilePlatform {
  _AWSFilePlatformBlobLike({
    String? contentType,
  })  : _contentType = contentType,
        super._();

  FutureOr<Blob> get blob;

  final String? _contentType;

  @override
  Future<int> get size async => (await blob).size.toDart.toInt();

  @override
  Stream<List<int>> openRead([int? start, int? end]) =>
      blob.openRead(start, end);

  final _contentTypeMemo = AsyncMemoizer<String?>();

  @override
  Future<String?> get contentType => _contentTypeMemo.runOnce(() async {
        if (_contentType case final externalContentType?) {
          return externalContentType;
        }
        final resolvedBlob = await blob;
        final contentType = resolvedBlob.type.toDart;
        // on Web blob.type may return an empty string
        // https://developer.mozilla.org/en-US/docs/Web/API/Blob/type#value
        if (contentType.isEmpty) {
          return null;
        }
        return contentType;
      });
}

final class _AWSFilePlatformBlob extends _AWSFilePlatformBlobLike {
  _AWSFilePlatformBlob(
    this.blob, {
    this.name,
    super.contentType,
  });

  @override
  final Blob blob;

  @override
  final String? name;
}

final class _AWSFilePlatformFile extends _AWSFilePlatformBlobLike {
  _AWSFilePlatformFile(
    this.blob, {
    super.contentType,
  });

  @override
  final File blob;

  @override
  String? get name => blob.name.toDart;
}

final class _AWSFilePlatformData extends _AWSFilePlatformBlobLike {
  _AWSFilePlatformData(
    this.bytes, {
    this.name,
    super.contentType,
  }) : blob = Blob(
          [Uint8List.fromList(bytes).toJS].toJS,
          BlobOptions(type: contentType?.toJS),
        );

  @override
  final Blob blob;

  @override
  final List<int> bytes;

  @override
  final String? name;

  @override
  Stream<List<int>> openRead([int? start, int? end]) =>
      Stream.value(bytes.sublist(start ?? 0, end));
}

final class _AWSFilePlatformPath extends _AWSFilePlatformBlobLike {
  _AWSFilePlatformPath(
    this.path, {
    this.name,
    super.contentType,
  });

  @override
  final String path;

  @override
  final String? name;

  final _blobMemo = AsyncMemoizer<Blob>();

  @override
  Future<Blob> get blob => _blobMemo.runOnce(() async {
        final response = await fetch(path);
        return await response.blob().toDart as Blob;
      });
}

final class _AWSFilePlatformStream extends AWSFilePlatform {
  _AWSFilePlatformStream(
    this.stream, {
    required this.size,
    this.name,
    this.contentType,
  }) : super._();

  @override
  final Stream<List<int>> stream;

  @override
  final int size;

  @override
  final String? name;

  @override
  final String? contentType;

  @override
  Stream<List<int>> openRead([int? start, int? end]) =>
      throw const InvalidFileException(
        recoverySuggestion:
            'Cannot use `openRead` with an AWSFile that is initiated with a stream.',
      );
}

extension on FutureOr<Blob> {
  Stream<List<int>> openRead([int? start, int? end]) async* {
    // Dart io.File openRead chunk size
    const readStreamChunkSize = 64 * 1024;

    var blob = await this;
    final size = blob.size.toDart;
    if (start != null) {
      end = min(end ?? size, size).toInt();
      blob = blob.slice(start.toJS, end.toJS, blob.type);
    }
    final fileReader = FileReader();

    var currentPosition = 0;
    while (currentPosition < size) {
      final readRange = min(
        currentPosition + readStreamChunkSize,
        size,
      );
      final blobToRead = blob.slice(
        currentPosition.toJS,
        readRange.toJS,
      );
      final onload = Completer<void>.sync();
      fileReader
        ..onload = ((JSAny? _) => onload.complete()).toJS
        ..readAsArrayBuffer(blobToRead);
      await onload.future;
      yield (fileReader.result as JSArrayBuffer).toDart.asUint8List();
      currentPosition += readStreamChunkSize;
    }
  }
}
