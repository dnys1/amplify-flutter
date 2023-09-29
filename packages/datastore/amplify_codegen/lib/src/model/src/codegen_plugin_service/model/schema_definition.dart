// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.schema_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_type_definition.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'schema_definition.g.dart';

abstract class SchemaDefinition
    with _i1.AWSEquatable<SchemaDefinition>
    implements Built<SchemaDefinition, SchemaDefinitionBuilder> {
  factory SchemaDefinition({
    Map<String, _i2.SchemaTypeDefinition>? typeDefinitions,
    Map<String, Set<String>>? modelGraph,
  }) {
    return _$SchemaDefinition._(
      typeDefinitions:
          typeDefinitions == null ? null : _i3.BuiltMap(typeDefinitions),
      modelGraph: modelGraph == null ? null : _i3.BuiltSetMultimap(modelGraph),
    );
  }

  factory SchemaDefinition.build(
      [void Function(SchemaDefinitionBuilder) updates]) = _$SchemaDefinition;

  const SchemaDefinition._();

  static const List<_i4.SmithySerializer<SchemaDefinition>> serializers = [
    SchemaDefinitionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(SchemaDefinitionBuilder b) {}
  _i3.BuiltMap<String, _i2.SchemaTypeDefinition>? get typeDefinitions;

  /// The adjacency list representation of the model graph, indexed by model name with the values representing the dependent model types. ## Example For the Blog, Post, Comment schema: \`\`\`graphql type Blog @model { posts: \[Post\] @hasMany } type Post @model { blog: Blog @belongsTo comments: \[Comment\] @hasMany } type Comment @model { post: Post @belongsTo } \`\`\` The model graph would look like: \`\`\`json { "Blog": \["Post", "Comment"\], "Post": \["Comment"\], "Comment": \[\] } \`\`\`
  _i3.BuiltSetMultimap<String, String>? get modelGraph;
  @override
  List<Object?> get props => [
        typeDefinitions,
        modelGraph,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('SchemaDefinition')
      ..add(
        'typeDefinitions',
        typeDefinitions,
      )
      ..add(
        'modelGraph',
        modelGraph,
      );
    return helper.toString();
  }
}

class SchemaDefinitionRestJson1Serializer
    extends _i4.StructuredSmithySerializer<SchemaDefinition> {
  const SchemaDefinitionRestJson1Serializer() : super('SchemaDefinition');

  @override
  Iterable<Type> get types => const [
        SchemaDefinition,
        _$SchemaDefinition,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SchemaDefinitionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'modelGraph':
          result.modelGraph.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltSetMultimap,
              [
                FullType(String),
                FullType(String),
              ],
            ),
          ) as _i3.BuiltSetMultimap<String, String>));
        case 'typeDefinitions':
          result.typeDefinitions.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltMap,
              [
                FullType(String),
                FullType(_i2.SchemaTypeDefinition),
              ],
            ),
          ) as _i3.BuiltMap<String, _i2.SchemaTypeDefinition>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SchemaDefinition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final SchemaDefinition(:modelGraph, :typeDefinitions) = object;
    if (modelGraph != null) {
      result$
        ..add('modelGraph')
        ..add(serializers.serialize(
          modelGraph,
          specifiedType: const FullType(
            _i3.BuiltSetMultimap,
            [
              FullType(String),
              FullType(String),
            ],
          ),
        ));
    }
    if (typeDefinitions != null) {
      result$
        ..add('typeDefinitions')
        ..add(serializers.serialize(
          typeDefinitions,
          specifiedType: const FullType(
            _i3.BuiltMap,
            [
              FullType(String),
              FullType(_i2.SchemaTypeDefinition),
            ],
          ),
        ));
    }
    return result$;
  }
}
