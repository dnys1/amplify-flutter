// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

/// # CloudWatch RUM
///
/// With Amazon CloudWatch RUM, you can perform real-user monitoring to collect client-side data about your web application performance from actual user sessions in real time. The data collected includes page load times, client-side errors, and user behavior. When you view this data, you can see it all aggregated together and also see breakdowns by the browsers and devices that your customers use.
///
/// You can use the collected data to quickly identify and debug client-side performance issues. CloudWatch RUM helps you visualize anomalies in your application performance and find relevant debugging data such as error messages, stack traces, and user sessions. You can also use RUM to understand the range of end-user impact including the number of users, geolocations, and browsers used.
library aws_rum_dart.rum;

export 'package:aws_rum_dart/src/sdk/src/rum/model/access_denied_exception.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/app_monitor_details.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/internal_server_exception.dart'
    hide InternalServerExceptionPayload;
export 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_request.dart'
    hide ListTagsForResourceRequestPayload;
export 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_response.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_request.dart'
    hide PutRumEventsRequestPayload;
export 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_response.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/resource_not_found_exception.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/rum_event.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_request.dart'
    hide TagResourceRequestPayload;
export 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_response.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/throttling_exception.dart'
    hide ThrottlingExceptionPayload;
export 'package:aws_rum_dart/src/sdk/src/rum/model/untag_resource_request.dart'
    hide UntagResourceRequestPayload;
export 'package:aws_rum_dart/src/sdk/src/rum/model/untag_resource_response.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/user_details.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/model/validation_exception.dart';
export 'package:aws_rum_dart/src/sdk/src/rum/rum_client.dart';
