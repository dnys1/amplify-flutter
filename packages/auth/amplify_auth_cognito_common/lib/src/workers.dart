@WorkerHive([
  ConfirmDeviceWorker,
  SrpInitWorker,
  SrpDevicePasswordVerifierWorker,
  SrpPasswordVerifierWorker,
])
library amplify_auth_cognito_common.workers;

import 'package:amplify_auth_cognito_common/amplify_auth_cognito_common.dart';
import 'package:worker_bee/worker_bee.dart';
