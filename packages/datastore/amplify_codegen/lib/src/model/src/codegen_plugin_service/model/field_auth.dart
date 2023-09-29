// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.field_auth; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_model_operation.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_provider.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_strategy.dart'
    as _i2;
import 'package:built_collection/built_collection.dart' as _i6;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class FieldAuth extends _i1.SmithyUnion<FieldAuth> {
  const FieldAuth._();

  const factory FieldAuth.noAuth() = FieldAuthNoAuth;

  factory FieldAuth.singleAuth({
    required _i2.AuthStrategy authStrategy,
    String? ownerField,
    String? identityClaim,
    String? groupClaim,
    List<String>? groups,
    String? groupsField,
    _i3.AuthProvider? provider,
    List<_i4.AuthModelOperation>? operations,
  }) =>
      FieldAuthSingleAuth(_i5.AuthRule(
        authStrategy: authStrategy,
        ownerField: ownerField,
        identityClaim: identityClaim,
        groupClaim: groupClaim,
        groups: groups,
        groupsField: groupsField,
        provider: provider,
        operations: operations,
      ));

  factory FieldAuth.multiAuth(List<_i5.AuthRule> multiAuth) =
      FieldAuthMultiAuth;

  const factory FieldAuth.sdkUnknown(
    String name,
    Object value,
  ) = FieldAuthSdkUnknown;

  static const List<_i1.SmithySerializer<FieldAuth>> serializers = [
    FieldAuthRestJson1Serializer()
  ];

  _i1.Unit? get noAuth => null;
  _i5.AuthRule? get singleAuth => null;
  _i6.BuiltList<_i5.AuthRule>? get multiAuth => null;
  @override
  Object get value => (noAuth ?? singleAuth ?? multiAuth)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'FieldAuth');
    if (noAuth != null) {
      helper.add(
        r'noAuth',
        noAuth,
      );
    }
    if (singleAuth != null) {
      helper.add(
        r'singleAuth',
        singleAuth,
      );
    }
    if (multiAuth != null) {
      helper.add(
        r'multiAuth',
        multiAuth,
      );
    }
    return helper.toString();
  }
}

final class FieldAuthNoAuth extends FieldAuth {
  const FieldAuthNoAuth() : super._();

  @override
  String get name => 'noAuth';
  @override
  _i1.Unit get noAuth => const _i1.Unit();
}

final class FieldAuthSingleAuth extends FieldAuth {
  const FieldAuthSingleAuth(this.singleAuth) : super._();

  @override
  final _i5.AuthRule singleAuth;

  @override
  String get name => 'singleAuth';
}

final class FieldAuthMultiAuth extends FieldAuth {
  FieldAuthMultiAuth(List<_i5.AuthRule> multiAuth)
      : this._(_i6.BuiltList(multiAuth));

  const FieldAuthMultiAuth._(this.multiAuth) : super._();

  @override
  final _i6.BuiltList<_i5.AuthRule> multiAuth;

  @override
  String get name => 'multiAuth';
}

final class FieldAuthSdkUnknown extends FieldAuth {
  const FieldAuthSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class FieldAuthRestJson1Serializer
    extends _i1.StructuredSmithySerializer<FieldAuth> {
  const FieldAuthRestJson1Serializer() : super('FieldAuth');

  @override
  Iterable<Type> get types => const [
        FieldAuth,
        FieldAuthNoAuth,
        FieldAuthSingleAuth,
        FieldAuthMultiAuth,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  FieldAuth deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'noAuth':
        return const FieldAuthNoAuth();
      case 'singleAuth':
        return FieldAuthSingleAuth((serializers.deserialize(
          value,
          specifiedType: const FullType(_i5.AuthRule),
        ) as _i5.AuthRule));
      case 'multiAuth':
        return FieldAuthMultiAuth._((serializers.deserialize(
          value,
          specifiedType: const FullType(
            _i6.BuiltList,
            [FullType(_i5.AuthRule)],
          ),
        ) as _i6.BuiltList<_i5.AuthRule>));
    }
    return FieldAuth.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    FieldAuth object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        FieldAuthNoAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i1.Unit),
          ),
        FieldAuthSingleAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i5.AuthRule),
          ),
        FieldAuthMultiAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(
              _i6.BuiltList,
              [FullType(_i5.AuthRule)],
            ),
          ),
        FieldAuthSdkUnknown(:final value) => value,
      },
    ];
  }
}
