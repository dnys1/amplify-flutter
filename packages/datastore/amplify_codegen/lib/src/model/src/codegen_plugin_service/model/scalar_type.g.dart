// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.scalar_type;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ScalarType extends ScalarType {
  @override
  final bool isRequired;
  @override
  final _i2.AppSyncScalar scalar;

  factory _$ScalarType([void Function(ScalarTypeBuilder)? updates]) =>
      (new ScalarTypeBuilder()..update(updates))._build();

  _$ScalarType._({required this.isRequired, required this.scalar}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isRequired, r'ScalarType', 'isRequired');
    BuiltValueNullFieldError.checkNotNull(scalar, r'ScalarType', 'scalar');
  }

  @override
  ScalarType rebuild(void Function(ScalarTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScalarTypeBuilder toBuilder() => new ScalarTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScalarType &&
        isRequired == other.isRequired &&
        scalar == other.scalar;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, scalar.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ScalarTypeBuilder implements Builder<ScalarType, ScalarTypeBuilder> {
  _$ScalarType? _$v;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  _i2.AppSyncScalar? _scalar;
  _i2.AppSyncScalar? get scalar => _$this._scalar;
  set scalar(_i2.AppSyncScalar? scalar) => _$this._scalar = scalar;

  ScalarTypeBuilder() {
    ScalarType._init(this);
  }

  ScalarTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isRequired = $v.isRequired;
      _scalar = $v.scalar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScalarType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScalarType;
  }

  @override
  void update(void Function(ScalarTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScalarType build() => _build();

  _$ScalarType _build() {
    final _$result = _$v ??
        new _$ScalarType._(
            isRequired: BuiltValueNullFieldError.checkNotNull(
                isRequired, r'ScalarType', 'isRequired'),
            scalar: BuiltValueNullFieldError.checkNotNull(
                scalar, r'ScalarType', 'scalar'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
