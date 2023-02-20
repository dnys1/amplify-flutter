// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.auth_rule; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_model_operation.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_provider.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_strategy.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i5;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i6;

part 'auth_rule.g.dart';

abstract class AuthRule
    with _i1.AWSEquatable<AuthRule>
    implements Built<AuthRule, AuthRuleBuilder> {
  factory AuthRule({
    required _i2.AuthStrategy authStrategy,
    String? groupClaim,
    List<String>? groups,
    String? groupsField,
    String? identityClaim,
    List<_i3.AuthModelOperation>? operations,
    String? ownerField,
    _i4.AuthProvider? provider,
  }) {
    return _$AuthRule._(
      authStrategy: authStrategy,
      groupClaim: groupClaim,
      groups: groups == null ? null : _i5.BuiltList(groups),
      groupsField: groupsField,
      identityClaim: identityClaim,
      operations: operations == null ? null : _i5.BuiltList(operations),
      ownerField: ownerField,
      provider: provider,
    );
  }

  factory AuthRule.build([void Function(AuthRuleBuilder) updates]) = _$AuthRule;

  const AuthRule._();

  static const List<_i6.SmithySerializer> serializers = [
    AuthRuleRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(AuthRuleBuilder b) {}
  _i2.AuthStrategy get authStrategy;
  String? get groupClaim;
  _i5.BuiltList<String>? get groups;
  String? get groupsField;
  String? get identityClaim;
  _i5.BuiltList<_i3.AuthModelOperation>? get operations;
  String? get ownerField;
  _i4.AuthProvider? get provider;
  @override
  List<Object?> get props => [
        authStrategy,
        groupClaim,
        groups,
        groupsField,
        identityClaim,
        operations,
        ownerField,
        provider,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AuthRule');
    helper.add(
      'authStrategy',
      authStrategy,
    );
    helper.add(
      'groupClaim',
      groupClaim,
    );
    helper.add(
      'groups',
      groups,
    );
    helper.add(
      'groupsField',
      groupsField,
    );
    helper.add(
      'identityClaim',
      identityClaim,
    );
    helper.add(
      'operations',
      operations,
    );
    helper.add(
      'ownerField',
      ownerField,
    );
    helper.add(
      'provider',
      provider,
    );
    return helper.toString();
  }
}

class AuthRuleRestJson1Serializer
    extends _i6.StructuredSmithySerializer<AuthRule> {
  const AuthRuleRestJson1Serializer() : super('AuthRule');

  @override
  Iterable<Type> get types => const [
        AuthRule,
        _$AuthRule,
      ];
  @override
  Iterable<_i6.ShapeId> get supportedProtocols => const [
        _i6.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  AuthRule deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthRuleBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'authStrategy':
          result.authStrategy = (serializers.deserialize(
            value!,
            specifiedType: const FullType(_i2.AuthStrategy),
          ) as _i2.AuthStrategy);
          break;
        case 'groupClaim':
          if (value != null) {
            result.groupClaim = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'groups':
          if (value != null) {
            result.groups.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(
                _i5.BuiltList,
                [FullType(String)],
              ),
            ) as _i5.BuiltList<String>));
          }
          break;
        case 'groupsField':
          if (value != null) {
            result.groupsField = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'identityClaim':
          if (value != null) {
            result.identityClaim = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'operations':
          if (value != null) {
            result.operations.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(
                _i5.BuiltList,
                [FullType(_i3.AuthModelOperation)],
              ),
            ) as _i5.BuiltList<_i3.AuthModelOperation>));
          }
          break;
        case 'ownerField':
          if (value != null) {
            result.ownerField = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
          break;
        case 'provider':
          if (value != null) {
            result.provider = (serializers.deserialize(
              value,
              specifiedType: const FullType(_i4.AuthProvider),
            ) as _i4.AuthProvider);
          }
          break;
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
    final payload = (object as AuthRule);
    final result = <Object?>[
      'authStrategy',
      serializers.serialize(
        payload.authStrategy,
        specifiedType: const FullType(_i2.AuthStrategy),
      ),
    ];
    if (payload.groupClaim != null) {
      result
        ..add('groupClaim')
        ..add(serializers.serialize(
          payload.groupClaim!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.groups != null) {
      result
        ..add('groups')
        ..add(serializers.serialize(
          payload.groups!,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(String)],
          ),
        ));
    }
    if (payload.groupsField != null) {
      result
        ..add('groupsField')
        ..add(serializers.serialize(
          payload.groupsField!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.identityClaim != null) {
      result
        ..add('identityClaim')
        ..add(serializers.serialize(
          payload.identityClaim!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.operations != null) {
      result
        ..add('operations')
        ..add(serializers.serialize(
          payload.operations!,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i3.AuthModelOperation)],
          ),
        ));
    }
    if (payload.ownerField != null) {
      result
        ..add('ownerField')
        ..add(serializers.serialize(
          payload.ownerField!,
          specifiedType: const FullType(String),
        ));
    }
    if (payload.provider != null) {
      result
        ..add('provider')
        ..add(serializers.serialize(
          payload.provider!,
          specifiedType: const FullType(_i4.AuthProvider),
        ));
    }
    return result;
  }
}
