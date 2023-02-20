// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.model_association_has_many;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelAssociationHasMany extends ModelAssociationHasMany {
  @override
  final _i2.ModelField associatedWith;
  @override
  final _i3.BuiltList<_i2.ModelField> associatedWithFields;
  @override
  final String connectedModel;

  factory _$ModelAssociationHasMany(
          [void Function(ModelAssociationHasManyBuilder)? updates]) =>
      (new ModelAssociationHasManyBuilder()..update(updates))._build();

  _$ModelAssociationHasMany._(
      {required this.associatedWith,
      required this.associatedWithFields,
      required this.connectedModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        associatedWith, r'ModelAssociationHasMany', 'associatedWith');
    BuiltValueNullFieldError.checkNotNull(associatedWithFields,
        r'ModelAssociationHasMany', 'associatedWithFields');
    BuiltValueNullFieldError.checkNotNull(
        connectedModel, r'ModelAssociationHasMany', 'connectedModel');
  }

  @override
  ModelAssociationHasMany rebuild(
          void Function(ModelAssociationHasManyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelAssociationHasManyBuilder toBuilder() =>
      new ModelAssociationHasManyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelAssociationHasMany &&
        associatedWith == other.associatedWith &&
        associatedWithFields == other.associatedWithFields &&
        connectedModel == other.connectedModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, associatedWith.hashCode);
    _$hash = $jc(_$hash, associatedWithFields.hashCode);
    _$hash = $jc(_$hash, connectedModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelAssociationHasManyBuilder
    implements
        Builder<ModelAssociationHasMany, ModelAssociationHasManyBuilder> {
  _$ModelAssociationHasMany? _$v;

  _i2.ModelFieldBuilder? _associatedWith;
  _i2.ModelFieldBuilder get associatedWith =>
      _$this._associatedWith ??= new _i2.ModelFieldBuilder();
  set associatedWith(_i2.ModelFieldBuilder? associatedWith) =>
      _$this._associatedWith = associatedWith;

  _i3.ListBuilder<_i2.ModelField>? _associatedWithFields;
  _i3.ListBuilder<_i2.ModelField> get associatedWithFields =>
      _$this._associatedWithFields ??= new _i3.ListBuilder<_i2.ModelField>();
  set associatedWithFields(
          _i3.ListBuilder<_i2.ModelField>? associatedWithFields) =>
      _$this._associatedWithFields = associatedWithFields;

  String? _connectedModel;
  String? get connectedModel => _$this._connectedModel;
  set connectedModel(String? connectedModel) =>
      _$this._connectedModel = connectedModel;

  ModelAssociationHasManyBuilder() {
    ModelAssociationHasMany._init(this);
  }

  ModelAssociationHasManyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _associatedWith = $v.associatedWith.toBuilder();
      _associatedWithFields = $v.associatedWithFields.toBuilder();
      _connectedModel = $v.connectedModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelAssociationHasMany other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelAssociationHasMany;
  }

  @override
  void update(void Function(ModelAssociationHasManyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelAssociationHasMany build() => _build();

  _$ModelAssociationHasMany _build() {
    _$ModelAssociationHasMany _$result;
    try {
      _$result = _$v ??
          new _$ModelAssociationHasMany._(
              associatedWith: associatedWith.build(),
              associatedWithFields: associatedWithFields.build(),
              connectedModel: BuiltValueNullFieldError.checkNotNull(
                  connectedModel,
                  r'ModelAssociationHasMany',
                  'connectedModel'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'associatedWith';
        associatedWith.build();
        _$failedField = 'associatedWithFields';
        associatedWithFields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelAssociationHasMany', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
