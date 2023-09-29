// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globals.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Globals extends Globals {
  @override
  final _i2.AuthRule? globalAuthRule;

  factory _$Globals([void Function(GlobalsBuilder)? updates]) =>
      (new GlobalsBuilder()..update(updates))._build();

  _$Globals._({this.globalAuthRule}) : super._();

  @override
  Globals rebuild(void Function(GlobalsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalsBuilder toBuilder() => new GlobalsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Globals && globalAuthRule == other.globalAuthRule;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, globalAuthRule.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class GlobalsBuilder implements Builder<Globals, GlobalsBuilder> {
  _$Globals? _$v;

  _i2.AuthRuleBuilder? _globalAuthRule;
  _i2.AuthRuleBuilder get globalAuthRule =>
      _$this._globalAuthRule ??= new _i2.AuthRuleBuilder();
  set globalAuthRule(_i2.AuthRuleBuilder? globalAuthRule) =>
      _$this._globalAuthRule = globalAuthRule;

  GlobalsBuilder() {
    Globals._init(this);
  }

  GlobalsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _globalAuthRule = $v.globalAuthRule?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Globals other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Globals;
  }

  @override
  void update(void Function(GlobalsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Globals build() => _build();

  _$Globals _build() {
    _$Globals _$result;
    try {
      _$result =
          _$v ?? new _$Globals._(globalAuthRule: _globalAuthRule?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'globalAuthRule';
        _globalAuthRule?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Globals', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
