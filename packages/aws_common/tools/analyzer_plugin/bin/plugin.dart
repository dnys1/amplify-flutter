import 'dart:isolate';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/starter.dart';
import 'package:source_span/source_span.dart';

void main(List<String> args, SendPort sendPort) {
  final plugin = AnalyzerPlugin(
    resourceProvider: PhysicalResourceProvider.INSTANCE,
  );
  ServerPluginStarter(plugin).start(sendPort);
}

final class AnalyzerPlugin extends ServerPlugin {
  AnalyzerPlugin({
    required super.resourceProvider,
  });

  @override
  Future<void> analyzeFile({
    required AnalysisContext analysisContext,
    required String path,
  }) async {
    try {
      final resolvedUnit =
          await analysisContext.currentSession.getResolvedUnit(path);
      if (resolvedUnit is! ResolvedUnitResult) {
        return channel.sendNotification(
          AnalysisErrorsParams(path, []).toNotification(),
        );
      }
      final analysisErrors = _getErrorsForResolvedUnit(resolvedUnit, path);
      channel.sendNotification(
        AnalysisErrorsParams(
          path,
          analysisErrors.map((analysisError) => analysisError.error).toList(),
        ).toNotification(),
      );
    } on Exception catch (e, st) {
      channel.sendNotification(
        PluginErrorParams(false, e.toString(), st.toString()).toNotification(),
      );
    }
  }

  Iterable<AnalysisErrorFixes> _getErrorsForResolvedUnit(
    ResolvedUnitResult analysisResult,
    String rootPath,
  ) sync* {
    final visitor = _SensitiveVisitor(analysisResult);
    analysisResult.unit.accept(visitor);
    yield* visitor.errors.map(AnalysisErrorFixes.new);
  }

  @override
  List<String> get fileGlobsToAnalyze => const ['**/*.dart'];

  @override
  String get name => 'aws_common';

  // Required to be >= the current analysis_server version.
  @override
  String get version => '1.0.0-alpha.0';
}

final class _SensitiveVisitor extends RecursiveAstVisitor<void> {
  _SensitiveVisitor(this.source);

  final errors = <AnalysisError>[];
  final ResolvedUnitResult source;

  @override
  void visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    final isLoggerCall = true;
    if (isLoggerCall) {
      _checkArgumentsForSensitiveInfo(node.argumentList);
    }
  }

  void _checkArgumentsForSensitiveInfo(ArgumentList arguments) {
    for (final argument in arguments.arguments) {
      final argumentType = argument.staticType?.isDartCoreString ?? false;
    }
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    super.visitStringInterpolation(node);
  }

  @override
  void visitInterpolationExpression(InterpolationExpression node) {
    super.visitInterpolationExpression(node);
    if (!_typeIsOrHasSensitiveAncestor(node.expression.staticType)) {
      // No sensitive info
      return;
    }
    final loc = nodeLocation(node: node, source: source);
    errors.add(
      AnalysisError(
        AnalysisErrorSeverity.ERROR,
        AnalysisErrorType.LINT,
        Location(
          source.path,
          loc.start.offset,
          loc.length,
          loc.start.line,
          loc.start.column,
          endLine: loc.end.line,
          endColumn: loc.end.column,
        ),
        'Sensitive info should not be logged',
        'sensitive_info',
      ),
    );
  }

  @override
  void visitInterpolationString(InterpolationString node) {
    super.visitInterpolationString(node);
  }

  bool _typeIsOrHasSensitiveAncestor(DartType? type) {
    if (type == null) {
      return false;
    }
    final sensitiveElement = type.element?.thisOrAncestorMatching((el) {
      return el.metadata.any((annotation) {
        if (annotation.element case final PropertyAccessorElement element) {
          return element.name == 'sensitive' &&
              element.library.source.uri
                  .toString()
                  .startsWith('package:aws_common');
        }
        return false;
      });
    });
    return sensitiveElement != null;
  }
}

/// Returns [SourceSpan] with information about original code for [node] from [source]
SourceSpan nodeLocation({
  required SyntacticEntity node,
  required ResolvedUnitResult source,
  SyntacticEntity? endNode,
  bool withCommentOrMetadata = false,
}) {
  final offset = !withCommentOrMetadata && node is AnnotatedNode
      ? node.firstTokenAfterCommentAndMetadata.offset
      : node.offset;
  final end = endNode?.end ?? node.end;
  final sourceUrl = Uri.file(source.path);

  final offsetLocation = source.lineInfo.getLocation(offset);
  final endLocation = source.lineInfo.getLocation(end);

  return SourceSpan(
    SourceLocation(
      offset,
      sourceUrl: sourceUrl,
      line: offsetLocation.lineNumber,
      column: offsetLocation.columnNumber,
    ),
    SourceLocation(
      end,
      sourceUrl: sourceUrl,
      line: endLocation.lineNumber,
      column: endLocation.columnNumber,
    ),
    source.content.substring(offset, end),
  );
}
