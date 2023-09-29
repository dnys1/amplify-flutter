// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.auth_rule; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_model_operation.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_provider.dart'
    as _i3;
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
    String? ownerField,
    String? identityClaim,
    String? groupClaim,
    List<String>? groups,
    String? groupsField,
    _i3.AuthProvider? provider,
    List<_i4.AuthModelOperation>? operations,
  }) {
    return _$AuthRule._(
      authStrategy: authStrategy,
      ownerField: ownerField,
      identityClaim: identityClaim,
      groupClaim: groupClaim,
      groups: groups == null ? null : _i5.BuiltList(groups),
      groupsField: groupsField,
      provider: provider,
      operations: operations == null ? null : _i5.BuiltList(operations),
    );
  }

  factory AuthRule.build([void Function(AuthRuleBuilder) updates]) = _$AuthRule;

  const AuthRule._();

  static const List<_i6.SmithySerializer<AuthRule>> serializers = [
    AuthRuleRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(AuthRuleBuilder b) {}
  _i2.AuthStrategy get authStrategy;
  String? get ownerField;
  String? get identityClaim;
  String? get groupClaim;
  _i5.BuiltList<String>? get groups;
  String? get groupsField;
  _i3.AuthProvider? get provider;
  _i5.BuiltList<_i4.AuthModelOperation>? get operations;
  @override
  List<Object?> get props => [
        authStrategy,
        ownerField,
        identityClaim,
        groupClaim,
        groups,
        groupsField,
        provider,
        operations,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AuthRule')
      ..add(
        'authStrategy',
        authStrategy,
      )
      ..add(
        'ownerField',
        ownerField,
      )
      ..add(
        'identityClaim',
        identityClaim,
      )
      ..add(
        'groupClaim',
        groupClaim,
      )
      ..add(
        'groups',
        groups,
      )
      ..add(
        'groupsField',
        groupsField,
      )
      ..add(
        'provider',
        provider,
      )
      ..add(
        'operations',
        operations,
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
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'authStrategy':
          result.authStrategy = (serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.AuthStrategy),
          ) as _i2.AuthStrategy);
        case 'groupClaim':
          result.groupClaim = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'groups':
          result.groups.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(String)],
            ),
          ) as _i5.BuiltList<String>));
        case 'groupsField':
          result.groupsField = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'identityClaim':
          result.identityClaim = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'operations':
          result.operations.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i4.AuthModelOperation)],
            ),
          ) as _i5.BuiltList<_i4.AuthModelOperation>));
        case 'ownerField':
          result.ownerField = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'provider':
          result.provider = (serializers.deserialize(
            value,
            specifiedType: const FullType(_i3.AuthProvider),
          ) as _i3.AuthProvider);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    AuthRule object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final AuthRule(
      :authStrategy,
      :groupClaim,
      :groups,
      :groupsField,
      :identityClaim,
      :operations,
      :ownerField,
      :provider
    ) = object;
    result$.addAll([
      'authStrategy',
      serializers.serialize(
        authStrategy,
        specifiedType: const FullType(_i2.AuthStrategy),
      ),
    ]);
    if (groupClaim != null) {
      result$
        ..add('groupClaim')
        ..add(serializers.serialize(
          groupClaim,
          specifiedType: const FullType(String),
        ));
    }
    if (groups != null) {
      result$
        ..add('groups')
        ..add(serializers.serialize(
          groups,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(String)],
          ),
        ));
    }
    if (groupsField != null) {
      result$
        ..add('groupsField')
        ..add(serializers.serialize(
          groupsField,
          specifiedType: const FullType(String),
        ));
    }
    if (identityClaim != null) {
      result$
        ..add('identityClaim')
        ..add(serializers.serialize(
          identityClaim,
          specifiedType: const FullType(String),
        ));
    }
    if (operations != null) {
      result$
        ..add('operations')
        ..add(serializers.serialize(
          operations,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i4.AuthModelOperation)],
          ),
        ));
    }
    if (ownerField != null) {
      result$
        ..add('ownerField')
        ..add(serializers.serialize(
          ownerField,
          specifiedType: const FullType(String),
        ));
    }
    if (provider != null) {
      result$
        ..add('provider')
        ..add(serializers.serialize(
          provider,
          specifiedType: const FullType(_i3.AuthProvider),
        ));
    }
    return result$;
  }
}
