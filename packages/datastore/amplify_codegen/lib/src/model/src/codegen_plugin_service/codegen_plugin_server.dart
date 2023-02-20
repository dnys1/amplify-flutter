// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.codegen_plugin_server; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i4;

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/common/serializers.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_error.dart'
    as _i7;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_request.dart'
    as _i5;
import 'package:built_value/serializer.dart';
import 'package:shelf/shelf.dart' as _i6;
import 'package:shelf_router/shelf_router.dart';
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i2;

abstract class CodegenPluginServerBase extends _i1.HttpServerBase {
  @override
  late final _i1.HttpProtocol protocol = _i2.RestJson1Protocol(
    serializers: _i3.serializers,
    builderFactories: _i3.builderFactories,
  );

  late final Router _router = () {
    final service = _CodegenPluginServer(this);
    final router = Router();
    router.add(
      'POST',
      r'/codegen',
      service.codegen,
    );
    return router;
  }();

  _i4.Future<void> codegen(
    _i5.CodegenRequest input,
    _i1.Context context,
  );
  _i4.Future<_i6.Response> call(_i6.Request request) => _router(request);
}

class _CodegenPluginServer extends _i1.HttpServer<CodegenPluginServerBase> {
  _CodegenPluginServer(this.service);

  @override
  final CodegenPluginServerBase service;

  late final _i1.HttpProtocol<_i5.CodegenRequest, _i5.CodegenRequest, _i1.Unit,
      _i1.Unit> _codegenProtocol = _i2.RestJson1Protocol(
    serializers: _i3.serializers,
    builderFactories: _i3.builderFactories,
  );

  _i4.Future<_i6.Response> codegen(_i6.Request request) async {
    final awsRequest = request.awsRequest;
    final context = _i1.Context(awsRequest);
    context.response.headers['Content-Type'] = _codegenProtocol.contentType;
    try {
      final payload = (await _codegenProtocol.deserialize(
        awsRequest.split(),
        specifiedType: const FullType(_i5.CodegenRequest),
      ) as _i5.CodegenRequest);
      final input = _i5.CodegenRequest.fromRequest(
        payload,
        awsRequest,
        labels: {},
      );
      await service.codegen(
        input,
        context,
      );
      const statusCode = 200;
      final body = _codegenProtocol.serialize(
        const _i1.Unit(),
        specifiedType: const FullType(
          _i1.Unit,
          [FullType(_i1.Unit)],
        ),
      );
      return _i6.Response(
        statusCode,
        body: body,
        headers: context.response.build().headers.toMap(),
      );
    } on _i7.CodegenError catch (e) {
      context.response.headers['X-Amzn-Errortype'] = 'CodegenError';
      final body = _codegenProtocol.serialize(
        e,
        specifiedType: const FullType(
          _i7.CodegenError,
          [FullType(_i7.CodegenError)],
        ),
      );
      const statusCode = 500;
      return _i6.Response(
        statusCode,
        body: body,
        headers: context.response.build().headers.toMap(),
      );
    } on Object catch (e, st) {
      return service.handleUncaughtError(
        e,
        st,
      );
    }
  }
}
