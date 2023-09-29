// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.operation.codegen_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/common/serializers.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_error.dart'
    as _i6;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_request.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i5;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i3;

class CodegenOperation extends _i1
    .HttpOperation<_i2.CodegenRequest, _i2.CodegenRequest, _i1.Unit, _i1.Unit> {
  CodegenOperation({
    required this.baseUri,
    List<_i1.HttpRequestInterceptor> requestInterceptors = const [],
    List<_i1.HttpResponseInterceptor> responseInterceptors = const [],
  })  : _requestInterceptors = requestInterceptors,
        _responseInterceptors = responseInterceptors;

  @override
  late final List<
      _i1.HttpProtocol<_i2.CodegenRequest, _i2.CodegenRequest, _i1.Unit,
          _i1.Unit>> protocols = [
    _i3.RestJson1Protocol(
      serializers: _i4.serializers,
      builderFactories: _i4.builderFactories,
      requestInterceptors: <_i1.HttpRequestInterceptor>[
            const _i1.WithHost(),
            const _i1.WithContentLength(),
          ] +
          _requestInterceptors,
      responseInterceptors:
          <_i1.HttpResponseInterceptor>[] + _responseInterceptors,
    )
  ];

  @override
  final Uri baseUri;

  final List<_i1.HttpRequestInterceptor> _requestInterceptors;

  final List<_i1.HttpResponseInterceptor> _responseInterceptors;

  @override
  _i1.HttpRequest buildRequest(_i2.CodegenRequest input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/codegen';
      });
  @override
  int successCode([_i1.Unit? output]) => 200;
  @override
  _i1.Unit buildOutput(
    _i1.Unit payload,
    _i5.AWSBaseHttpResponse response,
  ) =>
      payload;
  @override
  List<_i1.SmithyError> get errorTypes => const [
        _i1.SmithyError<_i6.CodegenError, _i6.CodegenError>(
          _i1.ShapeId(
            namespace: 'com.amazonaws.amplify.codegen',
            shape: 'CodegenError',
          ),
          _i1.ErrorKind.server,
          _i6.CodegenError,
          statusCode: 500,
          builder: _i6.CodegenError.fromResponse,
        )
      ];
  @override
  String get runtimeTypeName => 'Codegen';
}
