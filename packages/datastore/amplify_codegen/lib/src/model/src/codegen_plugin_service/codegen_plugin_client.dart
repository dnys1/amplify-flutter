// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.codegen_plugin_client; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_request.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schema_matrix.dart'
    as _i6;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schemas.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/operation/codegen_operation.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/operation/generate_test_schemas_operation.dart'
    as _i7;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:smithy/smithy.dart' as _i2;

class CodegenPluginClient {
  const CodegenPluginClient({
    _i1.AWSHttpClient? client,
    required Uri baseUri,
    List<_i2.HttpRequestInterceptor> requestInterceptors = const [],
    List<_i2.HttpResponseInterceptor> responseInterceptors = const [],
  })  : _client = client,
        _baseUri = baseUri,
        _requestInterceptors = requestInterceptors,
        _responseInterceptors = responseInterceptors;

  final _i1.AWSHttpClient? _client;

  final Uri _baseUri;

  final List<_i2.HttpRequestInterceptor> _requestInterceptors;

  final List<_i2.HttpResponseInterceptor> _responseInterceptors;

  _i2.SmithyOperation<void> codegen(
    _i3.CodegenRequest input, {
    _i1.AWSHttpClient? client,
  }) {
    return _i4.CodegenOperation(
      baseUri: _baseUri,
      requestInterceptors: _requestInterceptors,
      responseInterceptors: _responseInterceptors,
    ).run(
      input,
      client: client ?? _client,
    );
  }

  _i2.SmithyOperation<_i5.TestSchemas> generateTestSchemas(
    _i6.TestSchemaMatrix input, {
    _i1.AWSHttpClient? client,
  }) {
    return _i7.GenerateTestSchemasOperation(
      baseUri: _baseUri,
      requestInterceptors: _requestInterceptors,
      responseInterceptors: _responseInterceptors,
    ).run(
      input,
      client: client ?? _client,
    );
  }
}
