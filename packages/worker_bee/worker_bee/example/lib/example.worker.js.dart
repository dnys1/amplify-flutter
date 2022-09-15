// Generated by worker_bee_builder.

import 'package:aws_common/aws_common.dart';
import 'package:example/example.dart';

/// The JS implementation of [MyWorker].
class MyWorkerImpl extends MyWorker {
  @override
  String get name => 'MyWorker';
  @override
  String get jsEntrypoint {
    // Flutter web release builds must use the bundled asset.
    if (zIsFlutter && !zDebugMode) {
      return 'assets/packages/example/workers.min.js';
    }
    // Default to the compiled, published worker.
    return zDebugMode
        ? 'packages/example/workers.js'
        : 'packages/example/workers.min.js';
  }

  @override
  List<String> get fallbackUrls {
    // When running in a test, we need to find the `packages` directory which
    // is symlinked in the root `test/` directory.
    final baseUri = Uri.base;
    final basePath = baseUri.pathSegments
        .takeWhile((segment) => segment != 'test')
        .map(Uri.encodeComponent)
        .join('/');
    final testDir = Uri(
      scheme: baseUri.scheme,
      host: baseUri.host,
      port: baseUri.port,
      path: '$basePath/test',
    );
    const relativePath = zDebugMode
        ? 'packages/example/workers.debug.dart.js'
        : 'packages/example/workers.release.dart.js';
    return [
      relativePath,
      testDir.resolve(relativePath).toString(),
    ];
  }
}
