// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.model_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelField extends ModelField {
  @override
  final _i2.ModelAssociation? association;
  @override
  final _i5.BuiltList<_i3.AuthRule>? authRules;
  @override
  final bool? isReadOnly;
  @override
  final String name;
  @override
  final _i4.SchemaType type;

  factory _$ModelField([void Function(ModelFieldBuilder)? updates]) =>
      (new ModelFieldBuilder()..update(updates))._build();

  _$ModelField._(
      {this.association,
      this.authRules,
      this.isReadOnly,
      required this.name,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ModelField', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'ModelField', 'type');
  }

  @override
  ModelField rebuild(void Function(ModelFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelFieldBuilder toBuilder() => new ModelFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelField &&
        association == other.association &&
        authRules == other.authRules &&
        isReadOnly == other.isReadOnly &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, association.hashCode);
    _$hash = $jc(_$hash, authRules.hashCode);
    _$hash = $jc(_$hash, isReadOnly.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelFieldBuilder implements Builder<ModelField, ModelFieldBuilder> {
  _$ModelField? _$v;

  _i2.ModelAssociation? _association;
  _i2.ModelAssociation? get association => _$this._association;
  set association(_i2.ModelAssociation? association) =>
      _$this._association = association;

  _i5.ListBuilder<_i3.AuthRule>? _authRules;
  _i5.ListBuilder<_i3.AuthRule> get authRules =>
      _$this._authRules ??= new _i5.ListBuilder<_i3.AuthRule>();
  set authRules(_i5.ListBuilder<_i3.AuthRule>? authRules) =>
      _$this._authRules = authRules;

  bool? _isReadOnly;
  bool? get isReadOnly => _$this._isReadOnly;
  set isReadOnly(bool? isReadOnly) => _$this._isReadOnly = isReadOnly;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i4.SchemaType? _type;
  _i4.SchemaType? get type => _$this._type;
  set type(_i4.SchemaType? type) => _$this._type = type;

  ModelFieldBuilder() {
    ModelField._init(this);
  }

  ModelFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _association = $v.association;
      _authRules = $v.authRules?.toBuilder();
      _isReadOnly = $v.isReadOnly;
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelField;
  }

  @override
  void update(void Function(ModelFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelField build() => _build();

  _$ModelField _build() {
    _$ModelField _$result;
    try {
      _$result = _$v ??
          new _$ModelField._(
              association: association,
              authRules: _authRules?.build(),
              isReadOnly: isReadOnly,
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelField', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'ModelField', 'type'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'authRules';
        _authRules?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
