// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:aft/aft.dart';
import 'package:args/command_runner.dart';

Future<void> main(List<String> args) async {
  final runner = CommandRunner<void>('aft', 'Amplify Flutter repo tools')
    ..argParser.addFlag(
      'verbose',
      abbr: 'v',
      help: 'Prints verbose logs',
      defaultsTo: false,
    )
    ..addCommand(GenerateSdkCommand())
    ..addCommand(ListPackagesCommand())
    ..addCommand(DepsCommand())
    ..addCommand(PublishCommand());
  try {
    await runner.run(args);
  } finally {
    // Free up resources before exiting. This prevents hangs from `pkg:http`.
    for (final command in runner.commands.values.whereType<AmplifyCommand>()) {
      command.close();
    }
  }
}
