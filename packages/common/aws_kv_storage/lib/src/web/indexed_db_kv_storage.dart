import 'dart:convert';

import 'package:aws_common/src/js/indexed_db.dart';
import 'package:aws_kv_storage/src/interface.dart';
import 'package:aws_kv_storage/src/vm/database.dart';
import 'package:built_value/serializer.dart';
import 'package:drift/src/runtime/query_builder/query_builder.dart';
import 'package:js/js.dart';

@JS()
@anonymous
@staticInterop
abstract class KVItem {
  external factory KVItem._({
    required String id,
    required String data,
    required String createdAt,
  });

  factory KVItem({
    required String id,
    required String data,
  }) {
    return KVItem._(
      id: id,
      data: data,
      createdAt: DateTime.timestamp().toIso8601String(),
    );
  }
}

extension KVItemHelper on KVItem {
  external String get id;
  external String get data;
  external String get createdAt;
}

final class IndexedDBKeyValueStorage<V extends Object>
    implements AWSKeyValueDatabase<V> {
  IndexedDBKeyValueStorage(
    this.databaseName, {
    required this.serializers,
  });

  final String databaseName;

  /// The name of the object store
  ///
  /// Reference: https://www.w3.org/TR/IndexedDB/#object-store-name
  static const storeName = 'default.store';

  final Serializers serializers;

  late final Future<void> _databaseOpenEvent = _openDatabase();

  late final IDBDatabase _database;

  /// Checks for IDB availability and attempts to open the database.
  Future<void> _openDatabase() async {
    final db = indexedDB;
    if (db == null) {
      throw Exception('IndexedDB is not available');
    }
    final openRequest = db.open(databaseName, 1)
      ..onupgradeneeded = (event) {
        final database = event.target.result;
        final objectStoreNames = database.objectStoreNames;
        if (!objectStoreNames.contains(storeName)) {
          database.createObjectStore(storeName);
        }
      };
    _database = await openRequest.future;
  }

  /// Returns a new [IDBObjectStore] instance after waiting for initialization
  /// to complete.
  IDBObjectStore _getObjectStore() {
    final transaction = _database.transaction(
      storeName,
      mode: IDBTransactionMode.readwrite,
    );
    final store = transaction.objectStore(storeName);
    return store;
  }

  @override
  Future<void> clear() async {
    await _databaseOpenEvent;
    await _getObjectStore().clear().future;
  }

  @override
  Future<void> delete(String key) async {
    await _databaseOpenEvent;
    await _getObjectStore().delete(key).future;
  }

  @override
  Future<List<V>> query({
    List<OrderingTerm Function($DataTable p1)>? orderBy,
    Expression<bool> Function($DataTable p1)? where,
  }) async {
    await _databaseOpenEvent;
    // await _getObjectStore().get
    throw UnimplementedError();
  }

  @override
  Future<V?> read(String key) async {
    await _databaseOpenEvent;
    final value = await _getObjectStore().getObject(key).future;
    if (value == null) {
      return null;
    }
    final serialized = V == String ? value : jsonDecode(value) as Object?;
    return serializers.deserialize(serialized, specifiedType: FullType(V)) as V;
  }

  @override
  Future<List<V>> remove({
    Expression<bool> Function($DataTable p1)? where,
  }) async {
    await _databaseOpenEvent;
    throw UnimplementedError();
  }

  @override
  Future<void> write(String key, V value) async {
    await _databaseOpenEvent;
    final serialized = V == String
        ? value as String
        : jsonEncode(
            serializers.serialize(value, specifiedType: FullType(V)),
          );
    await _getObjectStore().put(serialized, key).future;
  }
}
