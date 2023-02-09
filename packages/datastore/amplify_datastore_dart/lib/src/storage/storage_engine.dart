import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;

/// {@template amplify_datastore_dart.storage.storage_engine}
/// The interface for storing and retrieving [Model] objects.
///
/// Platforms implement this class based on the storage requirements and
/// available technologies.
/// {@endtemplate}
abstract class StorageEngine implements Closeable {
  /// {@macro amplify_datastore_dart.storage.storage_engine}
  const StorageEngine();

  /// Initializes the storage engine.
  ///
  /// This is guaranteed to be called exactly once before any other methods
  /// are called.
  Future<void> init(mipr.SchemaDefinition schema);

  /// Erases all model data.
  Future<void> clear();

  /// Saves the model to the local store.
  ///
  /// If [where] is given, the model is only saved if the condition holds
  /// true for [model].
  Future<void>
      save<ModelIdentifier extends Object, M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
  });

  /// Returns all models of type [modelType].
  ///
  /// If [where] is given, only models matching the condition are returned.
  Future<List<M>> query<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, PartialModel<ModelIdentifier, M>> modelType, {
    QueryPredicate<ModelIdentifier, M>? where,
  });

  /// Deletes the model from the local store.
  ///
  /// If [where] is given, the model is only deleted if the condition holds
  /// true for [model].
  Future<void> delete<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
  });

  @override
  Future<void> close() async {}
}
