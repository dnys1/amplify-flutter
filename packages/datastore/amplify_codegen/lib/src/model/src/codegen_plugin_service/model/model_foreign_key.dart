// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

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
    required String primaryField,
    required List<String> sortKeyFields,
    required String name,
  }) {
    return _$ModelForeignKey._(
      primaryField: primaryField,
      sortKeyFields: _i2.BuiltList(sortKeyFields),
      name: name,
    );
  }

  /// A foreign key model index, which is a special case of a secondary key.
  factory ModelForeignKey.build(
      [void Function(ModelForeignKeyBuilder) updates]) = _$ModelForeignKey;

  const ModelForeignKey._();

  static const List<_i3.SmithySerializer<ModelForeignKey>> serializers = [
    ModelForeignKeyRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelForeignKeyBuilder b) {}

  /// The primary field for the index. This is the field to which the `@index` or `@primaryKey` directive is attached. For foreign keys, this is the field with the relational directive.
  String get primaryField;

  /// The list of field names which, combined with \[field\], form a composite key or index. This is the list of fields specified by the \`sortKeyFields\` argument to the `@index` or `@primaryKey` directive. For foreign keys, this is the list of target fields in this model.
  _i2.BuiltList<String> get sortKeyFields;

  /// The name of the the foreign key to use in the generated code.
  String get name;
  @override
  List<Object?> get props => [
        primaryField,
        sortKeyFields,
        name,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelForeignKey')
      ..add(
        'primaryField',
        primaryField,
      )
      ..add(
        'sortKeyFields',
        sortKeyFields,
      )
      ..add(
        'name',
        name,
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
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'name':
          result.name = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'primaryField':
          result.primaryField = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'sortKeyFields':
          result.sortKeyFields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(String)],
            ),
          ) as _i2.BuiltList<String>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelForeignKey object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelForeignKey(:name, :primaryField, :sortKeyFields) = object;
    result$.addAll([
      'name',
      serializers.serialize(
        name,
        specifiedType: const FullType(String),
      ),
      'primaryField',
      serializers.serialize(
        primaryField,
        specifiedType: const FullType(String),
      ),
      'sortKeyFields',
      serializers.serialize(
        sortKeyFields,
        specifiedType: const FullType(
          _i2.BuiltList,
          [FullType(String)],
        ),
      ),
    ]);
    return result$;
  }
}
