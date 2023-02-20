// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.schema_type_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/enum_type_definition.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type_definition.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/non_model_type_definition.dart'
    as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

/// The discrete values of [SchemaTypeDefinition].
enum SchemaTypeDefinitionType<T extends SchemaTypeDefinition> {
  /// The type for [SchemaTypeDefinitionEnum$].
  enum$<SchemaTypeDefinitionEnum$>(r'enum'),

  /// The type for [SchemaTypeDefinitionModel$].
  model<SchemaTypeDefinitionModel$>(r'model'),

  /// The type for [SchemaTypeDefinitionNonModel$].
  nonModel<SchemaTypeDefinitionNonModel$>(r'nonModel'),

  /// The type for an unknown value.
  sdkUnknown<SchemaTypeDefinitionSdkUnknown$>('sdkUnknown');

  /// The discrete values of [SchemaTypeDefinition].
  const SchemaTypeDefinitionType(this.value);

  /// The Smithy value.
  final String value;
}

abstract class SchemaTypeDefinition
    extends _i1.SmithyUnion<SchemaTypeDefinition> {
  const SchemaTypeDefinition._();

  const factory SchemaTypeDefinition.enum$(_i2.EnumTypeDefinition enum$) =
      SchemaTypeDefinitionEnum$;

  const factory SchemaTypeDefinition.model(_i3.ModelTypeDefinition model) =
      SchemaTypeDefinitionModel$;

  const factory SchemaTypeDefinition.nonModel(
      _i4.NonModelTypeDefinition nonModel) = SchemaTypeDefinitionNonModel$;

  const factory SchemaTypeDefinition.sdkUnknown(
    String name,
    Object value,
  ) = SchemaTypeDefinitionSdkUnknown$;

  static const List<_i1.SmithySerializer<SchemaTypeDefinition>> serializers = [
    SchemaTypeDefinitionRestJson1Serializer()
  ];

  _i2.EnumTypeDefinition? get enum$ => null;
  _i3.ModelTypeDefinition? get model => null;
  _i4.NonModelTypeDefinition? get nonModel => null;
  SchemaTypeDefinitionType get type;
  @override
  Object get value => (enum$ ?? model ?? nonModel)!;
  @override
  T? when<T>({
    T Function(_i2.EnumTypeDefinition)? enum$,
    T Function(_i3.ModelTypeDefinition)? model,
    T Function(_i4.NonModelTypeDefinition)? nonModel,
    T Function(
      String,
      Object,
    )?
        sdkUnknown,
  }) {
    if (this is SchemaTypeDefinitionEnum$) {
      return enum$?.call((this as SchemaTypeDefinitionEnum$).enum$);
    }
    if (this is SchemaTypeDefinitionModel$) {
      return model?.call((this as SchemaTypeDefinitionModel$).model);
    }
    if (this is SchemaTypeDefinitionNonModel$) {
      return nonModel?.call((this as SchemaTypeDefinitionNonModel$).nonModel);
    }
    return sdkUnknown?.call(
      name,
      value,
    );
  }

  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'SchemaTypeDefinition');
    if (enum$ != null) {
      helper.add(
        r'enum$',
        enum$,
      );
    }
    if (model != null) {
      helper.add(
        r'model',
        model,
      );
    }
    if (nonModel != null) {
      helper.add(
        r'nonModel',
        nonModel,
      );
    }
    return helper.toString();
  }
}

class SchemaTypeDefinitionEnum$ extends SchemaTypeDefinition {
  const SchemaTypeDefinitionEnum$(this.enum$) : super._();

  @override
  final _i2.EnumTypeDefinition enum$;

  @override
  SchemaTypeDefinitionType get type => SchemaTypeDefinitionType.enum$;
  @override
  String get name => 'enum';
}

class SchemaTypeDefinitionModel$ extends SchemaTypeDefinition {
  const SchemaTypeDefinitionModel$(this.model) : super._();

  @override
  final _i3.ModelTypeDefinition model;

  @override
  SchemaTypeDefinitionType get type => SchemaTypeDefinitionType.model;
  @override
  String get name => 'model';
}

class SchemaTypeDefinitionNonModel$ extends SchemaTypeDefinition {
  const SchemaTypeDefinitionNonModel$(this.nonModel) : super._();

  @override
  final _i4.NonModelTypeDefinition nonModel;

  @override
  SchemaTypeDefinitionType get type => SchemaTypeDefinitionType.nonModel;
  @override
  String get name => 'nonModel';
}

class SchemaTypeDefinitionSdkUnknown$ extends SchemaTypeDefinition {
  const SchemaTypeDefinitionSdkUnknown$(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;

  @override
  SchemaTypeDefinitionType get type => SchemaTypeDefinitionType.sdkUnknown;
}

class SchemaTypeDefinitionRestJson1Serializer
    extends _i1.StructuredSmithySerializer<SchemaTypeDefinition> {
  const SchemaTypeDefinitionRestJson1Serializer()
      : super('SchemaTypeDefinition');

  @override
  Iterable<Type> get types => const [
        SchemaTypeDefinition,
        SchemaTypeDefinitionEnum$,
        SchemaTypeDefinitionModel$,
        SchemaTypeDefinitionNonModel$,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaTypeDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final iterator = serialized.iterator;
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    final value = iterator.current as Object;
    switch (key) {
      case 'enum':
        return SchemaTypeDefinitionEnum$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.EnumTypeDefinition),
        ) as _i2.EnumTypeDefinition));
      case 'model':
        return SchemaTypeDefinitionModel$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ModelTypeDefinition),
        ) as _i3.ModelTypeDefinition));
      case 'nonModel':
        return SchemaTypeDefinitionNonModel$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.NonModelTypeDefinition),
        ) as _i4.NonModelTypeDefinition));
    }
    return SchemaTypeDefinition.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    (object as SchemaTypeDefinition);
    return [
      object.name,
      object.when<Object?>(
        enum$: (_i2.EnumTypeDefinition enum$) => serializers.serialize(
          enum$,
          specifiedType: const FullType(_i2.EnumTypeDefinition),
        ),
        model: (_i3.ModelTypeDefinition model) => serializers.serialize(
          model,
          specifiedType: const FullType(_i3.ModelTypeDefinition),
        ),
        nonModel: (_i4.NonModelTypeDefinition nonModel) =>
            serializers.serialize(
          nonModel,
          specifiedType: const FullType(_i4.NonModelTypeDefinition),
        ),
        sdkUnknown: (
          String _,
          Object sdkUnknown,
        ) =>
            sdkUnknown,
      )!,
    ];
  }
}
