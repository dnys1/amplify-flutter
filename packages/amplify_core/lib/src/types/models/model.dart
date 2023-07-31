// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';
import 'package:meta/meta.dart';

/// {@template amplify_core.models.model_field_error}
/// Thrown when a [Model] cannot be built due to a missing required field.
/// {@endtemplate}
class ModelFieldError extends Error {
  /// {@template amplify_core.models.model_field_error}
  ModelFieldError(this.modelName, this.field, [this.primaryKey]);

  /// The model name, which matches [Model]
  final String modelName;
  final String field;
  final Object? primaryKey;

  @override
  String toString() =>
      'ModelFieldError: Could not build $modelName due to missing '
      '"$field" field${primaryKey == null ? '' : ' (id: $primaryKey)'}.';
}

/// {@template amplify_core.models.model_type}
/// Identifies a type as defined in the GraphQL schema and provides utilities
/// for deserialization from a GraphQL response.
/// {@endtemplate}
@immutable
abstract class ModelType<
    ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>,
    P extends PartialModel<ModelIdentifier, M>> {
  /// {@macro amplify_core.models.model_type}
  const ModelType();

  /// The name of the model as defined in the schema.
  ///
  /// Note: This may differ from the generated Dart class name due to recasing
  /// in codegen. For example, a `USER` type defined in the schema may be
  /// recased to `User` to align with Dart class naming conventions. In that
  /// case, this would return `USER`.
  String get modelName;

  /// Factory method for creating an instance of the model from a [json] object.
  ///
  /// An optional type parameter can be specified, or inferred, to deserialize
  /// as a particular type in the model hierarchy.
  // TODO(dnys1): Add example
  T fromJson<T extends PartialModel<ModelIdentifier, M>>(
    Map<String, Object?> json,
  );
}

/// {@template amplify_core.models.partial_model}
/// A model represented by its [modelIdentifier] and a subset of the schema
/// type's fields.
///
/// Partial models form the base of the Amplify model hierarchy. Generated
/// partial types have all but their [modelIdentifier] set to nullable,
/// allowing them to represent any selection set returned from a GraphQL
/// request.
///
/// For example, a model defined by the schema:
///
/// ```graphql
/// type Todo @model {
///   id: ID!
///   name: String!
///   description: String
/// }
/// ```
///
/// would have a partial type generated in which all but the `id` field were
/// of type `String?`.
///
/// Since partial models are guaranteed to have their primary key, they can be
/// used can be used to retrieve the full model, either via the API category or
/// DataStore.
/// {@endtemplate}
@immutable
abstract class PartialModel<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    with
        RemoteModelMetadata,
        AWSSerializable<Map<String, Object?>>,
        AWSDebuggable {
  /// {@macro amplify_core.models.partial_model}
  const PartialModel();

  /// {@template amplify_core.models.model.model_identifier}
  /// The primary key for the model.
  ///
  /// Typically, this is an alias for the `id` field. However, when models
  /// set a custom using `@primaryKey` directive, this may alias a different
  /// field or construct a composite key from multiple fields.
  /// {@endtemplate}
  ModelIdentifier get modelIdentifier;

  /// {@template amplify_core.models.model.model_type}
  /// The model's type, typically used for deserialization.
  /// {@endtemplate}
  ModelType<ModelIdentifier, M, PartialModel<ModelIdentifier, M>> get modelType;
}

/// {@template amplify_core.models.model}
/// A model with fields which match their definition in the schema.
///
/// Whereas [PartialModel] declares all fields except the primary key as
/// nullable, [Model] fields match the types defined in the schema.
/// {@endtemplate}
@immutable
abstract class Model<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    extends PartialModel<ModelIdentifier, M> {
  /// {@macro amplify_core.models.model}
  const Model();

  /// Returns the value of [field].
  T valueFor<T extends Object?>(QueryField<ModelIdentifier, M, T> field);

  R withModelIdentifier<R>(R Function<T>() fn) => fn<ModelIdentifier>();
}

/// Methods used in codegen V1, added to support interoperability.
mixin LegacyModelFields<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> on PartialModel<ModelIdentifier, M> {
  /// {@macro amplify_core.models.model.model_type}
  @Deprecated('Use modelType instead')
  ModelType<ModelIdentifier, M, PartialModel<ModelIdentifier, M>>
      getInstanceType() => modelType;

  /// {@macro amplify_core.models.model.model_identifier}
  @Deprecated('Use modelIdentifier instead')
  String getId() {
    final id = modelIdentifier;
    if (id is! String) {
      throw StateError('Use modelIdentifier for custom primary keys');
    }
    return id;
  }

  /// Alias for [Object.==].
  @Deprecated('Use == instead')
  bool equals(Object other) => this == other;
}

/// {@template amplify_core.models.remote_model}
/// An extension to [Model] which adds [RemoteModelMetadata].
///
/// A model of this type is guaranteed to have been synced at least once
/// with the remote server.
/// {@endtemplate}
@immutable
abstract class RemoteModel<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> extends Model<ModelIdentifier, M> {
  /// {@macro amplify_core.models.remote_model}
  const RemoteModel();

  @override
  int get version;

  @override
  bool get deleted;

  @override
  TemporalDateTime get lastChangedAt;
}

/// Metadata fields for models which have been synced with the remote server.
mixin RemoteModelMetadata {
  /// The version of the model.
  int? get version => null;

  /// Whether the model has been marked for deletion.
  bool? get deleted => null;

  /// The time when the model was last changed.
  TemporalDateTime? get lastChangedAt => null;
}
