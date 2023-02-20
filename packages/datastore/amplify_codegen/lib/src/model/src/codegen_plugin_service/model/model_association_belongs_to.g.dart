// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.model_association_belongs_to;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelAssociationBelongsTo extends ModelAssociationBelongsTo {
  @override
  final String connectedModel;
  @override
  final String targetName;
  @override
  final _i2.BuiltList<String> targetNames;

  factory _$ModelAssociationBelongsTo(
          [void Function(ModelAssociationBelongsToBuilder)? updates]) =>
      (new ModelAssociationBelongsToBuilder()..update(updates))._build();

  _$ModelAssociationBelongsTo._(
      {required this.connectedModel,
      required this.targetName,
      required this.targetNames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        connectedModel, r'ModelAssociationBelongsTo', 'connectedModel');
    BuiltValueNullFieldError.checkNotNull(
        targetName, r'ModelAssociationBelongsTo', 'targetName');
    BuiltValueNullFieldError.checkNotNull(
        targetNames, r'ModelAssociationBelongsTo', 'targetNames');
  }

  @override
  ModelAssociationBelongsTo rebuild(
          void Function(ModelAssociationBelongsToBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelAssociationBelongsToBuilder toBuilder() =>
      new ModelAssociationBelongsToBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelAssociationBelongsTo &&
        connectedModel == other.connectedModel &&
        targetName == other.targetName &&
        targetNames == other.targetNames;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, connectedModel.hashCode);
    _$hash = $jc(_$hash, targetName.hashCode);
    _$hash = $jc(_$hash, targetNames.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelAssociationBelongsToBuilder
    implements
        Builder<ModelAssociationBelongsTo, ModelAssociationBelongsToBuilder> {
  _$ModelAssociationBelongsTo? _$v;

  String? _connectedModel;
  String? get connectedModel => _$this._connectedModel;
  set connectedModel(String? connectedModel) =>
      _$this._connectedModel = connectedModel;

  String? _targetName;
  String? get targetName => _$this._targetName;
  set targetName(String? targetName) => _$this._targetName = targetName;

  _i2.ListBuilder<String>? _targetNames;
  _i2.ListBuilder<String> get targetNames =>
      _$this._targetNames ??= new _i2.ListBuilder<String>();
  set targetNames(_i2.ListBuilder<String>? targetNames) =>
      _$this._targetNames = targetNames;

  ModelAssociationBelongsToBuilder() {
    ModelAssociationBelongsTo._init(this);
  }

  ModelAssociationBelongsToBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _connectedModel = $v.connectedModel;
      _targetName = $v.targetName;
      _targetNames = $v.targetNames.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelAssociationBelongsTo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelAssociationBelongsTo;
  }

  @override
  void update(void Function(ModelAssociationBelongsToBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelAssociationBelongsTo build() => _build();

  _$ModelAssociationBelongsTo _build() {
    _$ModelAssociationBelongsTo _$result;
    try {
      _$result = _$v ??
          new _$ModelAssociationBelongsTo._(
              connectedModel: BuiltValueNullFieldError.checkNotNull(
                  connectedModel,
                  r'ModelAssociationBelongsTo',
                  'connectedModel'),
              targetName: BuiltValueNullFieldError.checkNotNull(
                  targetName, r'ModelAssociationBelongsTo', 'targetName'),
              targetNames: targetNames.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'targetNames';
        targetNames.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelAssociationBelongsTo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
