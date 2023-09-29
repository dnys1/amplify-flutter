import 'package:aws_kv_storage/src/vm/database.dart';
import 'package:built_value/serializer.dart';
import 'package:drift/drift.dart';

abstract interface class AWSKeyValueStorage<V extends Object> {
  /// Creates a persistent key-value storage.
  ///
  /// On Web, this uses IndexedDB. On VM, this uses Drift (SQLite).
  factory AWSKeyValueStorage({Serializers? serializers}) =
      _PersistentKeyValueStorage<V>;

  /// Creates an ephemeral key-value storage.
  ///
  /// On Web, this uses session storage.
  /// On iOS/macOS, this uses UserDefaults.
  /// On Android, this uses SharedPreferences.
  /// On Windows/Linux, this uses file storage in the app cache path.
  factory AWSKeyValueStorage.ephemeral({Serializers? serializers}) =
      _EphemeralKeyValueStorage<V>;

  Future<void> write(String key, V value);
  Future<V?> read(String key);
  Future<void> delete(String key);
  Future<void> clear();
}

abstract interface class AWSKeyValueDatabase<V extends Object>
    implements AWSKeyValueStorage<V> {
  /// Creates a persistent, queryable key-value database.
  ///
  /// On Web, this uses IndexedDB. On VM, this uses Drift (SQLite).
  factory AWSKeyValueDatabase({Serializers? serializers}) =
      _PersistentKeyValueStorage<V>;

  Future<List<V>> query({
    List<OrderingTerm Function($DataTable)>? orderBy,
    Expression<bool> Function($DataTable)? where,
  });

  Future<void> remove({
    Expression<bool> Function($DataTable)? where,
  });
}
