// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.rum_client;

import 'dart:async' as _i2;

import 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_request.dart'
    as _i4;
import 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_response.dart'
    as _i3;
import 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_request.dart'
    as _i8;
import 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_response.dart'
    as _i7;
import 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_request.dart'
    as _i11;
import 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_response.dart'
    as _i10;
import 'package:aws_rum_dart/src/sdk/src/rum/model/untag_resource_request.dart'
    as _i14;
import 'package:aws_rum_dart/src/sdk/src/rum/model/untag_resource_response.dart'
    as _i13;
import 'package:aws_rum_dart/src/sdk/src/rum/operation/list_tags_for_resource_operation.dart'
    as _i6;
import 'package:aws_rum_dart/src/sdk/src/rum/operation/put_rum_events_operation.dart'
    as _i9;
import 'package:aws_rum_dart/src/sdk/src/rum/operation/tag_resource_operation.dart'
    as _i12;
import 'package:aws_rum_dart/src/sdk/src/rum/operation/untag_resource_operation.dart'
    as _i15;
import 'package:aws_signature_v4/aws_signature_v4.dart' as _i1;
import 'package:smithy/smithy.dart' as _i5;

/// With Amazon CloudWatch RUM, you can perform real-user monitoring to collect client-side data about your web application performance from actual user sessions in real time. The data collected includes page load times, client-side errors, and user behavior. When you view this data, you can see it all aggregated together and also see breakdowns by the browsers and devices that your customers use.
///
/// You can use the collected data to quickly identify and debug client-side performance issues. CloudWatch RUM helps you visualize anomalies in your application performance and find relevant debugging data such as error messages, stack traces, and user sessions. You can also use RUM to understand the range of end-user impact including the number of users, geolocations, and browsers used.
class RumClient {
  /// With Amazon CloudWatch RUM, you can perform real-user monitoring to collect client-side data about your web application performance from actual user sessions in real time. The data collected includes page load times, client-side errors, and user behavior. When you view this data, you can see it all aggregated together and also see breakdowns by the browsers and devices that your customers use.
  ///
  /// You can use the collected data to quickly identify and debug client-side performance issues. CloudWatch RUM helps you visualize anomalies in your application performance and find relevant debugging data such as error messages, stack traces, and user sessions. You can also use RUM to understand the range of end-user impact including the number of users, geolocations, and browsers used.
  const RumClient(
      {required String region,
      Uri? baseUri,
      required _i1.AWSCredentialsProvider credentialsProvider})
      : _region = region,
        _baseUri = baseUri,
        _credentialsProvider = credentialsProvider;

  final String _region;

  final Uri? _baseUri;

  final _i1.AWSCredentialsProvider _credentialsProvider;

  /// Displays the tags associated with a CloudWatch RUM resource.
  _i2.Future<_i3.ListTagsForResourceResponse> listTagsForResource(
      _i4.ListTagsForResourceRequest input,
      {_i5.HttpClient? client}) {
    return _i6.ListTagsForResourceOperation(
            region: _region,
            baseUri: _baseUri,
            credentialsProvider: _credentialsProvider)
        .run(input, client: client);
  }

  /// Sends telemetry events about your application performance and user behavior to CloudWatch RUM. The code snippet that RUM generates for you to add to your application includes `PutRumEvents` operations to send this data to RUM.
  ///
  /// Each `PutRumEvents` operation can send a batch of events from one user session.
  _i2.Future<_i7.PutRumEventsResponse> putRumEvents(
      _i8.PutRumEventsRequest input,
      {_i5.HttpClient? client}) {
    return _i9.PutRumEventsOperation(
            region: _region,
            baseUri: _baseUri,
            credentialsProvider: _credentialsProvider)
        .run(input, client: client);
  }

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
  _i2.Future<_i10.TagResourceResponse> tagResource(
      _i11.TagResourceRequest input,
      {_i5.HttpClient? client}) {
    return _i12.TagResourceOperation(
            region: _region,
            baseUri: _baseUri,
            credentialsProvider: _credentialsProvider)
        .run(input, client: client);
  }

  /// Removes one or more tags from the specified resource.
  _i2.Future<_i13.UntagResourceResponse> untagResource(
      _i14.UntagResourceRequest input,
      {_i5.HttpClient? client}) {
    return _i15.UntagResourceOperation(
            region: _region,
            baseUri: _baseUri,
            credentialsProvider: _credentialsProvider)
        .run(input, client: client);
  }
}
