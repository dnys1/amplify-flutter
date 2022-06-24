import 'package:e2e_test/e2e_test.dart';

import 'package:e2e_test/src/workers.debug.compiled.dart'
    deferred as debug_workers;
import 'package:e2e_test/src/workers.release.compiled.dart'
    deferred as release_workers;
import 'package:test/test.dart';

void main() {
  Future<void> warmup() async {
    final worker = E2EWorker.create();
    await worker
        .spawn(
          jsEntrypoint: 'packages/e2e_test/src/no_workers.js',
        )
        .catchError((_) {});
  }

  setUpAll(warmup);

  test('Direct', () async {
    final stopwatch = Stopwatch()..start();
    final worker = E2EWorker.create();
    // worker.logs.listen(print);
    await worker.spawn(
      jsEntrypoint: 'packages/e2e_test/src/workers.js',
    );
    stopwatch.stop();
    print('Direct Result: ${stopwatch.elapsedMicroseconds}us');
    await Future.delayed(Duration.zero);
  });

  test('Direct (min)', () async {
    final stopwatch = Stopwatch()..start();
    final worker = E2EWorker.create();
    // worker.logs.listen(print);
    await worker.spawn(
      jsEntrypoint: 'packages/e2e_test/src/workers.min.js',
    );
    stopwatch.stop();
    print('Direct Result: ${stopwatch.elapsedMicroseconds}us');
    await Future.delayed(Duration.zero);
  });

  test('Loader', () async {
    final stopwatch = Stopwatch()..start();
    final worker = E2EWorker.create();
    // worker.logs.listen(print);
    await worker.spawn(
      loadJsEntrypoint: () async {
        await debug_workers.loadLibrary();
        return debug_workers.workerJs;
      },
    );
    stopwatch.stop();
    print('Loader Result: ${stopwatch.elapsedMicroseconds}us');
    await Future.delayed(Duration(seconds: 1));
  });

  test('Loader (min)', () async {
    final stopwatch = Stopwatch()..start();
    final worker = E2EWorker.create();
    // worker.logs.listen(print);
    await worker.spawn(
      loadJsEntrypoint: () async {
        await release_workers.loadLibrary();
        return release_workers.workerJs;
      },
    );
    stopwatch.stop();
    print('Loader Result: ${stopwatch.elapsedMicroseconds}us');
    await Future.delayed(Duration(seconds: 1));
  });
}
