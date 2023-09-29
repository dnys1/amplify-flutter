// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumType extends EnumType {
  @override
  final bool isRequired;
  @override
  final String enum_;

  factory _$EnumType([void Function(EnumTypeBuilder)? updates]) =>
      (new EnumTypeBuilder()..update(updates))._build();

  _$EnumType._({required this.isRequired, required this.enum_}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isRequired, r'EnumType', 'isRequired');
    BuiltValueNullFieldError.checkNotNull(enum_, r'EnumType', 'enum_');
  }

  @override
  EnumType rebuild(void Function(EnumTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumTypeBuilder toBuilder() => new EnumTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumType &&
        isRequired == other.isRequired &&
        enum_ == other.enum_;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, enum_.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class EnumTypeBuilder implements Builder<EnumType, EnumTypeBuilder> {
  _$EnumType? _$v;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  String? _enum_;
  String? get enum_ => _$this._enum_;
  set enum_(String? enum_) => _$this._enum_ = enum_;

  EnumTypeBuilder() {
    EnumType._init(this);
  }

  EnumTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isRequired = $v.isRequired;
      _enum_ = $v.enum_;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnumType;
  }

  @override
  void update(void Function(EnumTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnumType build() => _build();

  _$EnumType _build() {
    final _$result = _$v ??
        new _$EnumType._(
            isRequired: BuiltValueNullFieldError.checkNotNull(
                isRequired, r'EnumType', 'isRequired'),
            enum_: BuiltValueNullFieldError.checkNotNull(
                enum_, r'EnumType', 'enum_'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
