// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_auth; // ignore_for_file: no_leading_underscores_for_library_prefixes

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

sealed class ModelAuth extends _i1.SmithyUnion<ModelAuth> {
  const ModelAuth._();

  const factory ModelAuth.global() = ModelAuthGlobal;

  factory ModelAuth.singleAuth({
    required _i2.AuthStrategy authStrategy,
    String? ownerField,
    String? identityClaim,
    String? groupClaim,
    List<String>? groups,
    String? groupsField,
    _i3.AuthProvider? provider,
    List<_i4.AuthModelOperation>? operations,
  }) =>
      ModelAuthSingleAuth(_i5.AuthRule(
        authStrategy: authStrategy,
        ownerField: ownerField,
        identityClaim: identityClaim,
        groupClaim: groupClaim,
        groups: groups,
        groupsField: groupsField,
        provider: provider,
        operations: operations,
      ));

  factory ModelAuth.multiAuth(List<_i5.AuthRule> multiAuth) =
      ModelAuthMultiAuth;

  const factory ModelAuth.sdkUnknown(
    String name,
    Object value,
  ) = ModelAuthSdkUnknown;

  static const List<_i1.SmithySerializer<ModelAuth>> serializers = [
    ModelAuthRestJson1Serializer()
  ];

  _i1.Unit? get global => null;
  _i5.AuthRule? get singleAuth => null;
  _i6.BuiltList<_i5.AuthRule>? get multiAuth => null;
  @override
  Object get value => (global ?? singleAuth ?? multiAuth)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'ModelAuth');
    if (global != null) {
      helper.add(
        r'global',
        global,
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

final class ModelAuthGlobal extends ModelAuth {
  const ModelAuthGlobal() : super._();

  @override
  String get name => 'global';
  @override
  _i1.Unit get global => const _i1.Unit();
}

final class ModelAuthSingleAuth extends ModelAuth {
  const ModelAuthSingleAuth(this.singleAuth) : super._();

  @override
  final _i5.AuthRule singleAuth;

  @override
  String get name => 'singleAuth';
}

final class ModelAuthMultiAuth extends ModelAuth {
  ModelAuthMultiAuth(List<_i5.AuthRule> multiAuth)
      : this._(_i6.BuiltList(multiAuth));

  const ModelAuthMultiAuth._(this.multiAuth) : super._();

  @override
  final _i6.BuiltList<_i5.AuthRule> multiAuth;

  @override
  String get name => 'multiAuth';
}

final class ModelAuthSdkUnknown extends ModelAuth {
  const ModelAuthSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class ModelAuthRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ModelAuth> {
  const ModelAuthRestJson1Serializer() : super('ModelAuth');

  @override
  Iterable<Type> get types => const [
        ModelAuth,
        ModelAuthGlobal,
        ModelAuthSingleAuth,
        ModelAuthMultiAuth,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelAuth deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'global':
        return const ModelAuthGlobal();
      case 'singleAuth':
        return ModelAuthSingleAuth((serializers.deserialize(
          value,
          specifiedType: const FullType(_i5.AuthRule),
        ) as _i5.AuthRule));
      case 'multiAuth':
        return ModelAuthMultiAuth._((serializers.deserialize(
          value,
          specifiedType: const FullType(
            _i6.BuiltList,
            [FullType(_i5.AuthRule)],
          ),
        ) as _i6.BuiltList<_i5.AuthRule>));
    }
    return ModelAuth.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelAuth object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        ModelAuthGlobal(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i1.Unit),
          ),
        ModelAuthSingleAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i5.AuthRule),
          ),
        ModelAuthMultiAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(
              _i6.BuiltList,
              [FullType(_i5.AuthRule)],
            ),
          ),
        ModelAuthSdkUnknown(:final value) => value,
      },
    ];
  }
}
