// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelType extends ModelType {
  @override
  final bool isRequired;
  @override
  final String model;

  factory _$ModelType([void Function(ModelTypeBuilder)? updates]) =>
      (new ModelTypeBuilder()..update(updates))._build();

  _$ModelType._({required this.isRequired, required this.model}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isRequired, r'ModelType', 'isRequired');
    BuiltValueNullFieldError.checkNotNull(model, r'ModelType', 'model');
  }

  @override
  ModelType rebuild(void Function(ModelTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelTypeBuilder toBuilder() => new ModelTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelType &&
        isRequired == other.isRequired &&
        model == other.model;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ModelTypeBuilder implements Builder<ModelType, ModelTypeBuilder> {
  _$ModelType? _$v;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  ModelTypeBuilder() {
    ModelType._init(this);
  }

  ModelTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isRequired = $v.isRequired;
      _model = $v.model;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelType;
  }

  @override
  void update(void Function(ModelTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelType build() => _build();

  _$ModelType _build() {
    final _$result = _$v ??
        new _$ModelType._(
            isRequired: BuiltValueNullFieldError.checkNotNull(
                isRequired, r'ModelType', 'isRequired'),
            model: BuiltValueNullFieldError.checkNotNull(
                model, r'ModelType', 'model'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
