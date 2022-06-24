import 'package:build/build.dart';
import 'package:path/path.dart' as p;

/// Copies the generated workers to [_publishedWorkersJs].
class WorkerLibraryBuilder extends Builder {
  @override
  late final Map<String, List<String>> buildExtensions = {
    '.debug.dart.js': ['.debug.compiled.dart'],
    '.release.dart.js': ['.release.compiled.dart']
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final isDebug = buildStep.inputId.path.endsWith('.debug.dart.js');
    final library = '''
/// Compiled workers (${isDebug ? 'Debug' : 'Release'} mode)
const workerJs = r\'\'\'
${await buildStep.readAsString(buildStep.inputId)}
\'\'\';
''';

    var filename = p.basename(buildStep.inputId.path).split('.').first;
    if (isDebug) {
      filename = '$filename.debug.compiled.dart';
    } else {
      filename = '$filename.release.compiled.dart';
    }
    final outputId = AssetId(
      buildStep.inputId.package,
      p.join(p.dirname(buildStep.inputId.path), filename),
    );
    await buildStep.writeAsString(outputId, library);
  }
}
