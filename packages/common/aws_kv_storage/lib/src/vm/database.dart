import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/json1.dart';

part 'database.g.dart';

final class OrderBy {
  const OrderBy._(this._orderingTerm);

  static final OrderBy createdAtAsc = OrderBy._(
    (d) => OrderingTerm.asc(d.createdAt),
  );
  static final OrderBy createdAtDesc = OrderBy._(
    (d) => OrderingTerm.desc(d.createdAt),
  );

  final OrderingTerm Function($DataTable) _orderingTerm;
}

class Data extends Table {
  TextColumn get id => text()();
  TextColumn get value => text()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(DateTime.timestamp)();
}

@DriftDatabase(tables: [Data])
class KVDatabase<V> extends _$KVDatabase {
  KVDatabase(
    super.e, {
    Serializers? serializers,
  }) : serializers = serializers ?? Serializers() {
    if (this.serializers.serializerForType(V) == null) {
      throw ArgumentError.value(
        serializers,
        'serializers',
        'No serializer found for $V',
      );
    }
  }

  final Serializers serializers;

  @override
  int get schemaVersion => 1;

  Future<List<V>> query({
    List<OrderingTerm Function($DataTable)>? orderBy,
    Expression<bool> Function($DataTable)? where,
  }) async {
    final stmt = select(data);
    if (orderBy != null) {
      stmt.orderBy(orderBy);
    }
    if (where != null) {
      stmt.where(where);
    }
    final results = await stmt.get();
    return results.map((data) {
      final serialized = jsonDecode(data.value) as Object?;
      final deserialized = serializers.deserialize(
        serialized,
        specifiedType: FullType(V),
      );
      return deserialized as V;
    }).toList();
  }

  Future<List<V>> remove({
    Expression<bool> Function($DataTable)? where,
  }) async {
    final stmt = delete(data);
    if (where != null) {
      stmt.where(where);
    }
    final results = await stmt.goAndReturn();
    return results.map((data) {
      final serialized = jsonDecode(data.value) as Object?;
      final deserialized = serializers.deserialize(
        serialized,
        specifiedType: FullType(V),
      );
      return deserialized as V;
    }).toList();
  }
}
