// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_field; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_type.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i5;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i6;

part 'model_field.g.dart';

abstract class ModelField
    with _i1.AWSEquatable<ModelField>
    implements Built<ModelField, ModelFieldBuilder> {
  factory ModelField({
    required String name,
    required _i2.SchemaType type,
    bool? isReadOnly,
    _i3.ModelAssociation? association,
    List<_i4.AuthRule>? authRules,
  }) {
    isReadOnly ??= false;
    return _$ModelField._(
      name: name,
      type: type,
      isReadOnly: isReadOnly,
      association: association,
      authRules: authRules == null ? null : _i5.BuiltList(authRules),
    );
  }

  factory ModelField.build([void Function(ModelFieldBuilder) updates]) =
      _$ModelField;

  const ModelField._();

  static const List<_i6.SmithySerializer<ModelField>> serializers = [
    ModelFieldRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelFieldBuilder b) {
    b.isReadOnly = false;
  }

  String get name;

  /// A reference to an Amplify schema type. An Amplify schema type is either a scalar, model, non-model, enum, or a collection of one of these.
  _i2.SchemaType get type;
  bool? get isReadOnly;
  _i3.ModelAssociation? get association;
  _i5.BuiltList<_i4.AuthRule>? get authRules;
  @override
  List<Object?> get props => [
        name,
        type,
        isReadOnly,
        association,
        authRules,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelField')
      ..add(
        'name',
        name,
      )
      ..add(
        'type',
        type,
      )
      ..add(
        'isReadOnly',
        isReadOnly,
      )
      ..add(
        'association',
        association,
      )
      ..add(
        'authRules',
        authRules,
      );
    return helper.toString();
  }
}

class ModelFieldRestJson1Serializer
    extends _i6.StructuredSmithySerializer<ModelField> {
  const ModelFieldRestJson1Serializer() : super('ModelField');

  @override
  Iterable<Type> get types => const [
        ModelField,
        _$ModelField,
      ];
  @override
  Iterable<_i6.ShapeId> get supportedProtocols => const [
        _i6.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelField deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelFieldBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'association':
          result.association = (serializers.deserialize(
            value,
            specifiedType: const FullType(_i3.ModelAssociation),
          ) as _i3.ModelAssociation);
        case 'authRules':
          result.authRules.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i4.AuthRule)],
            ),
          ) as _i5.BuiltList<_i4.AuthRule>));
        case 'isReadOnly':
          result.isReadOnly = (serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool);
        case 'name':
          result.name = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'type':
          result.type = (serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.SchemaType),
          ) as _i2.SchemaType);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelField object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelField(:association, :authRules, :isReadOnly, :name, :type) =
        object;
    result$.addAll([
      'name',
      serializers.serialize(
        name,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        type,
        specifiedType: const FullType(_i2.SchemaType),
      ),
    ]);
    if (association != null) {
      result$
        ..add('association')
        ..add(serializers.serialize(
          association,
          specifiedType: const FullType(_i3.ModelAssociation),
        ));
    }
    if (authRules != null) {
      result$
        ..add('authRules')
        ..add(serializers.serialize(
          authRules,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i4.AuthRule)],
          ),
        ));
    }
    if (isReadOnly != null) {
      result$
        ..add('isReadOnly')
        ..add(serializers.serialize(
          isReadOnly,
          specifiedType: const FullType(bool),
        ));
    }
    return result$;
  }
}
