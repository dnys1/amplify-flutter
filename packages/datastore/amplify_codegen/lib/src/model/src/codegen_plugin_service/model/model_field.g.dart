// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelField extends ModelField {
  @override
  final String name;
  @override
  final _i2.SchemaType type;
  @override
  final bool? isReadOnly;
  @override
  final _i3.ModelAssociation? association;
  @override
  final _i5.BuiltList<_i4.AuthRule>? authRules;

  factory _$ModelField([void Function(ModelFieldBuilder)? updates]) =>
      (new ModelFieldBuilder()..update(updates))._build();

  _$ModelField._(
      {required this.name,
      required this.type,
      this.isReadOnly,
      this.association,
      this.authRules})
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
        name == other.name &&
        type == other.type &&
        isReadOnly == other.isReadOnly &&
        association == other.association &&
        authRules == other.authRules;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, isReadOnly.hashCode);
    _$hash = $jc(_$hash, association.hashCode);
    _$hash = $jc(_$hash, authRules.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelFieldBuilder implements Builder<ModelField, ModelFieldBuilder> {
  _$ModelField? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i2.SchemaType? _type;
  _i2.SchemaType? get type => _$this._type;
  set type(_i2.SchemaType? type) => _$this._type = type;

  bool? _isReadOnly;
  bool? get isReadOnly => _$this._isReadOnly;
  set isReadOnly(bool? isReadOnly) => _$this._isReadOnly = isReadOnly;

  _i3.ModelAssociation? _association;
  _i3.ModelAssociation? get association => _$this._association;
  set association(_i3.ModelAssociation? association) =>
      _$this._association = association;

  _i5.ListBuilder<_i4.AuthRule>? _authRules;
  _i5.ListBuilder<_i4.AuthRule> get authRules =>
      _$this._authRules ??= new _i5.ListBuilder<_i4.AuthRule>();
  set authRules(_i5.ListBuilder<_i4.AuthRule>? authRules) =>
      _$this._authRules = authRules;

  ModelFieldBuilder() {
    ModelField._init(this);
  }

  ModelFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _isReadOnly = $v.isReadOnly;
      _association = $v.association;
      _authRules = $v.authRules?.toBuilder();
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
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ModelField', 'name'),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'ModelField', 'type'),
              isReadOnly: isReadOnly,
              association: association,
              authRules: _authRules?.build());
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
