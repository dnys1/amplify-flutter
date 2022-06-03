import 'dart:async';
import 'dart:isolate';

import 'package:amplify_auth_cognito_dart/src/flows/srp/srp_init_worker.dart';
import 'package:worker_bee/worker_bee.dart';

Future<void> _run(SendPorts ports) async {
  final channel = IsolateChannel<Object?>.connectSend(ports.messagePort);
  final logsChannel = IsolateChannel<LogMessage>.connectSend(ports.logPort);
  final worker = SrpInitWorkerImpl();
  await worker.connect(logsChannel: logsChannel);
  final result = await worker.run(
    channel.stream.asBroadcastStream().cast(),
    channel.sink.cast(),
  );
// ignore: invalid_use_of_protected_member
  worker.logger.finest('Finished');
  unawaited(worker.close());
  Isolate.exit(ports.donePort, result);
}

/// The VM implementation of [SrpInitWorker].
class SrpInitWorkerImpl extends SrpInitWorker {
  @override
  String get name => 'SrpInitWorker';
  @override
  VmEntrypoint get vmEntrypoint => _run;
}
