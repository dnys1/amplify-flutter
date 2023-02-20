// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

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
    Map<String, Set<String>>? modelGraph,
    Map<String, _i2.SchemaTypeDefinition>? typeDefinitions,
  }) {
    return _$SchemaDefinition._(
      modelGraph: modelGraph == null ? null : _i3.BuiltSetMultimap(modelGraph),
      typeDefinitions:
          typeDefinitions == null ? null : _i3.BuiltMap(typeDefinitions),
    );
  }

  factory SchemaDefinition.build(
      [void Function(SchemaDefinitionBuilder) updates]) = _$SchemaDefinition;

  const SchemaDefinition._();

  static const List<_i4.SmithySerializer> serializers = [
    SchemaDefinitionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(SchemaDefinitionBuilder b) {}

  /// The adjacency list representation of the model graph, indexed by model name with the values representing the dependent model types. ## Example For the Blog, Post, Comment schema: \`\`\`graphql type Blog @model { posts: \[Post\] @hasMany } type Post @model { blog: Blog @belongsTo comments: \[Comment\] @hasMany } type Comment @model { post: Post @belongsTo } \`\`\` The model graph would look like: ```json { "Blog": \["Post", "Comment"\], "Post": \["Comment"\], "Comment": \[\] }
  _i3.BuiltSetMultimap<String, String>? get modelGraph;
  _i3.BuiltMap<String, _i2.SchemaTypeDefinition>? get typeDefinitions;
  @override
  List<Object?> get props => [
        modelGraph,
        typeDefinitions,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('SchemaDefinition');
    helper.add(
      'modelGraph',
      modelGraph,
    );
    helper.add(
      'typeDefinitions',
      typeDefinitions,
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
      switch (key) {
        case 'modelGraph':
          if (value != null) {
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
          }
          break;
        case 'typeDefinitions':
          if (value != null) {
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
    final payload = (object as SchemaDefinition);
    final result = <Object?>[];
    if (payload.modelGraph != null) {
      result
        ..add('modelGraph')
        ..add(serializers.serialize(
          payload.modelGraph!,
          specifiedType: const FullType(
            _i3.BuiltSetMultimap,
            [
              FullType(String),
              FullType(String),
            ],
          ),
        ));
    }
    if (payload.typeDefinitions != null) {
      result
        ..add('typeDefinitions')
        ..add(serializers.serialize(
          payload.typeDefinitions!,
          specifiedType: const FullType(
            _i3.BuiltMap,
            [
              FullType(String),
              FullType(_i2.SchemaTypeDefinition),
            ],
          ),
        ));
    }
    return result;
  }
}
