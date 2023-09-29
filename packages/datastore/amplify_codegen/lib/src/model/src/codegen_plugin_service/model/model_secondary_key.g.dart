// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_secondary_key.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelSecondaryKey extends ModelSecondaryKey {
  @override
  final String primaryField;
  @override
  final _i2.BuiltList<String>? sortKeyFields;
  @override
  final String name;
  @override
  final String queryField;

  factory _$ModelSecondaryKey(
          [void Function(ModelSecondaryKeyBuilder)? updates]) =>
      (new ModelSecondaryKeyBuilder()..update(updates))._build();

  _$ModelSecondaryKey._(
      {required this.primaryField,
      this.sortKeyFields,
      required this.name,
      required this.queryField})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        primaryField, r'ModelSecondaryKey', 'primaryField');
    BuiltValueNullFieldError.checkNotNull(name, r'ModelSecondaryKey', 'name');
    BuiltValueNullFieldError.checkNotNull(
        queryField, r'ModelSecondaryKey', 'queryField');
  }

  @override
  ModelSecondaryKey rebuild(void Function(ModelSecondaryKeyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelSecondaryKeyBuilder toBuilder() =>
      new ModelSecondaryKeyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelSecondaryKey &&
        primaryField == other.primaryField &&
        sortKeyFields == other.sortKeyFields &&
        name == other.name &&
        queryField == other.queryField;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, primaryField.hashCode);
    _$hash = $jc(_$hash, sortKeyFields.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, queryField.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelSecondaryKeyBuilder
    implements Builder<ModelSecondaryKey, ModelSecondaryKeyBuilder> {
  _$ModelSecondaryKey? _$v;

  String? _primaryField;
  String? get primaryField => _$this._primaryField;
  set primaryField(String? primaryField) => _$this._primaryField = primaryField;

  _i2.ListBuilder<String>? _sortKeyFields;
  _i2.ListBuilder<String> get sortKeyFields =>
      _$this._sortKeyFields ??= new _i2.ListBuilder<String>();
  set sortKeyFields(_i2.ListBuilder<String>? sortKeyFields) =>
      _$this._sortKeyFields = sortKeyFields;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _queryField;
  String? get queryField => _$this._queryField;
  set queryField(String? queryField) => _$this._queryField = queryField;

  ModelSecondaryKeyBuilder() {
    ModelSecondaryKey._init(this);
  }

  ModelSecondaryKeyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _primaryField = $v.primaryField;
      _sortKeyFields = $v.sortKeyFields?.toBuilder();
      _name = $v.name;
      _queryField = $v.queryField;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelSecondaryKey other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelSecondaryKey;
  }

  @override
  void update(void Function(ModelSecondaryKeyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelSecondaryKey build() => _build();

  _$ModelSecondaryKey _build() {
    _$ModelSecondaryKey _$result;
    try {
      _$result = _$v ??
          new _$ModelSecondaryKey._(
              primaryField: BuiltValueNullFieldError.checkNotNull(
                  primaryField, r'ModelSecondaryKey', 'primaryField'),
              sortKeyFields: _sortKeyFields?.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelSecondaryKey', 'name'),
              queryField: BuiltValueNullFieldError.checkNotNull(
                  queryField, r'ModelSecondaryKey', 'queryField'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sortKeyFields';
        _sortKeyFields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelSecondaryKey', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
