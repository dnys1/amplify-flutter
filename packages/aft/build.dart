import 'dart:io';

import 'package:libgit2dart/libgit2dart.dart';
import 'package:native_assets_cli/native_assets_cli.dart';

void main(List<String> args) async {
  Libgit2.version;
  final buildConfig = await BuildConfig.fromArgs(args);
  final buildOutput = BuildOutput(
    assets: [
      Asset(
        id: 'package:aft/',
        linkMode: LinkMode.dynamic,
        target: Target.macOSArm64,
        path: AssetAbsolutePath(
          Platform.script.resolve(
            'external/libgit2dart/macos/libgit2-1.5.0.dylib',
          ),
        ),
      ),
    ],
  );

  await buildOutput.writeToFile(outDir: buildConfig.outDir);
}
