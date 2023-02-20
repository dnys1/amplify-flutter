// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.non_model_type;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NonModelType extends NonModelType {
  @override
  final bool isRequired;
  @override
  final String nonModel;

  factory _$NonModelType([void Function(NonModelTypeBuilder)? updates]) =>
      (new NonModelTypeBuilder()..update(updates))._build();

  _$NonModelType._({required this.isRequired, required this.nonModel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isRequired, r'NonModelType', 'isRequired');
    BuiltValueNullFieldError.checkNotNull(
        nonModel, r'NonModelType', 'nonModel');
  }

  @override
  NonModelType rebuild(void Function(NonModelTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NonModelTypeBuilder toBuilder() => new NonModelTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NonModelType &&
        isRequired == other.isRequired &&
        nonModel == other.nonModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, nonModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class NonModelTypeBuilder
    implements Builder<NonModelType, NonModelTypeBuilder> {
  _$NonModelType? _$v;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  String? _nonModel;
  String? get nonModel => _$this._nonModel;
  set nonModel(String? nonModel) => _$this._nonModel = nonModel;

  NonModelTypeBuilder() {
    NonModelType._init(this);
  }

  NonModelTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isRequired = $v.isRequired;
      _nonModel = $v.nonModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NonModelType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NonModelType;
  }

  @override
  void update(void Function(NonModelTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NonModelType build() => _build();

  _$NonModelType _build() {
    final _$result = _$v ??
        new _$NonModelType._(
            isRequired: BuiltValueNullFieldError.checkNotNull(
                isRequired, r'NonModelType', 'isRequired'),
            nonModel: BuiltValueNullFieldError.checkNotNull(
                nonModel, r'NonModelType', 'nonModel'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
