library aws_rum_dart;

import 'package:amplify_auth_cognito_dart/amplify_auth_cognito_dart.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';

import 'src/sdk/rum.dart';

export 'src/sdk/rum.dart';

Future<RumClient> initializeRum() async {
  await Amplify.asyncConfig;
  final awsSession = await Amplify.Auth.fetchAuthSession(
    options: CognitoSessionOptions(getAWSCredentials: true),
  ) as CognitoAuthSession;
  return RumClient(
    region: 'us-west-2',
    credentialsProvider: AWSCredentialsProvider(awsSession.credentials!),
  );
}
