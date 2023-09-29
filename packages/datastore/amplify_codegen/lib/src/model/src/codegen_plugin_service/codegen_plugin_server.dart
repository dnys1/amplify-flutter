// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.codegen_plugin_client; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i4;

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/common/serializers.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_error.dart'
    as _i9;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_request.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schema_matrix.dart'
    as _i7;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schemas.dart'
    as _i6;
import 'package:built_value/serializer.dart';
import 'package:shelf/shelf.dart' as _i8;
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
    router.add(
      'POST',
      r'/codegen-tests',
      service.generateTestSchemas,
    );
    return router;
  }();

  _i4.Future<_i1.Unit> codegen(
    _i5.CodegenRequest input,
    _i1.Context context,
  );
  _i4.Future<_i6.TestSchemas> generateTestSchemas(
    _i7.TestSchemaMatrix input,
    _i1.Context context,
  );
  _i4.Future<_i8.Response> call(_i8.Request request) => _router(request);
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

  late final _i1.HttpProtocol<
      _i7.TestSchemaMatrix,
      _i7.TestSchemaMatrix,
      _i6.TestSchemas,
      _i6.TestSchemas> _generateTestSchemasProtocol = _i2.RestJson1Protocol(
    serializers: _i3.serializers,
    builderFactories: _i3.builderFactories,
  );

  _i4.Future<_i8.Response> codegen(_i8.Request request) async {
    final awsRequest = request.awsRequest;
    final context = _i1.Context(awsRequest);
    context.response.headers['Content-Type'] = _codegenProtocol.contentType;
    try {
      final payload = (await _codegenProtocol.wireSerializer.deserialize(
        await awsRequest.bodyBytes,
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
      final body = await _codegenProtocol.wireSerializer.serialize(
        output,
        specifiedType: const FullType(
          _i1.Unit,
          [FullType(_i1.Unit)],
        ),
      );
      return _i8.Response(
        statusCode,
        body: body,
        headers: context.response.build().headers.toMap(),
      );
    } on _i9.CodegenError catch (e) {
      context.response.headers['X-Amzn-Errortype'] = 'CodegenError';
      final body = _codegenProtocol.wireSerializer.serialize(
        e,
        specifiedType: const FullType(
          _i9.CodegenError,
          [FullType(_i9.CodegenError)],
        ),
      );
      const statusCode = 500;
      return _i8.Response(
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

  _i4.Future<_i8.Response> generateTestSchemas(_i8.Request request) async {
    final awsRequest = request.awsRequest;
    final context = _i1.Context(awsRequest);
    context.response.headers['Content-Type'] =
        _generateTestSchemasProtocol.contentType;
    try {
      final payload =
          (await _generateTestSchemasProtocol.wireSerializer.deserialize(
        await awsRequest.bodyBytes,
        specifiedType: const FullType(_i7.TestSchemaMatrix),
      ) as _i7.TestSchemaMatrix);
      final input = _i7.TestSchemaMatrix.fromRequest(
        payload,
        awsRequest,
        labels: {},
      );
      final output = await service.generateTestSchemas(
        input,
        context,
      );
      const statusCode = 200;
      final body = await _generateTestSchemasProtocol.wireSerializer.serialize(
        output,
        specifiedType: const FullType(
          _i6.TestSchemas,
          [FullType(_i6.TestSchemas)],
        ),
      );
      return _i8.Response(
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
