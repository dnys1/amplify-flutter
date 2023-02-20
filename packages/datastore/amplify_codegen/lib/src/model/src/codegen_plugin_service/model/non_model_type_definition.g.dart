// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.non_model_type_definition;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NonModelTypeDefinition extends NonModelTypeDefinition {
  @override
  final _i3.BuiltMap<String, _i2.ModelField> fields;
  @override
  final String name;

  factory _$NonModelTypeDefinition(
          [void Function(NonModelTypeDefinitionBuilder)? updates]) =>
      (new NonModelTypeDefinitionBuilder()..update(updates))._build();

  _$NonModelTypeDefinition._({required this.fields, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fields, r'NonModelTypeDefinition', 'fields');
    BuiltValueNullFieldError.checkNotNull(
        name, r'NonModelTypeDefinition', 'name');
  }

  @override
  NonModelTypeDefinition rebuild(
          void Function(NonModelTypeDefinitionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NonModelTypeDefinitionBuilder toBuilder() =>
      new NonModelTypeDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NonModelTypeDefinition &&
        fields == other.fields &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class NonModelTypeDefinitionBuilder
    implements Builder<NonModelTypeDefinition, NonModelTypeDefinitionBuilder> {
  _$NonModelTypeDefinition? _$v;

  _i3.MapBuilder<String, _i2.ModelField>? _fields;
  _i3.MapBuilder<String, _i2.ModelField> get fields =>
      _$this._fields ??= new _i3.MapBuilder<String, _i2.ModelField>();
  set fields(_i3.MapBuilder<String, _i2.ModelField>? fields) =>
      _$this._fields = fields;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  NonModelTypeDefinitionBuilder() {
    NonModelTypeDefinition._init(this);
  }

  NonModelTypeDefinitionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fields = $v.fields.toBuilder();
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NonModelTypeDefinition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NonModelTypeDefinition;
  }

  @override
  void update(void Function(NonModelTypeDefinitionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NonModelTypeDefinition build() => _build();

  _$NonModelTypeDefinition _build() {
    _$NonModelTypeDefinition _$result;
    try {
      _$result = _$v ??
          new _$NonModelTypeDefinition._(
              fields: fields.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'NonModelTypeDefinition', 'name'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NonModelTypeDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
