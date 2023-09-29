// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_primary_key.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelPrimaryKey extends ModelPrimaryKey {
  @override
  final String primaryField;
  @override
  final _i2.BuiltList<String>? sortKeyFields;

  factory _$ModelPrimaryKey([void Function(ModelPrimaryKeyBuilder)? updates]) =>
      (new ModelPrimaryKeyBuilder()..update(updates))._build();

  _$ModelPrimaryKey._({required this.primaryField, this.sortKeyFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        primaryField, r'ModelPrimaryKey', 'primaryField');
  }

  @override
  ModelPrimaryKey rebuild(void Function(ModelPrimaryKeyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelPrimaryKeyBuilder toBuilder() =>
      new ModelPrimaryKeyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelPrimaryKey &&
        primaryField == other.primaryField &&
        sortKeyFields == other.sortKeyFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, primaryField.hashCode);
    _$hash = $jc(_$hash, sortKeyFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelPrimaryKeyBuilder
    implements Builder<ModelPrimaryKey, ModelPrimaryKeyBuilder> {
  _$ModelPrimaryKey? _$v;

  String? _primaryField;
  String? get primaryField => _$this._primaryField;
  set primaryField(String? primaryField) => _$this._primaryField = primaryField;

  _i2.ListBuilder<String>? _sortKeyFields;
  _i2.ListBuilder<String> get sortKeyFields =>
      _$this._sortKeyFields ??= new _i2.ListBuilder<String>();
  set sortKeyFields(_i2.ListBuilder<String>? sortKeyFields) =>
      _$this._sortKeyFields = sortKeyFields;

  ModelPrimaryKeyBuilder() {
    ModelPrimaryKey._init(this);
  }

  ModelPrimaryKeyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _primaryField = $v.primaryField;
      _sortKeyFields = $v.sortKeyFields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelPrimaryKey other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelPrimaryKey;
  }

  @override
  void update(void Function(ModelPrimaryKeyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelPrimaryKey build() => _build();

  _$ModelPrimaryKey _build() {
    _$ModelPrimaryKey _$result;
    try {
      _$result = _$v ??
          new _$ModelPrimaryKey._(
              primaryField: BuiltValueNullFieldError.checkNotNull(
                  primaryField, r'ModelPrimaryKey', 'primaryField'),
              sortKeyFields: _sortKeyFields?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sortKeyFields';
        _sortKeyFields?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelPrimaryKey', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
