// ignore: implementation_imports
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;
import 'package:drift/drift.dart';
import 'package:sqlparser/sqlparser.dart';

/// Factory for [mipr.ModelTypeDefinition] SQL statements.
class ModelStatementBuilder {
  const ModelStatementBuilder(this._context, this.modelType);

  final GenerationContext _context;

  /// The model type being generated.
  final mipr.ModelTypeDefinition modelType;

  /// Returns the statements necessary to create a table for [modelType] and
  /// all associated indexes.
  List<Statement> create() {
    final statements = <Statement>[];
    final createStatement = CreateTableStatement(
      tableName: modelType.name,
      // Turn off dynamic typing.
      isStrict: true,
      // Table creation should not happen if the table already exists. Instead,
      // we should either not run the create statement or perform a migration
      // if needed.
      ifNotExists: false,
      // To take advantage of some performance enhancements and stricter type
      // checking on primary key columns.
      // https://www.sqlite.org/withoutrowid.html#differences_from_ordinary_rowid_tables
      withoutRowId: true,
      columns: [],
      tableConstraints: [],
    );

    // Remote metadata fields which will initially be `null` when creating a
    // model but will be filled in once sync is complete and upon each update
    // thereafter.
    final remoteMetadataFields = [
      mipr.ModelField(
        name: '_version',
        type: const mipr.SchemaType.scalar(
          mipr.AppSyncScalar.int_,
          isRequired: false,
        ),
      ),
      mipr.ModelField(
        name: '_deleted',
        type: const mipr.SchemaType.scalar(
          mipr.AppSyncScalar.boolean,
          isRequired: false,
        ),
      ),
      mipr.ModelField(
        name: '_lastChangedAt',
        type: const mipr.SchemaType.scalar(
          mipr.AppSyncScalar.awsDateTime,
          isRequired: false,
        ),
      ),
    ];
    final fields = [
      ...modelType.fields.values,
      ...remoteMetadataFields,
    ];
    final foreignKeys = modelType.indexes.where(
      (index) => index.type == mipr.ModelIndexType.foreign,
    );

    for (final field in fields) {
      if (field.association != null) {
        // Fields with relationships are not directly stored but instead
        // computed by their foreign keys.
        continue;
      }

      final column = ColumnDefinition(
        columnName: field.name,
        typeName: field.sqlType.sqlTypeName(_context),
        constraints: [],
      );

      if (field.type.isRequired) {
        column.constraints.add(NotNull(null));
      }

      createStatement.columns.add(column);
    }

    // Add primary key constraint.
    final modelIdentifier = modelType.modelIdentifier;
    createStatement.tableConstraints.add(
      KeyClause(
        null,
        isPrimaryKey: true,
        columns: modelIdentifier.fields
            .map(
              (fieldName) => IndexedColumn(
                Reference(columnName: fieldName),
              ),
            )
            .toList(),
      ),
    );

    // Add all foreign key constraints.
    for (final foreignKey in foreignKeys) {
      final relationship =
          modelType.fields[foreignKey.primaryField]!.association!;
      if (relationship.associationType == mipr.ModelAssociationType.belongsTo ||
          relationship.associationType == mipr.ModelAssociationType.hasOne) {
        assert(
          relationship.targetNames!.isNotEmpty,
          'targetNames should always contain at least one field',
        );
        createStatement.tableConstraints.add(
          KeyClause(
            null,
            isPrimaryKey: false,
            columns: relationship.targetNames!
                .map((field) => IndexedColumn(Reference(columnName: field)))
                .toList(),
          ),
        );
      }
      createStatement.tableConstraints.add(
        ForeignKeyTableConstraint(
          foreignKey.name,
          columns: foreignKey.fields
              .map((field) => Reference(columnName: field))
              .toList(),
          clause: ForeignKeyClause(
            foreignTable: TableReference(relationship.associatedType),
            columnNames: relationship.associatedFields!
                .map((field) => Reference(columnName: field))
                .toList(),

            // Take no actions on update/delete of parent rows.
            // https://www.sqlite.org/foreignkeys.html#fk_actions
            //
            // Since there is no cascade support in AppSync, we must replicate
            // the functionality. Since we cannot assume AppSync will cascade
            // updates or that we're online, we wait to manually perform the
            // update/delete when notified by AppSync that the same has been
            // done remotely.
            onUpdate: ReferenceAction.noAction,
            onDelete: ReferenceAction.noAction,
          ),
        ),
      );
    }
    statements.add(createStatement);

    // Add indexes for every `@index`.
    final secondaryIndexes = modelType.indexes.where(
      (index) => index.type == mipr.ModelIndexType.secondary,
    );
    for (final index in secondaryIndexes) {
      statements.add(
        CreateIndexStatement(
          indexName: index.name!,
          on: TableReference(createStatement.tableName),
          columns: index.fields
              .map(
                (fieldName) => IndexedColumn(
                  Reference(columnName: fieldName),
                ),
              )
              .toList(),
        ),
      );
    }

    return statements;
  }
}

extension ModelFieldSqlType on mipr.ModelField {
  /// The [DriftSqlType] of `this`.
  DriftSqlType get sqlType {
    final type = this.type;
    if (type is mipr.ScalarType) {
      switch (type.value) {
        case mipr.AppSyncScalar.awsDate:
        case mipr.AppSyncScalar.awsDateTime:
        case mipr.AppSyncScalar.awsTime:
        case mipr.AppSyncScalar.awsTimestamp:
          return DriftSqlType.dateTime;
        case mipr.AppSyncScalar.awsEmail:
        case mipr.AppSyncScalar.awsIpAddress:
        case mipr.AppSyncScalar.awsJson:
        case mipr.AppSyncScalar.awsPhone:
        case mipr.AppSyncScalar.awsUrl:
        case mipr.AppSyncScalar.id:
        case mipr.AppSyncScalar.string:
          return DriftSqlType.string;
        case mipr.AppSyncScalar.boolean:
          return DriftSqlType.bool;
        case mipr.AppSyncScalar.float:
          return DriftSqlType.double;
        case mipr.AppSyncScalar.int_:
          return DriftSqlType.int;
      }
    } else if (type is mipr.EnumType) {
      return DriftSqlType.string;
    } else if (type is mipr.ListType) {
      if (association == null) {
        // Embedded collections are stored as a JSON string.
        return DriftSqlType.string;
      }
    } else if (type is mipr.NonModelType) {
      // Embedded non-models are stored as a JSON string.
      return DriftSqlType.string;
    }
    // Model types should not be stored directly, only indirectly via foreign
    // keys.
    throw StateError('Invalid column type.');
  }
}
