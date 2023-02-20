// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_secondary_key; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'model_secondary_key.g.dart';

/// An `@index` model index.
abstract class ModelSecondaryKey
    with _i1.AWSEquatable<ModelSecondaryKey>
    implements Built<ModelSecondaryKey, ModelSecondaryKeyBuilder> {
  /// An `@index` model index.
  factory ModelSecondaryKey({
    required String name,
    required String primaryField,
    required String queryField,
    List<String>? sortKeyFields,
  }) {
    return _$ModelSecondaryKey._(
      name: name,
      primaryField: primaryField,
      queryField: queryField,
      sortKeyFields:
          sortKeyFields == null ? null : _i2.BuiltList(sortKeyFields),
    );
  }

  /// An `@index` model index.
  factory ModelSecondaryKey.build(
      [void Function(ModelSecondaryKeyBuilder) updates]) = _$ModelSecondaryKey;

  const ModelSecondaryKey._();

  static const List<_i3.SmithySerializer> serializers = [
    ModelSecondaryKeyRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelSecondaryKeyBuilder b) {}

  /// The index's name that is defined by the \`name\` parameter of `@index` directive in the model schema.
  String get name;

  /// The primary field for the index. This is the field to which the `@index` or `@primaryKey` directive is attached. For foreign keys, this is the field with the relational directive.
  String get primaryField;

  /// The index's query field that is defined by the \`queryField\` parameter of `@index` directive in the model schema.
  String get queryField;

  /// The list of field names which, combined with \[field\], form a composite key or index. This is the list of fields specified by the \`sortKeyFields\` argument to the `@index` or `@primaryKey` directive. For foreign keys, this is the list of target fields in this model.
  _i2.BuiltList<String>? get sortKeyFields;
  @override
  List<Object?> get props => [
        name,
        primaryField,
        queryField,
        sortKeyFields,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelSecondaryKey');
    helper.add(
      'name',
      name,
    );
    helper.add(
      'primaryField',
      primaryField,
    );
    helper.add(
      'queryField',
      queryField,
    );
    helper.add(
      'sortKeyFields',
      sortKeyFields,
    );
    return helper.toString();
  }
}

class ModelSecondaryKeyRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ModelSecondaryKey> {
  const ModelSecondaryKeyRestJson1Serializer() : super('ModelSecondaryKey');

  @override
  Iterable<Type> get types => const [
        ModelSecondaryKey,
        _$ModelSecondaryKey,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelSecondaryKey deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelSecondaryKeyBuilder();
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
        case 'queryField':
          result.queryField = (serializers.deserialize(
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
    final payload = (object as ModelSecondaryKey);
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
      'queryField',
      serializers.serialize(
        payload.queryField,
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
