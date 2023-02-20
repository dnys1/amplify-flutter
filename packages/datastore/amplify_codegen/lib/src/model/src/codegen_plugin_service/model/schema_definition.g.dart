// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.schema_definition;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SchemaDefinition extends SchemaDefinition {
  @override
  final _i3.BuiltSetMultimap<String, String>? modelGraph;
  @override
  final _i3.BuiltMap<String, _i2.SchemaTypeDefinition>? typeDefinitions;

  factory _$SchemaDefinition(
          [void Function(SchemaDefinitionBuilder)? updates]) =>
      (new SchemaDefinitionBuilder()..update(updates))._build();

  _$SchemaDefinition._({this.modelGraph, this.typeDefinitions}) : super._();

  @override
  SchemaDefinition rebuild(void Function(SchemaDefinitionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchemaDefinitionBuilder toBuilder() =>
      new SchemaDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SchemaDefinition &&
        modelGraph == other.modelGraph &&
        typeDefinitions == other.typeDefinitions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, modelGraph.hashCode);
    _$hash = $jc(_$hash, typeDefinitions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class SchemaDefinitionBuilder
    implements Builder<SchemaDefinition, SchemaDefinitionBuilder> {
  _$SchemaDefinition? _$v;

  _i3.SetMultimapBuilder<String, String>? _modelGraph;
  _i3.SetMultimapBuilder<String, String> get modelGraph =>
      _$this._modelGraph ??= new _i3.SetMultimapBuilder<String, String>();
  set modelGraph(_i3.SetMultimapBuilder<String, String>? modelGraph) =>
      _$this._modelGraph = modelGraph;

  _i3.MapBuilder<String, _i2.SchemaTypeDefinition>? _typeDefinitions;
  _i3.MapBuilder<String, _i2.SchemaTypeDefinition> get typeDefinitions =>
      _$this._typeDefinitions ??=
          new _i3.MapBuilder<String, _i2.SchemaTypeDefinition>();
  set typeDefinitions(
          _i3.MapBuilder<String, _i2.SchemaTypeDefinition>? typeDefinitions) =>
      _$this._typeDefinitions = typeDefinitions;

  SchemaDefinitionBuilder() {
    SchemaDefinition._init(this);
  }

  SchemaDefinitionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _modelGraph = $v.modelGraph?.toBuilder();
      _typeDefinitions = $v.typeDefinitions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SchemaDefinition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SchemaDefinition;
  }

  @override
  void update(void Function(SchemaDefinitionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SchemaDefinition build() => _build();

  _$SchemaDefinition _build() {
    _$SchemaDefinition _$result;
    try {
      _$result = _$v ??
          new _$SchemaDefinition._(
              modelGraph: _modelGraph?.build(),
              typeDefinitions: _typeDefinitions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modelGraph';
        _modelGraph?.build();
        _$failedField = 'typeDefinitions';
        _typeDefinitions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SchemaDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
