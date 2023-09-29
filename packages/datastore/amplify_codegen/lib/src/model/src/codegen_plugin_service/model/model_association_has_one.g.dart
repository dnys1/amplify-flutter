// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_association_has_one.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelAssociationHasOne extends ModelAssociationHasOne {
  @override
  final String connectedModel;
  @override
  final String targetName;
  @override
  final _i3.BuiltList<String> targetNames;
  @override
  final _i2.ModelField associatedWith;
  @override
  final _i3.BuiltList<_i2.ModelField> associatedWithFields;

  factory _$ModelAssociationHasOne(
          [void Function(ModelAssociationHasOneBuilder)? updates]) =>
      (new ModelAssociationHasOneBuilder()..update(updates))._build();

  _$ModelAssociationHasOne._(
      {required this.connectedModel,
      required this.targetName,
      required this.targetNames,
      required this.associatedWith,
      required this.associatedWithFields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        connectedModel, r'ModelAssociationHasOne', 'connectedModel');
    BuiltValueNullFieldError.checkNotNull(
        targetName, r'ModelAssociationHasOne', 'targetName');
    BuiltValueNullFieldError.checkNotNull(
        targetNames, r'ModelAssociationHasOne', 'targetNames');
    BuiltValueNullFieldError.checkNotNull(
        associatedWith, r'ModelAssociationHasOne', 'associatedWith');
    BuiltValueNullFieldError.checkNotNull(associatedWithFields,
        r'ModelAssociationHasOne', 'associatedWithFields');
  }

  @override
  ModelAssociationHasOne rebuild(
          void Function(ModelAssociationHasOneBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelAssociationHasOneBuilder toBuilder() =>
      new ModelAssociationHasOneBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelAssociationHasOne &&
        connectedModel == other.connectedModel &&
        targetName == other.targetName &&
        targetNames == other.targetNames &&
        associatedWith == other.associatedWith &&
        associatedWithFields == other.associatedWithFields;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, connectedModel.hashCode);
    _$hash = $jc(_$hash, targetName.hashCode);
    _$hash = $jc(_$hash, targetNames.hashCode);
    _$hash = $jc(_$hash, associatedWith.hashCode);
    _$hash = $jc(_$hash, associatedWithFields.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelAssociationHasOneBuilder
    implements Builder<ModelAssociationHasOne, ModelAssociationHasOneBuilder> {
  _$ModelAssociationHasOne? _$v;

  String? _connectedModel;
  String? get connectedModel => _$this._connectedModel;
  set connectedModel(String? connectedModel) =>
      _$this._connectedModel = connectedModel;

  String? _targetName;
  String? get targetName => _$this._targetName;
  set targetName(String? targetName) => _$this._targetName = targetName;

  _i3.ListBuilder<String>? _targetNames;
  _i3.ListBuilder<String> get targetNames =>
      _$this._targetNames ??= new _i3.ListBuilder<String>();
  set targetNames(_i3.ListBuilder<String>? targetNames) =>
      _$this._targetNames = targetNames;

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

  ModelAssociationHasOneBuilder() {
    ModelAssociationHasOne._init(this);
  }

  ModelAssociationHasOneBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _connectedModel = $v.connectedModel;
      _targetName = $v.targetName;
      _targetNames = $v.targetNames.toBuilder();
      _associatedWith = $v.associatedWith.toBuilder();
      _associatedWithFields = $v.associatedWithFields.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelAssociationHasOne other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelAssociationHasOne;
  }

  @override
  void update(void Function(ModelAssociationHasOneBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelAssociationHasOne build() => _build();

  _$ModelAssociationHasOne _build() {
    _$ModelAssociationHasOne _$result;
    try {
      _$result = _$v ??
          new _$ModelAssociationHasOne._(
              connectedModel: BuiltValueNullFieldError.checkNotNull(
                  connectedModel, r'ModelAssociationHasOne', 'connectedModel'),
              targetName: BuiltValueNullFieldError.checkNotNull(
                  targetName, r'ModelAssociationHasOne', 'targetName'),
              targetNames: targetNames.build(),
              associatedWith: associatedWith.build(),
              associatedWithFields: associatedWithFields.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'targetNames';
        targetNames.build();
        _$failedField = 'associatedWith';
        associatedWith.build();
        _$failedField = 'associatedWithFields';
        associatedWithFields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelAssociationHasOne', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
