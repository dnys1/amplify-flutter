// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.operation.generate_test_schemas_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/common/serializers.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schema_matrix.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schemas.dart'
    as _i3;
import 'package:aws_common/aws_common.dart' as _i6;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i4;

class GenerateTestSchemasOperation extends _i1.HttpOperation<
    _i2.TestSchemaMatrix,
    _i2.TestSchemaMatrix,
    _i3.TestSchemas,
    _i3.TestSchemas> {
  GenerateTestSchemasOperation({
    required this.baseUri,
    List<_i1.HttpRequestInterceptor> requestInterceptors = const [],
    List<_i1.HttpResponseInterceptor> responseInterceptors = const [],
  })  : _requestInterceptors = requestInterceptors,
        _responseInterceptors = responseInterceptors;

  @override
  late final List<
      _i1.HttpProtocol<_i2.TestSchemaMatrix, _i2.TestSchemaMatrix,
          _i3.TestSchemas, _i3.TestSchemas>> protocols = [
    _i4.RestJson1Protocol(
      serializers: _i5.serializers,
      builderFactories: _i5.builderFactories,
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
  _i1.HttpRequest buildRequest(_i2.TestSchemaMatrix input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/codegen-tests';
      });
  @override
  int successCode([_i3.TestSchemas? output]) => 200;
  @override
  _i3.TestSchemas buildOutput(
    _i3.TestSchemas payload,
    _i6.AWSBaseHttpResponse response,
  ) =>
      _i3.TestSchemas.fromResponse(
        payload,
        response,
      );
  @override
  List<_i1.SmithyError> get errorTypes => const [];
  @override
  String get runtimeTypeName => 'GenerateTestSchemas';
}
