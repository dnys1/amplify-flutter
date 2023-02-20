// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.model_type_definition;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelTypeDefinition extends ModelTypeDefinition {
  @override
  final _i5.BuiltList<_i2.AuthRule>? authRules;
  @override
  final _i5.BuiltMap<String, _i3.ModelField> fields;
  @override
  final _i5.BuiltList<_i4.ModelIndex> indexes;
  @override
  final String name;
  @override
  final String pluralName;

  factory _$ModelTypeDefinition(
          [void Function(ModelTypeDefinitionBuilder)? updates]) =>
      (new ModelTypeDefinitionBuilder()..update(updates))._build();

  _$ModelTypeDefinition._(
      {this.authRules,
      required this.fields,
      required this.indexes,
      required this.name,
      required this.pluralName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fields, r'ModelTypeDefinition', 'fields');
    BuiltValueNullFieldError.checkNotNull(
        indexes, r'ModelTypeDefinition', 'indexes');
    BuiltValueNullFieldError.checkNotNull(name, r'ModelTypeDefinition', 'name');
    BuiltValueNullFieldError.checkNotNull(
        pluralName, r'ModelTypeDefinition', 'pluralName');
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
        authRules == other.authRules &&
        fields == other.fields &&
        indexes == other.indexes &&
        name == other.name &&
        pluralName == other.pluralName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authRules.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, indexes.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, pluralName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelTypeDefinitionBuilder
    implements Builder<ModelTypeDefinition, ModelTypeDefinitionBuilder> {
  _$ModelTypeDefinition? _$v;

  _i5.ListBuilder<_i2.AuthRule>? _authRules;
  _i5.ListBuilder<_i2.AuthRule> get authRules =>
      _$this._authRules ??= new _i5.ListBuilder<_i2.AuthRule>();
  set authRules(_i5.ListBuilder<_i2.AuthRule>? authRules) =>
      _$this._authRules = authRules;

  _i5.MapBuilder<String, _i3.ModelField>? _fields;
  _i5.MapBuilder<String, _i3.ModelField> get fields =>
      _$this._fields ??= new _i5.MapBuilder<String, _i3.ModelField>();
  set fields(_i5.MapBuilder<String, _i3.ModelField>? fields) =>
      _$this._fields = fields;

  _i5.ListBuilder<_i4.ModelIndex>? _indexes;
  _i5.ListBuilder<_i4.ModelIndex> get indexes =>
      _$this._indexes ??= new _i5.ListBuilder<_i4.ModelIndex>();
  set indexes(_i5.ListBuilder<_i4.ModelIndex>? indexes) =>
      _$this._indexes = indexes;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _pluralName;
  String? get pluralName => _$this._pluralName;
  set pluralName(String? pluralName) => _$this._pluralName = pluralName;

  ModelTypeDefinitionBuilder() {
    ModelTypeDefinition._init(this);
  }

  ModelTypeDefinitionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authRules = $v.authRules?.toBuilder();
      _fields = $v.fields.toBuilder();
      _indexes = $v.indexes.toBuilder();
      _name = $v.name;
      _pluralName = $v.pluralName;
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
              authRules: _authRules?.build(),
              fields: fields.build(),
              indexes: indexes.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelTypeDefinition', 'name'),
              pluralName: BuiltValueNullFieldError.checkNotNull(
                  pluralName, r'ModelTypeDefinition', 'pluralName'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'authRules';
        _authRules?.build();
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'indexes';
        indexes.build();
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
