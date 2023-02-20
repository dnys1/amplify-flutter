// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_primary_key; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'model_primary_key.g.dart';

/// An `@primaryKey` model index.
abstract class ModelPrimaryKey
    with _i1.AWSEquatable<ModelPrimaryKey>
    implements Built<ModelPrimaryKey, ModelPrimaryKeyBuilder> {
  /// An `@primaryKey` model index.
  factory ModelPrimaryKey({
    required String primaryField,
    List<String>? sortKeyFields,
  }) {
    return _$ModelPrimaryKey._(
      primaryField: primaryField,
      sortKeyFields:
          sortKeyFields == null ? null : _i2.BuiltList(sortKeyFields),
    );
  }

  /// An `@primaryKey` model index.
  factory ModelPrimaryKey.build(
      [void Function(ModelPrimaryKeyBuilder) updates]) = _$ModelPrimaryKey;

  const ModelPrimaryKey._();

  static const List<_i3.SmithySerializer> serializers = [
    ModelPrimaryKeyRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelPrimaryKeyBuilder b) {}

  /// The primary field for the index. This is the field to which the `@index` or `@primaryKey` directive is attached. For foreign keys, this is the field with the relational directive.
  String get primaryField;

  /// The list of field names which, combined with \[field\], form a composite key or index. This is the list of fields specified by the \`sortKeyFields\` argument to the `@index` or `@primaryKey` directive. For foreign keys, this is the list of target fields in this model.
  _i2.BuiltList<String>? get sortKeyFields;
  @override
  List<Object?> get props => [
        primaryField,
        sortKeyFields,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelPrimaryKey');
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

class ModelPrimaryKeyRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ModelPrimaryKey> {
  const ModelPrimaryKeyRestJson1Serializer() : super('ModelPrimaryKey');

  @override
  Iterable<Type> get types => const [
        ModelPrimaryKey,
        _$ModelPrimaryKey,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelPrimaryKey deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelPrimaryKeyBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'primaryField':
          result.primaryField = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'sortKeyFields':
          if (value != null) {
            result.sortKeyFields.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(
                _i2.BuiltList,
                [FullType(String)],
              ),
            ) as _i2.BuiltList<String>));
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
    final payload = (object as ModelPrimaryKey);
    final result = <Object?>[
      'primaryField',
      serializers.serialize(
        payload.primaryField,
        specifiedType: const FullType(String),
      ),
    ];
    if (payload.sortKeyFields != null) {
      result
        ..add('sortKeyFields')
        ..add(serializers.serialize(
          payload.sortKeyFields!,
          specifiedType: const FullType(
            _i2.BuiltList,
            [FullType(String)],
          ),
        ));
    }
    return result;
  }
}
