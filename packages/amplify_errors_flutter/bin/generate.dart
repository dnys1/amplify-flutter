import 'dart:io';

import 'package:amplify_errors_flutter/src/amplify_error_config.dart';
import 'package:args/args.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:path/path.dart' as path;

void main(List<String> args) {
  var projectDir = File.fromUri(Platform.script).parent.parent.path;

  var defaultConfigPath = path.absolute(projectDir, 'errors.yaml');
  var configFile = File(defaultConfigPath);

  var defaultOutputPath = path.absolute(projectDir, 'lib/src/lookup.dart');
  var outputFile = File(defaultOutputPath)..createSync();

  if (!configFile.existsSync()) {
    var argParser = ArgParser();

    argParser.addFlag(
      'config',
      help: 'Path to configuration file',
    );

    var results = argParser.parse(args);
    var configPath = results['config'];

    if (configPath == null || !(configFile = File(configPath)).existsSync()) {
      stderr.add(argParser.usage.codeUnits);
      exitCode = 1;
      return;
    }
  }

  var yaml = configFile.readAsStringSync();
  var errorsConfig = checkedYamlDecode(
    yaml,
    (m) => AmplifyErrorConfig.fromJson(m!),
  );

  var output = StringBuffer();
  output.writeln('// GENERATED CODE. Do not modify by hand.');
  output.writeln();
  output.writeln('part of amplify_errors;');
  output.writeln();
  output
      .writeln('final Map<String, AmplifyExceptionGenerator> _lookupTable = {');
  for (var error in errorsConfig.errors) {
    var dartFactory =
        error.dartDetails.dartClass + '.' + error.dartDetails.dartFactory;
    output.writeln("r'" + error.androidName + "': " + dartFactory + ',');
    output.writeln("r'" + error.iosName + "': " + dartFactory + ',');
  }
  output.writeln('};');

  outputFile.writeAsStringSync(output.toString());

  exitCode = Process.runSync('dart', ['format', defaultOutputPath]).exitCode;
}
