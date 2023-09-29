// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.list_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_type.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'list_type.g.dart';

/// A list of another \[SchemaType\]. \`\`\`graphql type MyNonModel { name: String! } # \`nonModels` is a list type of \`MyNonModel\` types type MyModel @model { id: ID! nonModels: \[MyNonModel\] } ```
abstract class ListType
    with _i1.AWSEquatable<ListType>
    implements Built<ListType, ListTypeBuilder> {
  /// A list of another \[SchemaType\]. \`\`\`graphql type MyNonModel { name: String! } # \`nonModels` is a list type of \`MyNonModel\` types type MyModel @model { id: ID! nonModels: \[MyNonModel\] } ```
  factory ListType({
    bool? isRequired,
    required _i2.SchemaType ofType,
  }) {
    isRequired ??= false;
    return _$ListType._(
      isRequired: isRequired,
      ofType: ofType,
    );
  }

  /// A list of another \[SchemaType\]. \`\`\`graphql type MyNonModel { name: String! } # \`nonModels` is a list type of \`MyNonModel\` types type MyModel @model { id: ID! nonModels: \[MyNonModel\] } ```
  factory ListType.build([void Function(ListTypeBuilder) updates]) = _$ListType;

  const ListType._();

  static const List<_i3.SmithySerializer<ListType>> serializers = [
    ListTypeRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ListTypeBuilder b) {
    b.isRequired = false;
  }

  /// Whether the type is required (non-nullable) in this context.
  bool get isRequired;

  /// The type of the list's elements.
  _i2.SchemaType get ofType;
  @override
  List<Object?> get props => [
        isRequired,
        ofType,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ListType')
      ..add(
        'isRequired',
        isRequired,
      )
      ..add(
        'ofType',
        ofType,
      );
    return helper.toString();
  }
}

class ListTypeRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ListType> {
  const ListTypeRestJson1Serializer() : super('ListType');

  @override
  Iterable<Type> get types => const [
        ListType,
        _$ListType,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ListType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListTypeBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'isRequired':
          result.isRequired = (serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool);
        case 'ofType':
          result.ofType = (serializers.deserialize(
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
    ListType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ListType(:isRequired, :ofType) = object;
    result$.addAll([
      'isRequired',
      serializers.serialize(
        isRequired,
        specifiedType: const FullType(bool),
      ),
      'ofType',
      serializers.serialize(
        ofType,
        specifiedType: const FullType(_i2.SchemaType),
      ),
    ]);
    return result$;
  }
}
