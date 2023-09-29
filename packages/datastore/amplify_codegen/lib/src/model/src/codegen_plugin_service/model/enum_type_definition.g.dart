// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_type_definition.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumTypeDefinition extends EnumTypeDefinition {
  @override
  final String name;
  @override
  final _i2.BuiltList<String> values;

  factory _$EnumTypeDefinition(
          [void Function(EnumTypeDefinitionBuilder)? updates]) =>
      (new EnumTypeDefinitionBuilder()..update(updates))._build();

  _$EnumTypeDefinition._({required this.name, required this.values})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'EnumTypeDefinition', 'name');
    BuiltValueNullFieldError.checkNotNull(
        values, r'EnumTypeDefinition', 'values');
  }

  @override
  EnumTypeDefinition rebuild(
          void Function(EnumTypeDefinitionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumTypeDefinitionBuilder toBuilder() =>
      new EnumTypeDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumTypeDefinition &&
        name == other.name &&
        values == other.values;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class EnumTypeDefinitionBuilder
    implements Builder<EnumTypeDefinition, EnumTypeDefinitionBuilder> {
  _$EnumTypeDefinition? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  _i2.ListBuilder<String>? _values;
  _i2.ListBuilder<String> get values =>
      _$this._values ??= new _i2.ListBuilder<String>();
  set values(_i2.ListBuilder<String>? values) => _$this._values = values;

  EnumTypeDefinitionBuilder() {
    EnumTypeDefinition._init(this);
  }

  EnumTypeDefinitionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _values = $v.values.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumTypeDefinition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnumTypeDefinition;
  }

  @override
  void update(void Function(EnumTypeDefinitionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnumTypeDefinition build() => _build();

  _$EnumTypeDefinition _build() {
    _$EnumTypeDefinition _$result;
    try {
      _$result = _$v ??
          new _$EnumTypeDefinition._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'EnumTypeDefinition', 'name'),
              values: values.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        values.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EnumTypeDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
