// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.iam.model.list_roles_response; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;
import 'package:smoke_test/src/sdk/src/iam/model/role.dart' as _i2;

part 'list_roles_response.g.dart';

/// Contains the response to a successful ListRoles request.
abstract class ListRolesResponse
    with _i1.AWSEquatable<ListRolesResponse>
    implements Built<ListRolesResponse, ListRolesResponseBuilder> {
  /// Contains the response to a successful ListRoles request.
  factory ListRolesResponse({
    required List<_i2.Role> roles,
    bool? isTruncated,
    String? marker,
  }) {
    return _$ListRolesResponse._(
      roles: _i3.BuiltList(roles),
      isTruncated: isTruncated,
      marker: marker,
    );
  }

  /// Contains the response to a successful ListRoles request.
  factory ListRolesResponse.build(
      [void Function(ListRolesResponseBuilder) updates]) = _$ListRolesResponse;

  const ListRolesResponse._();

  /// Constructs a [ListRolesResponse] from a [payload] and [response].
  factory ListRolesResponse.fromResponse(
    ListRolesResponse payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload;

  static const List<_i4.SmithySerializer> serializers = [
    ListRolesResponseAwsQuerySerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ListRolesResponseBuilder b) {}

  /// A list of roles.
  _i3.BuiltList<_i2.Role> get roles;

  /// A flag that indicates whether there are more items to return. If your results were truncated, you can make a subsequent pagination request using the `Marker` request parameter to retrieve more items. Note that IAM might return fewer than the `MaxItems` number of results even when there are more results available. We recommend that you check `IsTruncated` after every call to ensure that you receive all your results.
  bool? get isTruncated;

  /// When `IsTruncated` is `true`, this element is present and contains the value to use for the `Marker` parameter in a subsequent pagination request.
  String? get marker;
  @override
  List<Object?> get props => [
        roles,
        isTruncated,
        marker,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ListRolesResponse');
    helper.add(
      'roles',
      roles,
    );
    helper.add(
      'isTruncated',
      isTruncated,
    );
    helper.add(
      'marker',
      marker,
    );
    return helper.toString();
  }
}

class ListRolesResponseAwsQuerySerializer
    extends _i4.StructuredSmithySerializer<ListRolesResponse> {
  const ListRolesResponseAwsQuerySerializer() : super('ListRolesResponse');

  @override
  Iterable<Type> get types => const [
        ListRolesResponse,
        _$ListRolesResponse,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ];
  @override
  ListRolesResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListRolesResponseBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'Roles':
          result.roles.replace((const _i4.XmlBuiltListSerializer(
                  indexer: _i4.XmlIndexer.awsQueryList)
              .deserialize(
            serializers,
            value is String ? const [] : (value as Iterable<Object?>),
            specifiedType: const FullType(
              _i3.BuiltList,
              [FullType(_i2.Role)],
            ),
          ) as _i3.BuiltList<_i2.Role>));
        case 'IsTruncated':
          result.isTruncated = (serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool);
        case 'Marker':
          result.marker = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = (object as ListRolesResponse);
    final result = <Object?>[
      const _i4.XmlElementName(
        'ListRolesResponseResponse',
        _i4.XmlNamespace('https://iam.amazonaws.com/doc/2010-05-08/'),
      )
    ];
    final ListRolesResponse(:roles, :isTruncated, :marker) = payload;
    result
      ..add(const _i4.XmlElementName('Roles'))
      ..add(
          const _i4.XmlBuiltListSerializer(indexer: _i4.XmlIndexer.awsQueryList)
              .serialize(
        serializers,
        roles,
        specifiedType: const FullType.nullable(
          _i3.BuiltList,
          [FullType(_i2.Role)],
        ),
      ));
    if (isTruncated != null) {
      result
        ..add(const _i4.XmlElementName('IsTruncated'))
        ..add(serializers.serialize(
          isTruncated,
          specifiedType: const FullType.nullable(bool),
        ));
    }
    if (marker != null) {
      result
        ..add(const _i4.XmlElementName('Marker'))
        ..add(serializers.serialize(
          marker,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}
