// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.type_description; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/field_dimension.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/type_dimension.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i5;

part 'type_description.g.dart';

abstract class TypeDescription
    with _i1.AWSEquatable<TypeDescription>
    implements Built<TypeDescription, TypeDescriptionBuilder> {
  factory TypeDescription({
    required _i2.TypeDimension typeDimension,
    List<_i3.FieldDimension>? fieldDimensions,
  }) {
    return _$TypeDescription._(
      typeDimension: typeDimension,
      fieldDimensions:
          fieldDimensions == null ? null : _i4.BuiltList(fieldDimensions),
    );
  }

  factory TypeDescription.build(
      [void Function(TypeDescriptionBuilder) updates]) = _$TypeDescription;

  const TypeDescription._();

  static const List<_i5.SmithySerializer<TypeDescription>> serializers = [
    TypeDescriptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TypeDescriptionBuilder b) {}
  _i2.TypeDimension get typeDimension;
  _i4.BuiltList<_i3.FieldDimension>? get fieldDimensions;
  @override
  List<Object?> get props => [
        typeDimension,
        fieldDimensions,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('TypeDescription')
      ..add(
        'typeDimension',
        typeDimension,
      )
      ..add(
        'fieldDimensions',
        fieldDimensions,
      );
    return helper.toString();
  }
}

class TypeDescriptionRestJson1Serializer
    extends _i5.StructuredSmithySerializer<TypeDescription> {
  const TypeDescriptionRestJson1Serializer() : super('TypeDescription');

  @override
  Iterable<Type> get types => const [
        TypeDescription,
        _$TypeDescription,
      ];
  @override
  Iterable<_i5.ShapeId> get supportedProtocols => const [
        _i5.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  TypeDescription deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TypeDescriptionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'fieldDimensions':
          result.fieldDimensions.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i4.BuiltList,
              [FullType(_i3.FieldDimension)],
            ),
          ) as _i4.BuiltList<_i3.FieldDimension>));
        case 'typeDimension':
          result.typeDimension = (serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.TypeDimension),
          ) as _i2.TypeDimension);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    TypeDescription object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final TypeDescription(:fieldDimensions, :typeDimension) = object;
    result$.addAll([
      'typeDimension',
      serializers.serialize(
        typeDimension,
        specifiedType: const FullType(_i2.TypeDimension),
      ),
    ]);
    if (fieldDimensions != null) {
      result$
        ..add('fieldDimensions')
        ..add(serializers.serialize(
          fieldDimensions,
          specifiedType: const FullType(
            _i4.BuiltList,
            [FullType(_i3.FieldDimension)],
          ),
        ));
    }
    return result$;
  }
}
