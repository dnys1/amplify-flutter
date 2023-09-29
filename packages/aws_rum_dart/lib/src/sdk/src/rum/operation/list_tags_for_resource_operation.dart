// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.operation.list_tags_for_resource_operation;

import 'dart:async' as _i12;

import 'package:aws_common/aws_common.dart' as _i7;
import 'package:aws_rum_dart/src/sdk/src/rum/common/endpoint_resolver.dart'
    as _i8;
import 'package:aws_rum_dart/src/sdk/src/rum/common/serializers.dart' as _i6;
import 'package:aws_rum_dart/src/sdk/src/rum/model/internal_server_exception.dart'
    as _i9;
import 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_request.dart'
    as _i2;
import 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_response.dart'
    as _i3;
import 'package:aws_rum_dart/src/sdk/src/rum/model/resource_not_found_exception.dart'
    as _i10;
import 'package:aws_rum_dart/src/sdk/src/rum/model/validation_exception.dart'
    as _i11;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i5;

/// Displays the tags associated with a CloudWatch RUM resource.
class ListTagsForResourceOperation extends _i1.HttpOperation<
    _i2.ListTagsForResourceRequestPayload,
    _i2.ListTagsForResourceRequest,
    _i3.ListTagsForResourceResponse,
    _i3.ListTagsForResourceResponse> {
  /// Displays the tags associated with a CloudWatch RUM resource.
  ListTagsForResourceOperation(
      {required String region,
      Uri? baseUri,
      _i4.AWSCredentialsProvider credentialsProvider =
          const _i4.AWSCredentialsProvider.environment()})
      : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider;

  @override
  late final List<
      _i1.HttpProtocol<
          _i2.ListTagsForResourceRequestPayload,
          _i2.ListTagsForResourceRequest,
          _i3.ListTagsForResourceResponse,
          _i3.ListTagsForResourceResponse>> protocols = [
    _i5.RestJson1Protocol(
        serializers: _i6.serializers,
        builderFactories: _i6.builderFactories,
        requestInterceptors: [
          const _i1.WithHost(),
          const _i1.WithNoHeader('Content-Length'),
          const _i1.WithNoHeader('Content-Type'),
          _i5.WithSigV4(
              region: _region,
              service: _i7.AWSService.rum,
              credentialsProvider: _credentialsProvider),
          const _i1.WithUserAgent('aws-sdk-dart/0.5.5'),
          const _i5.WithSdkInvocationId(),
          const _i5.WithSdkRequest()
        ],
        responseInterceptors: [])
  ];

  late final _i5.AWSEndpoint _awsEndpoint =
      _i8.endpointResolver.resolve(_i8.sdkId, _region);

  final String _region;

  final Uri? _baseUri;

  final _i4.AWSCredentialsProvider _credentialsProvider;

  @override
  _i1.HttpRequest buildRequest(_i2.ListTagsForResourceRequest input) =>
      _i1.HttpRequest((b) {
        b.method = 'GET';
        b.path = r'/tags/{ResourceArn}';
      });
  @override
  int successCode([_i3.ListTagsForResourceResponse? output]) => 200;
  @override
  _i3.ListTagsForResourceResponse buildOutput(
          _i3.ListTagsForResourceResponse payload,
          _i7.AWSStreamedHttpResponse response) =>
      _i3.ListTagsForResourceResponse.fromResponse(payload, response);
  @override
  List<_i1.SmithyError> get errorTypes => const [
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum',
                shape: 'InternalServerException'),
            _i1.ErrorKind.server,
            _i9.InternalServerException,
            statusCode: 500,
            retryConfig: _i1.RetryConfig(isThrottlingError: false),
            builder: _i9.InternalServerException.fromResponse),
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum',
                shape: 'ResourceNotFoundException'),
            _i1.ErrorKind.client,
            _i10.ResourceNotFoundException,
            statusCode: 404,
            builder: _i10.ResourceNotFoundException.fromResponse),
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum', shape: 'ValidationException'),
            _i1.ErrorKind.client,
            _i11.ValidationException,
            statusCode: 400,
            builder: _i11.ValidationException.fromResponse)
      ];
  @override
  _i5.AWSRetryer get retryer => _i5.AWSRetryer();
  @override
  Uri get baseUri => _baseUri ?? endpoint.uri;
  @override
  _i1.Endpoint get endpoint => _awsEndpoint.endpoint;
  @override
  _i12.Future<_i3.ListTagsForResourceResponse> run(
      _i2.ListTagsForResourceRequest input,
      {_i1.HttpClient? client,
      _i1.ShapeId? useProtocol}) {
    return _i12.runZoned(
        () => super.run(input, client: client, useProtocol: useProtocol),
        zoneValues: {
          ...?_awsEndpoint.credentialScope?.zoneValues,
          ...{_i7.AWSHeaders.sdkInvocationId: _i7.uuid(secure: true)}
        });
  }
}
