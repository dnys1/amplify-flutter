import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:e2e_test/e2e_test.dart';
import 'package:e2e_test/src/workers.release.compiled.dart' deferred as workers;
import 'package:flutter_test/flutter_test.dart';

class DirectBenchmark extends AsyncBenchmarkBase {
  DirectBenchmark() : super('DirectBenchmark');

  @override
  Future<void> run() async {
    final worker = E2EWorker.create();
    await worker.spawn(
      jsEntrypoint: 'packages/e2e_test/src/workers.min.js',
    );
  }
}

class LoaderBenchmark extends AsyncBenchmarkBase {
  LoaderBenchmark() : super('LoaderBenchmark');

  @override
  Future<void> run() async {
    final worker = E2EWorker.create();
    await worker.spawn(
      loadJsEntrypoint: () async {
        await workers.loadLibrary();
        return workers.workerJs;
      },
    );
  }
}

void main() {
  testWidgets('Direct', (tester) async {
    final stopwatch = Stopwatch()..start();
    final worker = E2EWorker.create();
    await worker.spawn(
      jsEntrypoint: 'packages/e2e_test/src/workers.min.js',
    );
    stopwatch.stop();
    print('Direct Result: ${stopwatch.elapsedMilliseconds}ms');
  });

  testWidgets('Loader', (_) async {
    final stopwatch = Stopwatch()..start();
    final worker = E2EWorker.create();
    await worker.spawn(
      loadJsEntrypoint: () async {
        await workers.loadLibrary();
        return workers.workerJs;
      },
    );
    stopwatch.stop();
    print('Loader Result: ${stopwatch.elapsedMilliseconds}ms');
  });
}
