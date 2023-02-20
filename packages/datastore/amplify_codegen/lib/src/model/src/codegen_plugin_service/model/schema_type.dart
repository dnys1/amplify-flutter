// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.schema_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/enum_type.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/list_type.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/non_model_type.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/scalar_type.dart'
    as _i6;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

/// The discrete values of [SchemaType].
enum SchemaTypeType<T extends SchemaType> {
  /// The type for [SchemaTypeEnum$].
  enum$<SchemaTypeEnum$>(r'enum'),

  /// The type for [SchemaTypeList$].
  list<SchemaTypeList$>(r'list'),

  /// The type for [SchemaTypeModel$].
  model<SchemaTypeModel$>(r'model'),

  /// The type for [SchemaTypeNonModel$].
  nonModel<SchemaTypeNonModel$>(r'nonModel'),

  /// The type for [SchemaTypeScalar$].
  scalar<SchemaTypeScalar$>(r'scalar'),

  /// The type for an unknown value.
  sdkUnknown<SchemaTypeSdkUnknown$>('sdkUnknown');

  /// The discrete values of [SchemaType].
  const SchemaTypeType(this.value);

  /// The Smithy value.
  final String value;
}

/// A reference to an Amplify schema type. An Amplify schema type is either a scalar, model, non-model, enum, or a collection of one of these.
abstract class SchemaType extends _i1.SmithyUnion<SchemaType> {
  const SchemaType._();

  const factory SchemaType.enum$(_i2.EnumType enum$) = SchemaTypeEnum$;

  const factory SchemaType.list(_i3.ListType list) = SchemaTypeList$;

  const factory SchemaType.model(_i4.ModelType model) = SchemaTypeModel$;

  const factory SchemaType.nonModel(_i5.NonModelType nonModel) =
      SchemaTypeNonModel$;

  const factory SchemaType.scalar(_i6.ScalarType scalar) = SchemaTypeScalar$;

  const factory SchemaType.sdkUnknown(
    String name,
    Object value,
  ) = SchemaTypeSdkUnknown$;

  static const List<_i1.SmithySerializer<SchemaType>> serializers = [
    SchemaTypeRestJson1Serializer()
  ];

  /// A custom enumeration. \`\`\`graphql # \`MyEnum` is an enum type. enum MyEnum { VALUE1 VALUE2 } ```
  _i2.EnumType? get enum$ => null;

  /// A list of another \[SchemaType\]. \`\`\`graphql type MyNonModel { name: String! } # \`nonModels` is a list type of \`MyNonModel\` types type MyModel @model { id: ID! nonModels: \[MyNonModel\] } ```
  _i3.ListType? get list => null;

  /// A custom structure with an `@model` directive. \`\`\`graphql # \`MyModel` is a model type. type MyModel @model { id: ID! } ```
  _i4.ModelType? get model => null;

  /// A custom structure without an `@model` directive. \`\`\`graphql # \`MyNonModel` is a non-model type. type MyNonModel { name: String! } ```
  _i5.NonModelType? get nonModel => null;

  /// A scalar (primitive) type, e.g. \`ID\`, \`String\`, \`AWSDateTime\`. AppSync defines 9 \[scalar types\](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html) on top of the default 5 GraphQL scalar types (\`ID\`, \`String\`, \`Int\`, \`Float\`, \`Boolean\`): - \`AWSDate\` - \`AWSTime\` - \`AWSDateTime\` - \`AWSTimestamp\` - \`AWSEmail\` - \`AWSJSON\` - \`AWSURL\` - \`AWSPhone\` - \`AWSIPAddress\`
  _i6.ScalarType? get scalar => null;
  SchemaTypeType get type;
  @override
  Object get value => (enum$ ?? list ?? model ?? nonModel ?? scalar)!;
  @override
  T? when<T>({
    T Function(_i2.EnumType)? enum$,
    T Function(_i3.ListType)? list,
    T Function(_i4.ModelType)? model,
    T Function(_i5.NonModelType)? nonModel,
    T Function(_i6.ScalarType)? scalar,
    T Function(
      String,
      Object,
    )?
        sdkUnknown,
  }) {
    if (this is SchemaTypeEnum$) {
      return enum$?.call((this as SchemaTypeEnum$).enum$);
    }
    if (this is SchemaTypeList$) {
      return list?.call((this as SchemaTypeList$).list);
    }
    if (this is SchemaTypeModel$) {
      return model?.call((this as SchemaTypeModel$).model);
    }
    if (this is SchemaTypeNonModel$) {
      return nonModel?.call((this as SchemaTypeNonModel$).nonModel);
    }
    if (this is SchemaTypeScalar$) {
      return scalar?.call((this as SchemaTypeScalar$).scalar);
    }
    return sdkUnknown?.call(
      name,
      value,
    );
  }

  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'SchemaType');
    if (enum$ != null) {
      helper.add(
        r'enum$',
        enum$,
      );
    }
    if (list != null) {
      helper.add(
        r'list',
        list,
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
    if (scalar != null) {
      helper.add(
        r'scalar',
        scalar,
      );
    }
    return helper.toString();
  }
}

class SchemaTypeEnum$ extends SchemaType {
  const SchemaTypeEnum$(this.enum$) : super._();

  @override
  final _i2.EnumType enum$;

  @override
  SchemaTypeType get type => SchemaTypeType.enum$;
  @override
  String get name => 'enum';
}

class SchemaTypeList$ extends SchemaType {
  const SchemaTypeList$(this.list) : super._();

  @override
  final _i3.ListType list;

  @override
  SchemaTypeType get type => SchemaTypeType.list;
  @override
  String get name => 'list';
}

class SchemaTypeModel$ extends SchemaType {
  const SchemaTypeModel$(this.model) : super._();

  @override
  final _i4.ModelType model;

  @override
  SchemaTypeType get type => SchemaTypeType.model;
  @override
  String get name => 'model';
}

class SchemaTypeNonModel$ extends SchemaType {
  const SchemaTypeNonModel$(this.nonModel) : super._();

  @override
  final _i5.NonModelType nonModel;

  @override
  SchemaTypeType get type => SchemaTypeType.nonModel;
  @override
  String get name => 'nonModel';
}

class SchemaTypeScalar$ extends SchemaType {
  const SchemaTypeScalar$(this.scalar) : super._();

  @override
  final _i6.ScalarType scalar;

  @override
  SchemaTypeType get type => SchemaTypeType.scalar;
  @override
  String get name => 'scalar';
}

class SchemaTypeSdkUnknown$ extends SchemaType {
  const SchemaTypeSdkUnknown$(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;

  @override
  SchemaTypeType get type => SchemaTypeType.sdkUnknown;
}

class SchemaTypeRestJson1Serializer
    extends _i1.StructuredSmithySerializer<SchemaType> {
  const SchemaTypeRestJson1Serializer() : super('SchemaType');

  @override
  Iterable<Type> get types => const [
        SchemaType,
        SchemaTypeEnum$,
        SchemaTypeList$,
        SchemaTypeModel$,
        SchemaTypeNonModel$,
        SchemaTypeScalar$,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaType deserialize(
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
        return SchemaTypeEnum$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.EnumType),
        ) as _i2.EnumType));
      case 'list':
        return SchemaTypeList$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ListType),
        ) as _i3.ListType));
      case 'model':
        return SchemaTypeModel$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.ModelType),
        ) as _i4.ModelType));
      case 'nonModel':
        return SchemaTypeNonModel$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i5.NonModelType),
        ) as _i5.NonModelType));
      case 'scalar':
        return SchemaTypeScalar$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i6.ScalarType),
        ) as _i6.ScalarType));
    }
    return SchemaType.sdkUnknown(
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
    (object as SchemaType);
    return [
      object.name,
      object.when<Object?>(
        enum$: (_i2.EnumType enum$) => serializers.serialize(
          enum$,
          specifiedType: const FullType(_i2.EnumType),
        ),
        list: (_i3.ListType list) => serializers.serialize(
          list,
          specifiedType: const FullType(_i3.ListType),
        ),
        model: (_i4.ModelType model) => serializers.serialize(
          model,
          specifiedType: const FullType(_i4.ModelType),
        ),
        nonModel: (_i5.NonModelType nonModel) => serializers.serialize(
          nonModel,
          specifiedType: const FullType(_i5.NonModelType),
        ),
        scalar: (_i6.ScalarType scalar) => serializers.serialize(
          scalar,
          specifiedType: const FullType(_i6.ScalarType),
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
