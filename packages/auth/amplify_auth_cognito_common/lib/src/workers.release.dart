import 'package:amplify_auth_cognito_common/src/flows/device/confirm_device_worker.dart';
import 'package:amplify_auth_cognito_common/src/flows/srp/srp_device_password_verifier_worker.dart';
import 'package:amplify_auth_cognito_common/src/flows/srp/srp_init_worker.dart';
import 'package:amplify_auth_cognito_common/src/flows/srp/srp_password_verifier_worker.dart';
import 'package:worker_bee/worker_bee.dart';

final workers = <String, WorkerBeeBuilder>{
  'ConfirmDeviceWorker': ConfirmDeviceWorker.create,
  'SrpInitWorker': SrpInitWorker.create,
  'SrpDevicePasswordVerifierWorker': SrpDevicePasswordVerifierWorker.create,
  'SrpPasswordVerifierWorker': SrpPasswordVerifierWorker.create
};
void main() => runHive(workers);
