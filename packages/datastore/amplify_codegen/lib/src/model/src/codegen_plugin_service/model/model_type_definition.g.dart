// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_type_definition.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelTypeDefinition extends ModelTypeDefinition {
  @override
  final String name;
  @override
  final String pluralName;
  @override
  final _i5.BuiltMap<String, _i2.ModelField> fields;
  @override
  final _i5.BuiltList<_i3.ModelIndex> indexes;
  @override
  final _i5.BuiltList<_i4.AuthRule>? authRules;

  factory _$ModelTypeDefinition(
          [void Function(ModelTypeDefinitionBuilder)? updates]) =>
      (new ModelTypeDefinitionBuilder()..update(updates))._build();

  _$ModelTypeDefinition._(
      {required this.name,
      required this.pluralName,
      required this.fields,
      required this.indexes,
      this.authRules})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ModelTypeDefinition', 'name');
    BuiltValueNullFieldError.checkNotNull(
        pluralName, r'ModelTypeDefinition', 'pluralName');
    BuiltValueNullFieldError.checkNotNull(
        fields, r'ModelTypeDefinition', 'fields');
    BuiltValueNullFieldError.checkNotNull(
        indexes, r'ModelTypeDefinition', 'indexes');
  }

  @override
  ModelTypeDefinition rebuild(
          void Function(ModelTypeDefinitionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelTypeDefinitionBuilder toBuilder() =>
      new ModelTypeDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelTypeDefinition &&
        name == other.name &&
        pluralName == other.pluralName &&
        fields == other.fields &&
        indexes == other.indexes &&
        authRules == other.authRules;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, pluralName.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, indexes.hashCode);
    _$hash = $jc(_$hash, authRules.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelTypeDefinitionBuilder
    implements Builder<ModelTypeDefinition, ModelTypeDefinitionBuilder> {
  _$ModelTypeDefinition? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _pluralName;
  String? get pluralName => _$this._pluralName;
  set pluralName(String? pluralName) => _$this._pluralName = pluralName;

  _i5.MapBuilder<String, _i2.ModelField>? _fields;
  _i5.MapBuilder<String, _i2.ModelField> get fields =>
      _$this._fields ??= new _i5.MapBuilder<String, _i2.ModelField>();
  set fields(_i5.MapBuilder<String, _i2.ModelField>? fields) =>
      _$this._fields = fields;

  _i5.ListBuilder<_i3.ModelIndex>? _indexes;
  _i5.ListBuilder<_i3.ModelIndex> get indexes =>
      _$this._indexes ??= new _i5.ListBuilder<_i3.ModelIndex>();
  set indexes(_i5.ListBuilder<_i3.ModelIndex>? indexes) =>
      _$this._indexes = indexes;

  _i5.ListBuilder<_i4.AuthRule>? _authRules;
  _i5.ListBuilder<_i4.AuthRule> get authRules =>
      _$this._authRules ??= new _i5.ListBuilder<_i4.AuthRule>();
  set authRules(_i5.ListBuilder<_i4.AuthRule>? authRules) =>
      _$this._authRules = authRules;

  ModelTypeDefinitionBuilder() {
    ModelTypeDefinition._init(this);
  }

  ModelTypeDefinitionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _pluralName = $v.pluralName;
      _fields = $v.fields.toBuilder();
      _indexes = $v.indexes.toBuilder();
      _authRules = $v.authRules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelTypeDefinition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelTypeDefinition;
  }

  @override
  void update(void Function(ModelTypeDefinitionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelTypeDefinition build() => _build();

  _$ModelTypeDefinition _build() {
    _$ModelTypeDefinition _$result;
    try {
      _$result = _$v ??
          new _$ModelTypeDefinition._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelTypeDefinition', 'name'),
              pluralName: BuiltValueNullFieldError.checkNotNull(
                  pluralName, r'ModelTypeDefinition', 'pluralName'),
              fields: fields.build(),
              indexes: indexes.build(),
              authRules: _authRules?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'indexes';
        indexes.build();
        _$failedField = 'authRules';
        _authRules?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelTypeDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
