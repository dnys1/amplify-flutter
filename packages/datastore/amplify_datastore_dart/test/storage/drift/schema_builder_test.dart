import 'package:amplify_datastore_dart/src/storage/drift/statement_builder.dart';
import 'package:drift/drift.dart';
import 'package:sqlparser/sqlparser.dart';
import 'package:sqlparser/utils/node_to_text.dart';
import 'package:test/test.dart';

import '../../cpk_model.dart';

final context = GenerationContext(const DriftDatabaseOptions(), null);
final engine = SqlEngine(
  EngineOptions(
    driftOptions: const DriftSqlOptions(),
  ),
);

Matcher matchesSql(String sql) => _MatchesSql(sql);

class _MatchesSql extends Matcher {
  const _MatchesSql(this.sql);

  final String sql;

  @override
  Description describe(Description description) {
    return description..add('Matches a known SQL statement');
  }

  @override
  Description describeMismatch(
    Object? item,
    Description mismatchDescription,
    Map<Object?, Object?> matchState,
    bool verbose,
  ) {
    if (item is! Statement) {
      return mismatchDescription..add('Expected Statement, got $item');
    }
    final expectedSql = matchState['expected'];
    final gotSql = matchState['got'];
    return mismatchDescription..add('Expected: $expectedSql\nGot: $gotSql');
  }

  @override
  bool matches(Object? item, Map<Object?, Object?> matchState) {
    if (item is! Statement) {
      return false;
    }
    final parsed = engine.parse(sql);
    if (parsed.errors.isNotEmpty) {
      throw Exception(parsed.errors);
    }
    matchState['expected'] = parsed.rootNode.toSql();
    matchState['got'] = item.toSql();
    return matchState['expected'] == matchState['got'];
  }
}

void main() {
  group('SchemaBuilder', () {
    group('CPKModel', () {
      test('create', () {
        final schemaBuilder = ModelStatementBuilder(context, CpkModel.schema);
        final statements = schemaBuilder.create();
        expect(
          statements.single,
          matchesSql(
            '''
CREATE TABLE CPKModel(
  firstName TEXT NOT NULL,
  lastName TEXT NOT NULL,
  createdAt INTEGER NOT NULL,
  updatedAt INTEGER NOT NULL,
  _version INTEGER,
  _deleted INTEGER,
  _lastChangedAt INTEGER,
  PRIMARY KEY(firstName, lastName)
) WITHOUT ROWID, STRICT
''',
          ),
        );
      });
    });
  });
}
