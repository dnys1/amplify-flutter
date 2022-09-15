import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:worker_bee/worker_bee.dart';
import 'example.worker.dart';

@WorkerBee('workers.dart')
abstract class MyWorker extends WorkerBeeBase<Uint8List, String> {
  MyWorker();
  factory MyWorker.create() = MyWorkerImpl;

  @override
  Future<String?> run(
    Stream<Uint8List> listen,
    StreamSink<String> respond,
  ) async {
    await for (final message in listen) {
      respond.add(base64Encode(message));
    }
    return null;
  }
}
