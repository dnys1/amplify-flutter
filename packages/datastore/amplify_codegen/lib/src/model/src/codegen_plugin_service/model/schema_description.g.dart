// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema_description.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SchemaDescription extends SchemaDescription {
  @override
  final String name;
  @override
  final _i2.Globals? globals;
  @override
  final _i4.BuiltList<_i3.TypeDescription> types;

  factory _$SchemaDescription(
          [void Function(SchemaDescriptionBuilder)? updates]) =>
      (new SchemaDescriptionBuilder()..update(updates))._build();

  _$SchemaDescription._({required this.name, this.globals, required this.types})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'SchemaDescription', 'name');
    BuiltValueNullFieldError.checkNotNull(types, r'SchemaDescription', 'types');
  }

  @override
  SchemaDescription rebuild(void Function(SchemaDescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchemaDescriptionBuilder toBuilder() =>
      new SchemaDescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SchemaDescription &&
        name == other.name &&
        globals == other.globals &&
        types == other.types;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, globals.hashCode);
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class SchemaDescriptionBuilder
    implements Builder<SchemaDescription, SchemaDescriptionBuilder> {
  _$SchemaDescription? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i2.GlobalsBuilder? _globals;
  _i2.GlobalsBuilder get globals =>
      _$this._globals ??= new _i2.GlobalsBuilder();
  set globals(_i2.GlobalsBuilder? globals) => _$this._globals = globals;

  _i4.ListBuilder<_i3.TypeDescription>? _types;
  _i4.ListBuilder<_i3.TypeDescription> get types =>
      _$this._types ??= new _i4.ListBuilder<_i3.TypeDescription>();
  set types(_i4.ListBuilder<_i3.TypeDescription>? types) =>
      _$this._types = types;

  SchemaDescriptionBuilder() {
    SchemaDescription._init(this);
  }

  SchemaDescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _globals = $v.globals?.toBuilder();
      _types = $v.types.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SchemaDescription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SchemaDescription;
  }

  @override
  void update(void Function(SchemaDescriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SchemaDescription build() => _build();

  _$SchemaDescription _build() {
    _$SchemaDescription _$result;
    try {
      _$result = _$v ??
          new _$SchemaDescription._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'SchemaDescription', 'name'),
              globals: _globals?.build(),
              types: types.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'globals';
        _globals?.build();
        _$failedField = 'types';
        types.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SchemaDescription', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
