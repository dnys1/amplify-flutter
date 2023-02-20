// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_foreign_key; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'model_foreign_key.g.dart';

/// A foreign key model index, which is a special case of a secondary key.
abstract class ModelForeignKey
    with _i1.AWSEquatable<ModelForeignKey>
    implements Built<ModelForeignKey, ModelForeignKeyBuilder> {
  /// A foreign key model index, which is a special case of a secondary key.
  factory ModelForeignKey({
    required String name,
    required String primaryField,
    required List<String> sortKeyFields,
  }) {
    return _$ModelForeignKey._(
      name: name,
      primaryField: primaryField,
      sortKeyFields: _i2.BuiltList(sortKeyFields),
    );
  }

  /// A foreign key model index, which is a special case of a secondary key.
  factory ModelForeignKey.build(
      [void Function(ModelForeignKeyBuilder) updates]) = _$ModelForeignKey;

  const ModelForeignKey._();

  static const List<_i3.SmithySerializer> serializers = [
    ModelForeignKeyRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelForeignKeyBuilder b) {}

  /// The name of the the foreign key to use in the generated code.
  String get name;

  /// The primary field for the index. This is the field to which the `@index` or `@primaryKey` directive is attached. For foreign keys, this is the field with the relational directive.
  String get primaryField;

  /// The list of field names which, combined with \[field\], form a composite key or index. This is the list of fields specified by the \`sortKeyFields\` argument to the `@index` or `@primaryKey` directive. For foreign keys, this is the list of target fields in this model.
  _i2.BuiltList<String> get sortKeyFields;
  @override
  List<Object?> get props => [
        name,
        primaryField,
        sortKeyFields,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelForeignKey');
    helper.add(
      'name',
      name,
    );
    helper.add(
      'primaryField',
      primaryField,
    );
    helper.add(
      'sortKeyFields',
      sortKeyFields,
    );
    return helper.toString();
  }
}

class ModelForeignKeyRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ModelForeignKey> {
  const ModelForeignKeyRestJson1Serializer() : super('ModelForeignKey');

  @override
  Iterable<Type> get types => const [
        ModelForeignKey,
        _$ModelForeignKey,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelForeignKey deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelForeignKeyBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'name':
          result.name = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'primaryField':
          result.primaryField = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'sortKeyFields':
          result.sortKeyFields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(String)],
            ),
          ) as _i2.BuiltList<String>));
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
    final payload = (object as ModelForeignKey);
    final result = <Object?>[
      'name',
      serializers.serialize(
        payload.name,
        specifiedType: const FullType(String),
      ),
      'primaryField',
      serializers.serialize(
        payload.primaryField,
        specifiedType: const FullType(String),
      ),
      'sortKeyFields',
      serializers.serialize(
        payload.sortKeyFields,
        specifiedType: const FullType(
          _i2.BuiltList,
          [FullType(String)],
        ),
      ),
    ];
    return result;
  }
}
