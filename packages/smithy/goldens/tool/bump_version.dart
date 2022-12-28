import 'dart:io';

import 'package:aws_common/aws_common.dart';

Future<void> main() async {
  final httpClient = AWSHttpClient();
  final versionFile = File.fromUri(
    Platform.script.resolve('../smithy-version'),
  );
  final currentVersion = versionFile.readAsStringSync().trim();
  final latestVersionResp = await httpClient
      .send(
        AWSHttpRequest.get(
          Uri.parse(
            'https://raw.githubusercontent.com/awslabs/smithy/main/VERSION',
          ),
        ),
      )
      .response;
  final latestVersion = (await latestVersionResp.decodeBody()).trim();
  if (currentVersion != latestVersion) {
    print('Updating smithy version from $currentVersion to $latestVersion');
    print('::set-output updated=true');
    print('::set-output smithyVersion=$latestVersion');
    versionFile.writeAsStringSync(latestVersion);

    final buildFile = File.fromUri(
      Platform.script.resolve('../smithy-build.json'),
    );
    final buildJson = buildFile.readAsStringSync();
    buildFile.writeAsStringSync(
      buildJson.replaceAll(currentVersion, latestVersion),
    );
  } else {
    print('Smithy version is up to date');
    print('::set-output updated=false');
  }
}
