// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_field; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_type.dart'
    as _i4;
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
    _i2.ModelAssociation? association,
    List<_i3.AuthRule>? authRules,
    bool? isReadOnly,
    required String name,
    required _i4.SchemaType type,
  }) {
    isReadOnly ??= false;
    return _$ModelField._(
      association: association,
      authRules: authRules == null ? null : _i5.BuiltList(authRules),
      isReadOnly: isReadOnly,
      name: name,
      type: type,
    );
  }

  factory ModelField.build([void Function(ModelFieldBuilder) updates]) =
      _$ModelField;

  const ModelField._();

  static const List<_i6.SmithySerializer> serializers = [
    ModelFieldRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelFieldBuilder b) {
    b.isReadOnly = false;
  }

  _i2.ModelAssociation? get association;
  _i5.BuiltList<_i3.AuthRule>? get authRules;
  bool? get isReadOnly;
  String get name;

  /// A reference to an Amplify schema type. An Amplify schema type is either a scalar, model, non-model, enum, or a collection of one of these.
  _i4.SchemaType get type;
  @override
  List<Object?> get props => [
        association,
        authRules,
        isReadOnly,
        name,
        type,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelField');
    helper.add(
      'association',
      association,
    );
    helper.add(
      'authRules',
      authRules,
    );
    helper.add(
      'isReadOnly',
      isReadOnly,
    );
    helper.add(
      'name',
      name,
    );
    helper.add(
      'type',
      type,
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
      switch (key) {
        case 'association':
          if (value != null) {
            result.association = (serializers.deserialize(
              value,
              specifiedType: const FullType(_i2.ModelAssociation),
            ) as _i2.ModelAssociation);
          }
          break;
        case 'authRules':
          if (value != null) {
            result.authRules.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(
                _i5.BuiltList,
                [FullType(_i3.AuthRule)],
              ),
            ) as _i5.BuiltList<_i3.AuthRule>));
          }
          break;
        case 'isReadOnly':
          if (value != null) {
            result.isReadOnly = (serializers.deserialize(
              value,
              specifiedType: const FullType(bool),
            ) as bool);
          }
          break;
        case 'name':
          result.name = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'type':
          result.type = (serializers.deserialize(
            value!,
            specifiedType: const FullType(_i4.SchemaType),
          ) as _i4.SchemaType);
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
    final payload = (object as ModelField);
    final result = <Object?>[
      'name',
      serializers.serialize(
        payload.name,
        specifiedType: const FullType(String),
      ),
      'type',
      serializers.serialize(
        payload.type,
        specifiedType: const FullType(_i4.SchemaType),
      ),
    ];
    if (payload.association != null) {
      result
        ..add('association')
        ..add(serializers.serialize(
          payload.association!,
          specifiedType: const FullType(_i2.ModelAssociation),
        ));
    }
    if (payload.authRules != null) {
      result
        ..add('authRules')
        ..add(serializers.serialize(
          payload.authRules!,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i3.AuthRule)],
          ),
        ));
    }
    if (payload.isReadOnly != null) {
      result
        ..add('isReadOnly')
        ..add(serializers.serialize(
          payload.isReadOnly!,
          specifiedType: const FullType(bool),
        ));
    }
    return result;
  }
}
