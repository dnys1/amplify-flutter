// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.common.serializers;

import 'package:aws_rum_dart/src/sdk/src/rum/model/access_denied_exception.dart'
    as _i12;
import 'package:aws_rum_dart/src/sdk/src/rum/model/app_monitor_details.dart'
    as _i7;
import 'package:aws_rum_dart/src/sdk/src/rum/model/internal_server_exception.dart'
    as _i4;
import 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_request.dart'
    as _i2;
import 'package:aws_rum_dart/src/sdk/src/rum/model/list_tags_for_resource_response.dart'
    as _i3;
import 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_request.dart'
    as _i10;
import 'package:aws_rum_dart/src/sdk/src/rum/model/put_rum_events_response.dart'
    as _i11;
import 'package:aws_rum_dart/src/sdk/src/rum/model/resource_not_found_exception.dart'
    as _i5;
import 'package:aws_rum_dart/src/sdk/src/rum/model/rum_event.dart' as _i9;
import 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_request.dart'
    as _i14;
import 'package:aws_rum_dart/src/sdk/src/rum/model/tag_resource_response.dart'
    as _i15;
import 'package:aws_rum_dart/src/sdk/src/rum/model/throttling_exception.dart'
    as _i13;
import 'package:aws_rum_dart/src/sdk/src/rum/model/untag_resource_request.dart'
    as _i16;
import 'package:aws_rum_dart/src/sdk/src/rum/model/untag_resource_response.dart'
    as _i17;
import 'package:aws_rum_dart/src/sdk/src/rum/model/user_details.dart' as _i8;
import 'package:aws_rum_dart/src/sdk/src/rum/model/validation_exception.dart'
    as _i6;
import 'package:built_collection/built_collection.dart' as _i18;
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

const List<_i1.SmithySerializer> serializers = [
  ..._i2.ListTagsForResourceRequest.serializers,
  ..._i3.ListTagsForResourceResponse.serializers,
  ..._i4.InternalServerException.serializers,
  ..._i5.ResourceNotFoundException.serializers,
  ..._i6.ValidationException.serializers,
  ..._i7.AppMonitorDetails.serializers,
  ..._i8.UserDetails.serializers,
  ..._i9.RumEvent.serializers,
  ..._i10.PutRumEventsRequest.serializers,
  ..._i11.PutRumEventsResponse.serializers,
  ..._i12.AccessDeniedException.serializers,
  ..._i13.ThrottlingException.serializers,
  ..._i14.TagResourceRequest.serializers,
  ..._i15.TagResourceResponse.serializers,
  ..._i16.UntagResourceRequest.serializers,
  ..._i17.UntagResourceResponse.serializers
];
final Map<FullType, Function> builderFactories = {
  const FullType(_i18.BuiltMap, [FullType(String), FullType(String)]):
      _i18.MapBuilder<String, String>.new,
  const FullType(_i18.BuiltList, [FullType(_i9.RumEvent)]):
      _i18.ListBuilder<_i9.RumEvent>.new,
  const FullType(_i18.BuiltList, [FullType(String)]):
      _i18.ListBuilder<String>.new
};
