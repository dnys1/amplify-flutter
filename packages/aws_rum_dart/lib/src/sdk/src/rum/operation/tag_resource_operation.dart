// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.operation.tag_resource_operation;

import 'dart:async' as _i12;

import 'package:aws_common/aws_common.dart' as _i7;
import 'package:aws_rum_dart/src/sdk/src/rum/common/endpoint_resolver.dart'
    as _i8;
import 'package:aws_rum_dart/src/sdk/src/rum/common/serializers.dart' as _i6;
import 'package:aws_rum_dart/src/sdk/src/rum/model/internal_server_exception.dart'
    as _i9;
import 'package:aws_rum_dart/src/sdk/src/rum/model/resource_not_found_exception.dart'
    as _i10;
import 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_request.dart'
    as _i2;
import 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_response.dart'
    as _i3;
import 'package:aws_rum_dart/src/sdk/src/rum/model/validation_exception.dart'
    as _i11;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i5;

/// Assigns one or more tags (key-value pairs) to the specified CloudWatch RUM resource. Currently, the only resources that can be tagged app monitors.
///
/// Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values.
///
/// Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.
///
/// You can use the `TagResource` action with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.
///
/// You can associate as many as 50 tags with a resource.
///
/// For more information, see [Tagging Amazon Web Services resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html).
class TagResourceOperation extends _i1.HttpOperation<
    _i2.TagResourceRequestPayload,
    _i2.TagResourceRequest,
    _i3.TagResourceResponse,
    _i3.TagResourceResponse> {
  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch RUM resource. Currently, the only resources that can be tagged app monitors.
  ///
  /// Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.
  ///
  /// You can use the `TagResource` action with a resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// For more information, see [Tagging Amazon Web Services resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html).
  TagResourceOperation(
      {required String region,
      Uri? baseUri,
      _i4.AWSCredentialsProvider credentialsProvider =
          const _i4.AWSCredentialsProvider.environment()})
      : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider;

  @override
  late final List<
      _i1.HttpProtocol<_i2.TagResourceRequestPayload, _i2.TagResourceRequest,
          _i3.TagResourceResponse, _i3.TagResourceResponse>> protocols = [
    _i5.RestJson1Protocol(
        serializers: _i6.serializers,
        builderFactories: _i6.builderFactories,
        requestInterceptors: [
          const _i1.WithHost(),
          const _i1.WithContentLength(),
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
  _i1.HttpRequest buildRequest(_i2.TagResourceRequest input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/tags/{ResourceArn}';
      });
  @override
  int successCode([_i3.TagResourceResponse? output]) => 200;
  @override
  _i3.TagResourceResponse buildOutput(_i3.TagResourceResponse payload,
          _i7.AWSStreamedHttpResponse response) =>
      _i3.TagResourceResponse.fromResponse(payload, response);
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
  _i12.Future<_i3.TagResourceResponse> run(_i2.TagResourceRequest input,
      {_i1.HttpClient? client, _i1.ShapeId? useProtocol}) {
    return _i12.runZoned(
        () => super.run(input, client: client, useProtocol: useProtocol),
        zoneValues: {
          ...?_awsEndpoint.credentialScope?.zoneValues,
          ...{_i7.AWSHeaders.sdkInvocationId: _i7.uuid(secure: true)}
        });
  }
}
