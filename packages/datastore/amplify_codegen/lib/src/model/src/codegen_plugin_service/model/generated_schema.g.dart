// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneratedSchema extends GeneratedSchema {
  @override
  final _i2.SchemaDescription description;
  @override
  final _i3.SchemaDefinition mipr;

  factory _$GeneratedSchema([void Function(GeneratedSchemaBuilder)? updates]) =>
      (new GeneratedSchemaBuilder()..update(updates))._build();

  _$GeneratedSchema._({required this.description, required this.mipr})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'GeneratedSchema', 'description');
    BuiltValueNullFieldError.checkNotNull(mipr, r'GeneratedSchema', 'mipr');
  }

  @override
  GeneratedSchema rebuild(void Function(GeneratedSchemaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneratedSchemaBuilder toBuilder() =>
      new GeneratedSchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneratedSchema &&
        description == other.description &&
        mipr == other.mipr;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, mipr.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class GeneratedSchemaBuilder
    implements Builder<GeneratedSchema, GeneratedSchemaBuilder> {
  _$GeneratedSchema? _$v;

  _i2.SchemaDescriptionBuilder? _description;
  _i2.SchemaDescriptionBuilder get description =>
      _$this._description ??= new _i2.SchemaDescriptionBuilder();
  set description(_i2.SchemaDescriptionBuilder? description) =>
      _$this._description = description;

  _i3.SchemaDefinitionBuilder? _mipr;
  _i3.SchemaDefinitionBuilder get mipr =>
      _$this._mipr ??= new _i3.SchemaDefinitionBuilder();
  set mipr(_i3.SchemaDefinitionBuilder? mipr) => _$this._mipr = mipr;

  GeneratedSchemaBuilder() {
    GeneratedSchema._init(this);
  }

  GeneratedSchemaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description.toBuilder();
      _mipr = $v.mipr.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneratedSchema other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneratedSchema;
  }

  @override
  void update(void Function(GeneratedSchemaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneratedSchema build() => _build();

  _$GeneratedSchema _build() {
    _$GeneratedSchema _$result;
    try {
      _$result = _$v ??
          new _$GeneratedSchema._(
              description: description.build(), mipr: mipr.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'description';
        description.build();
        _$failedField = 'mipr';
        mipr.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GeneratedSchema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
