// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.model_secondary_key;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelSecondaryKey extends ModelSecondaryKey {
  @override
  final String name;
  @override
  final String primaryField;
  @override
  final String queryField;
  @override
  final _i2.BuiltList<String>? sortKeyFields;

  factory _$ModelSecondaryKey(
          [void Function(ModelSecondaryKeyBuilder)? updates]) =>
      (new ModelSecondaryKeyBuilder()..update(updates))._build();

  _$ModelSecondaryKey._(
      {required this.name,
      required this.primaryField,
      required this.queryField,
      this.sortKeyFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ModelSecondaryKey', 'name');
    BuiltValueNullFieldError.checkNotNull(
        primaryField, r'ModelSecondaryKey', 'primaryField');
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
        name == other.name &&
        primaryField == other.primaryField &&
        queryField == other.queryField &&
        sortKeyFields == other.sortKeyFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryField.hashCode);
    _$hash = $jc(_$hash, queryField.hashCode);
    _$hash = $jc(_$hash, sortKeyFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelSecondaryKeyBuilder
    implements Builder<ModelSecondaryKey, ModelSecondaryKeyBuilder> {
  _$ModelSecondaryKey? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryField;
  String? get primaryField => _$this._primaryField;
  set primaryField(String? primaryField) => _$this._primaryField = primaryField;

  String? _queryField;
  String? get queryField => _$this._queryField;
  set queryField(String? queryField) => _$this._queryField = queryField;

  _i2.ListBuilder<String>? _sortKeyFields;
  _i2.ListBuilder<String> get sortKeyFields =>
      _$this._sortKeyFields ??= new _i2.ListBuilder<String>();
  set sortKeyFields(_i2.ListBuilder<String>? sortKeyFields) =>
      _$this._sortKeyFields = sortKeyFields;

  ModelSecondaryKeyBuilder() {
    ModelSecondaryKey._init(this);
  }

  ModelSecondaryKeyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _primaryField = $v.primaryField;
      _queryField = $v.queryField;
      _sortKeyFields = $v.sortKeyFields?.toBuilder();
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
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelSecondaryKey', 'name'),
              primaryField: BuiltValueNullFieldError.checkNotNull(
                  primaryField, r'ModelSecondaryKey', 'primaryField'),
              queryField: BuiltValueNullFieldError.checkNotNull(
                  queryField, r'ModelSecondaryKey', 'queryField'),
              sortKeyFields: _sortKeyFields?.build());
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
