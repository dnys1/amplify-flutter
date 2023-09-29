// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.common.serializers; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/app_sync_scalar.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_model_operation.dart'
    as _i15;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_provider.dart'
    as _i14;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i16;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_strategy.dart'
    as _i13;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_error.dart'
    as _i28;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/codegen_request.dart'
    as _i27;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/enum_type.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/enum_type_definition.dart'
    as _i24;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/field_auth.dart'
    as _i34;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/field_dimension.dart'
    as _i35;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/generated_schema.dart'
    as _i40;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/globals.dart'
    as _i29;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/list_type.dart'
    as _i7;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association.dart'
    as _i12;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_belongs_to.dart'
    as _i9;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_has_many.dart'
    as _i10;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_has_one.dart'
    as _i11;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_auth.dart'
    as _i31;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i17;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_foreign_key.dart'
    as _i20;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_index.dart'
    as _i21;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_primary_key.dart'
    as _i18;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_secondary_key.dart'
    as _i19;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type_definition.dart'
    as _i22;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type_dimension.dart'
    as _i32;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/name_casing.dart'
    as _i30;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/non_model_type.dart'
    as _i6;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/non_model_type_definition.dart'
    as _i23;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/scalar_type.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_definition.dart'
    as _i26;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_description.dart'
    as _i38;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_dimension.dart'
    as _i37;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_type.dart'
    as _i8;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_type_definition.dart'
    as _i25;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schema_matrix.dart'
    as _i39;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/test_schemas.dart'
    as _i41;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/type_description.dart'
    as _i36;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/type_dimension.dart'
    as _i33;
import 'package:built_collection/built_collection.dart' as _i42;
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

const List<_i1.SmithySerializer> serializers = [
  ..._i2.AppSyncScalar.serializers,
  ..._i3.ScalarType.serializers,
  ..._i4.EnumType.serializers,
  ..._i5.ModelType.serializers,
  ..._i6.NonModelType.serializers,
  ..._i7.ListType.serializers,
  ..._i8.SchemaType.serializers,
  ..._i9.ModelAssociationBelongsTo.serializers,
  ..._i10.ModelAssociationHasMany.serializers,
  ..._i11.ModelAssociationHasOne.serializers,
  ..._i12.ModelAssociation.serializers,
  ..._i13.AuthStrategy.serializers,
  ..._i14.AuthProvider.serializers,
  ..._i15.AuthModelOperation.serializers,
  ..._i16.AuthRule.serializers,
  ..._i17.ModelField.serializers,
  ..._i18.ModelPrimaryKey.serializers,
  ..._i19.ModelSecondaryKey.serializers,
  ..._i20.ModelForeignKey.serializers,
  ..._i21.ModelIndex.serializers,
  ..._i22.ModelTypeDefinition.serializers,
  ..._i23.NonModelTypeDefinition.serializers,
  ..._i24.EnumTypeDefinition.serializers,
  ..._i25.SchemaTypeDefinition.serializers,
  ..._i26.SchemaDefinition.serializers,
  ..._i27.CodegenRequest.serializers,
  ..._i28.CodegenError.serializers,
  ..._i29.Globals.serializers,
  ..._i30.NameCasing.serializers,
  ..._i31.ModelAuth.serializers,
  ..._i32.ModelTypeDimension.serializers,
  ..._i33.TypeDimension.serializers,
  ..._i34.FieldAuth.serializers,
  ..._i35.FieldDimension.serializers,
  ..._i36.TypeDescription.serializers,
  ..._i37.SchemaDimension.serializers,
  ..._i38.SchemaDescription.serializers,
  ..._i39.TestSchemaMatrix.serializers,
  ..._i40.GeneratedSchema.serializers,
  ..._i41.TestSchemas.serializers,
];
final Map<FullType, Function> builderFactories = {
  const FullType(
    _i42.BuiltList,
    [FullType(String)],
  ): _i42.ListBuilder<String>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i17.ModelField)],
  ): _i42.ListBuilder<_i17.ModelField>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i15.AuthModelOperation)],
  ): _i42.ListBuilder<_i15.AuthModelOperation>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i16.AuthRule)],
  ): _i42.ListBuilder<_i16.AuthRule>.new,
  const FullType(
    _i42.BuiltMap,
    [
      FullType(String),
      FullType(_i17.ModelField),
    ],
  ): _i42.MapBuilder<String, _i17.ModelField>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i21.ModelIndex)],
  ): _i42.ListBuilder<_i21.ModelIndex>.new,
  const FullType(
    _i42.BuiltMap,
    [
      FullType(String),
      FullType(_i25.SchemaTypeDefinition),
    ],
  ): _i42.MapBuilder<String, _i25.SchemaTypeDefinition>.new,
  const FullType(
    _i42.BuiltSetMultimap,
    [
      FullType(String),
      FullType(String),
    ],
  ): _i42.SetMultimapBuilder<String, String>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i35.FieldDimension)],
  ): _i42.ListBuilder<_i35.FieldDimension>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i36.TypeDescription)],
  ): _i42.ListBuilder<_i36.TypeDescription>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i37.SchemaDimension)],
  ): _i42.ListBuilder<_i37.SchemaDimension>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i38.SchemaDescription)],
  ): _i42.ListBuilder<_i38.SchemaDescription>.new,
  const FullType(
    _i42.BuiltList,
    [FullType(_i40.GeneratedSchema)],
  ): _i42.ListBuilder<_i40.GeneratedSchema>.new,
};
