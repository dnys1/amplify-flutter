import 'package:amplify_core/amplify_core.dart';
// ignore: implementation_imports
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;
import 'package:amplify_datastore_dart/amplify_datastore_dart.dart';
import 'package:amplify_datastore_dart/src/storage/drift/statement_builder.dart';
import 'package:drift/drift.dart';
import 'package:sqlparser/sqlparser.dart';

class DriftStorageEngine extends StorageEngine {
  late final mipr.SchemaDefinition _schema;

  /// The directed graph of models to those
  late final modelGraph = _schema.modelGraph.asMap().map((modelName, models) {
    final model = modelNamed(modelName);
    final relatedModels = models.map(modelNamed).toList();
    return MapEntry(model, relatedModels);
  });

  /// Retrieves the definition for the model named [schemaName].
  ModelTypeDefinition modelNamed(String schemaName) =>
      _schema.typeDefinitions[schemaName] as ModelTypeDefinition;

  Future<void>? _initFuture;

  final GenerationContext context = GenerationContext(
    const DriftDatabaseOptions(),
    null,
  );

  @override
  Future<void> init(mipr.SchemaDefinition schema) {
    return _initFuture ??= init(schema);
  }

  Future<void> _init(mipr.SchemaDefinition schema) async {
    final statements = <Statement>[];

    // Create system tables

    // Create ModelSyncMetadata table
    // ignore: cascade_invocations
    statements.add(
      CreateTableStatement(
        tableName: 'ModelSyncMetadata',
        isStrict: true,
        withoutRowId: true,
        ifNotExists: false,
        columns: [
          ColumnDefinition(
            columnName: 'id',
            typeName: DriftSqlType.string.sqlTypeName(context),
            constraints: [
              NotNull(null),
              UniqueColumn(null, null),
            ],
          ),
          ColumnDefinition(
            columnName: 'lastSync',
            typeName: DriftSqlType.dateTime.sqlTypeName(context),
          ),
        ],
      ),
    );

    // Create a table for each model type.
    for (final modelDefinition in schema.typeDefinitions.values
        .whereType<mipr.ModelTypeDefinition>()) {
      final builder = ModelStatementBuilder(context, modelDefinition);
      statements.addAll(builder.create());
    }
  }

  @override
  Future<void> delete<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<M>> query<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, PartialModel<ModelIdentifier, M>> modelType, {
    QueryPredicate<ModelIdentifier, M>? where,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void>
      save<ModelIdentifier extends Object, M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }
}
