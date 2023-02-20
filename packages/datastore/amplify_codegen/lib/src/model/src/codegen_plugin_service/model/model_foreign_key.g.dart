// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.model_foreign_key;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelForeignKey extends ModelForeignKey {
  @override
  final String name;
  @override
  final String primaryField;
  @override
  final _i2.BuiltList<String> sortKeyFields;

  factory _$ModelForeignKey([void Function(ModelForeignKeyBuilder)? updates]) =>
      (new ModelForeignKeyBuilder()..update(updates))._build();

  _$ModelForeignKey._(
      {required this.name,
      required this.primaryField,
      required this.sortKeyFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ModelForeignKey', 'name');
    BuiltValueNullFieldError.checkNotNull(
        primaryField, r'ModelForeignKey', 'primaryField');
    BuiltValueNullFieldError.checkNotNull(
        sortKeyFields, r'ModelForeignKey', 'sortKeyFields');
  }

  @override
  ModelForeignKey rebuild(void Function(ModelForeignKeyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelForeignKeyBuilder toBuilder() =>
      new ModelForeignKeyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelForeignKey &&
        name == other.name &&
        primaryField == other.primaryField &&
        sortKeyFields == other.sortKeyFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, primaryField.hashCode);
    _$hash = $jc(_$hash, sortKeyFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelForeignKeyBuilder
    implements Builder<ModelForeignKey, ModelForeignKeyBuilder> {
  _$ModelForeignKey? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryField;
  String? get primaryField => _$this._primaryField;
  set primaryField(String? primaryField) => _$this._primaryField = primaryField;

  _i2.ListBuilder<String>? _sortKeyFields;
  _i2.ListBuilder<String> get sortKeyFields =>
      _$this._sortKeyFields ??= new _i2.ListBuilder<String>();
  set sortKeyFields(_i2.ListBuilder<String>? sortKeyFields) =>
      _$this._sortKeyFields = sortKeyFields;

  ModelForeignKeyBuilder() {
    ModelForeignKey._init(this);
  }

  ModelForeignKeyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _primaryField = $v.primaryField;
      _sortKeyFields = $v.sortKeyFields.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelForeignKey other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelForeignKey;
  }

  @override
  void update(void Function(ModelForeignKeyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelForeignKey build() => _build();

  _$ModelForeignKey _build() {
    _$ModelForeignKey _$result;
    try {
      _$result = _$v ??
          new _$ModelForeignKey._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelForeignKey', 'name'),
              primaryField: BuiltValueNullFieldError.checkNotNull(
                  primaryField, r'ModelForeignKey', 'primaryField'),
              sortKeyFields: sortKeyFields.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sortKeyFields';
        sortKeyFields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelForeignKey', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
