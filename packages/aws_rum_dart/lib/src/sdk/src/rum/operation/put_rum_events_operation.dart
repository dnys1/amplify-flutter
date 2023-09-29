// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.operation.put_rum_events_operation;

import 'dart:async' as _i14;

import 'package:aws_common/aws_common.dart' as _i7;
import 'package:aws_rum_dart/src/sdk/src/rum/common/endpoint_resolver.dart'
    as _i8;
import 'package:aws_rum_dart/src/sdk/src/rum/common/serializers.dart' as _i6;
import 'package:aws_rum_dart/src/sdk/src/rum/model/access_denied_exception.dart'
    as _i9;
import 'package:aws_rum_dart/src/sdk/src/rum/model/internal_server_exception.dart'
    as _i10;
import 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_request.dart'
    as _i2;
import 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_response.dart'
    as _i3;
import 'package:aws_rum_dart/src/sdk/src/rum/model/resource_not_found_exception.dart'
    as _i11;
import 'package:aws_rum_dart/src/sdk/src/rum/model/throttling_exception.dart'
    as _i12;
import 'package:aws_rum_dart/src/sdk/src/rum/model/validation_exception.dart'
    as _i13;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;
import 'package:smithy_aws/smithy_aws.dart' as _i5;

/// Sends telemetry events about your application performance and user behavior to CloudWatch RUM. The code snippet that RUM generates for you to add to your application includes `PutRumEvents` operations to send this data to RUM.
///
/// Each `PutRumEvents` operation can send a batch of events from one user session.
class PutRumEventsOperation extends _i1.HttpOperation<
    _i2.PutRumEventsRequestPayload,
    _i2.PutRumEventsRequest,
    _i3.PutRumEventsResponse,
    _i3.PutRumEventsResponse> {
  /// Sends telemetry events about your application performance and user behavior to CloudWatch RUM. The code snippet that RUM generates for you to add to your application includes `PutRumEvents` operations to send this data to RUM.
  ///
  /// Each `PutRumEvents` operation can send a batch of events from one user session.
  PutRumEventsOperation(
      {required String region,
      Uri? baseUri,
      _i4.AWSCredentialsProvider credentialsProvider =
          const _i4.AWSCredentialsProvider.environment()})
      : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider;

  @override
  late final List<
      _i1.HttpProtocol<_i2.PutRumEventsRequestPayload, _i2.PutRumEventsRequest,
          _i3.PutRumEventsResponse, _i3.PutRumEventsResponse>> protocols = [
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
  _i1.HttpRequest buildRequest(_i2.PutRumEventsRequest input) =>
      _i1.HttpRequest((b) {
        b.method = 'POST';
        b.path = r'/appmonitors/{Id}/';
        b.hostPrefix = 'dataplane.';
      });
  @override
  int successCode([_i3.PutRumEventsResponse? output]) => 200;
  @override
  _i3.PutRumEventsResponse buildOutput(_i3.PutRumEventsResponse payload,
          _i7.AWSStreamedHttpResponse response) =>
      _i3.PutRumEventsResponse.fromResponse(payload, response);
  @override
  List<_i1.SmithyError> get errorTypes => const [
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum', shape: 'AccessDeniedException'),
            _i1.ErrorKind.client,
            _i9.AccessDeniedException,
            statusCode: 403,
            builder: _i9.AccessDeniedException.fromResponse),
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum',
                shape: 'InternalServerException'),
            _i1.ErrorKind.server,
            _i10.InternalServerException,
            statusCode: 500,
            retryConfig: _i1.RetryConfig(isThrottlingError: false),
            builder: _i10.InternalServerException.fromResponse),
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum',
                shape: 'ResourceNotFoundException'),
            _i1.ErrorKind.client,
            _i11.ResourceNotFoundException,
            statusCode: 404,
            builder: _i11.ResourceNotFoundException.fromResponse),
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum', shape: 'ThrottlingException'),
            _i1.ErrorKind.client,
            _i12.ThrottlingException,
            statusCode: 429,
            retryConfig: _i1.RetryConfig(isThrottlingError: true),
            builder: _i12.ThrottlingException.fromResponse),
        _i1.SmithyError(
            _i1.ShapeId(
                namespace: 'com.amazonaws.rum', shape: 'ValidationException'),
            _i1.ErrorKind.client,
            _i13.ValidationException,
            statusCode: 400,
            builder: _i13.ValidationException.fromResponse)
      ];
  @override
  _i5.AWSRetryer get retryer => _i5.AWSRetryer();
  @override
  Uri get baseUri => _baseUri ?? endpoint.uri;
  @override
  _i1.Endpoint get endpoint => _awsEndpoint.endpoint;
  @override
  _i14.Future<_i3.PutRumEventsResponse> run(_i2.PutRumEventsRequest input,
      {_i1.HttpClient? client, _i1.ShapeId? useProtocol}) {
    return _i14.runZoned(
        () => super.run(input, client: client, useProtocol: useProtocol),
        zoneValues: {
          ...?_awsEndpoint.credentialScope?.zoneValues,
          ...{_i7.AWSHeaders.sdkInvocationId: _i7.uuid(secure: true)}
        });
  }
}
