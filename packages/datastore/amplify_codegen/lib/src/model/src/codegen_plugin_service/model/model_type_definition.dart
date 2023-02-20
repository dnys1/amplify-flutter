// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_type_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_index.dart'
    as _i4;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i5;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i6;

part 'model_type_definition.g.dart';

abstract class ModelTypeDefinition
    with _i1.AWSEquatable<ModelTypeDefinition>
    implements Built<ModelTypeDefinition, ModelTypeDefinitionBuilder> {
  factory ModelTypeDefinition({
    List<_i2.AuthRule>? authRules,
    required Map<String, _i3.ModelField> fields,
    required List<_i4.ModelIndex> indexes,
    required String name,
    required String pluralName,
  }) {
    return _$ModelTypeDefinition._(
      authRules: authRules == null ? null : _i5.BuiltList(authRules),
      fields: _i5.BuiltMap(fields),
      indexes: _i5.BuiltList(indexes),
      name: name,
      pluralName: pluralName,
    );
  }

  factory ModelTypeDefinition.build(
          [void Function(ModelTypeDefinitionBuilder) updates]) =
      _$ModelTypeDefinition;

  const ModelTypeDefinition._();

  static const List<_i6.SmithySerializer> serializers = [
    ModelTypeDefinitionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelTypeDefinitionBuilder b) {}
  _i5.BuiltList<_i2.AuthRule>? get authRules;
  _i5.BuiltMap<String, _i3.ModelField> get fields;
  _i5.BuiltList<_i4.ModelIndex> get indexes;
  String get name;
  String get pluralName;
  @override
  List<Object?> get props => [
        authRules,
        fields,
        indexes,
        name,
        pluralName,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelTypeDefinition');
    helper.add(
      'authRules',
      authRules,
    );
    helper.add(
      'fields',
      fields,
    );
    helper.add(
      'indexes',
      indexes,
    );
    helper.add(
      'name',
      name,
    );
    helper.add(
      'pluralName',
      pluralName,
    );
    return helper.toString();
  }
}

class ModelTypeDefinitionRestJson1Serializer
    extends _i6.StructuredSmithySerializer<ModelTypeDefinition> {
  const ModelTypeDefinitionRestJson1Serializer() : super('ModelTypeDefinition');

  @override
  Iterable<Type> get types => const [
        ModelTypeDefinition,
        _$ModelTypeDefinition,
      ];
  @override
  Iterable<_i6.ShapeId> get supportedProtocols => const [
        _i6.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelTypeDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelTypeDefinitionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'authRules':
          if (value != null) {
            result.authRules.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(
                _i5.BuiltList,
                [FullType(_i2.AuthRule)],
              ),
            ) as _i5.BuiltList<_i2.AuthRule>));
          }
          break;
        case 'fields':
          result.fields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltMap,
              [
                FullType(String),
                FullType(_i3.ModelField),
              ],
            ),
          ) as _i5.BuiltMap<String, _i3.ModelField>));
          break;
        case 'indexes':
          result.indexes.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i4.ModelIndex)],
            ),
          ) as _i5.BuiltList<_i4.ModelIndex>));
          break;
        case 'name':
          result.name = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'pluralName':
          result.pluralName = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
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
    final payload = (object as ModelTypeDefinition);
    final result = <Object?>[
      'fields',
      serializers.serialize(
        payload.fields,
        specifiedType: const FullType(
          _i5.BuiltMap,
          [
            FullType(String),
            FullType(_i3.ModelField),
          ],
        ),
      ),
      'indexes',
      serializers.serialize(
        payload.indexes,
        specifiedType: const FullType(
          _i5.BuiltList,
          [FullType(_i4.ModelIndex)],
        ),
      ),
      'name',
      serializers.serialize(
        payload.name,
        specifiedType: const FullType(String),
      ),
      'pluralName',
      serializers.serialize(
        payload.pluralName,
        specifiedType: const FullType(String),
      ),
    ];
    if (payload.authRules != null) {
      result
        ..add('authRules')
        ..add(serializers.serialize(
          payload.authRules!,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i2.AuthRule)],
          ),
        ));
    }
    return result;
  }
}
