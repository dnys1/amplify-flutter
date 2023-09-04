import 'package:aws_common/aws_common.dart';

void main() {
  const credentials = AWSCredentials('accessKeyId', 'secretAccessKey');
  AWSLogger().debug('Credentials: $credentials');
}
