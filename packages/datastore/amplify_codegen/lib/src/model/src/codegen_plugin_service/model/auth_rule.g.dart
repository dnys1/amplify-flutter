// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_rule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthRule extends AuthRule {
  @override
  final _i2.AuthStrategy authStrategy;
  @override
  final String? ownerField;
  @override
  final String? identityClaim;
  @override
  final String? groupClaim;
  @override
  final _i5.BuiltList<String>? groups;
  @override
  final String? groupsField;
  @override
  final _i3.AuthProvider? provider;
  @override
  final _i5.BuiltList<_i4.AuthModelOperation>? operations;

  factory _$AuthRule([void Function(AuthRuleBuilder)? updates]) =>
      (new AuthRuleBuilder()..update(updates))._build();

  _$AuthRule._(
      {required this.authStrategy,
      this.ownerField,
      this.identityClaim,
      this.groupClaim,
      this.groups,
      this.groupsField,
      this.provider,
      this.operations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        authStrategy, r'AuthRule', 'authStrategy');
  }

  @override
  AuthRule rebuild(void Function(AuthRuleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthRuleBuilder toBuilder() => new AuthRuleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthRule &&
        authStrategy == other.authStrategy &&
        ownerField == other.ownerField &&
        identityClaim == other.identityClaim &&
        groupClaim == other.groupClaim &&
        groups == other.groups &&
        groupsField == other.groupsField &&
        provider == other.provider &&
        operations == other.operations;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authStrategy.hashCode);
    _$hash = $jc(_$hash, ownerField.hashCode);
    _$hash = $jc(_$hash, identityClaim.hashCode);
    _$hash = $jc(_$hash, groupClaim.hashCode);
    _$hash = $jc(_$hash, groups.hashCode);
    _$hash = $jc(_$hash, groupsField.hashCode);
    _$hash = $jc(_$hash, provider.hashCode);
    _$hash = $jc(_$hash, operations.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class AuthRuleBuilder implements Builder<AuthRule, AuthRuleBuilder> {
  _$AuthRule? _$v;

  _i2.AuthStrategy? _authStrategy;
  _i2.AuthStrategy? get authStrategy => _$this._authStrategy;
  set authStrategy(_i2.AuthStrategy? authStrategy) =>
      _$this._authStrategy = authStrategy;

  String? _ownerField;
  String? get ownerField => _$this._ownerField;
  set ownerField(String? ownerField) => _$this._ownerField = ownerField;

  String? _identityClaim;
  String? get identityClaim => _$this._identityClaim;
  set identityClaim(String? identityClaim) =>
      _$this._identityClaim = identityClaim;

  String? _groupClaim;
  String? get groupClaim => _$this._groupClaim;
  set groupClaim(String? groupClaim) => _$this._groupClaim = groupClaim;

  _i5.ListBuilder<String>? _groups;
  _i5.ListBuilder<String> get groups =>
      _$this._groups ??= new _i5.ListBuilder<String>();
  set groups(_i5.ListBuilder<String>? groups) => _$this._groups = groups;

  String? _groupsField;
  String? get groupsField => _$this._groupsField;
  set groupsField(String? groupsField) => _$this._groupsField = groupsField;

  _i3.AuthProvider? _provider;
  _i3.AuthProvider? get provider => _$this._provider;
  set provider(_i3.AuthProvider? provider) => _$this._provider = provider;

  _i5.ListBuilder<_i4.AuthModelOperation>? _operations;
  _i5.ListBuilder<_i4.AuthModelOperation> get operations =>
      _$this._operations ??= new _i5.ListBuilder<_i4.AuthModelOperation>();
  set operations(_i5.ListBuilder<_i4.AuthModelOperation>? operations) =>
      _$this._operations = operations;

  AuthRuleBuilder() {
    AuthRule._init(this);
  }

  AuthRuleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authStrategy = $v.authStrategy;
      _ownerField = $v.ownerField;
      _identityClaim = $v.identityClaim;
      _groupClaim = $v.groupClaim;
      _groups = $v.groups?.toBuilder();
      _groupsField = $v.groupsField;
      _provider = $v.provider;
      _operations = $v.operations?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthRule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthRule;
  }

  @override
  void update(void Function(AuthRuleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthRule build() => _build();

  _$AuthRule _build() {
    _$AuthRule _$result;
    try {
      _$result = _$v ??
          new _$AuthRule._(
              authStrategy: BuiltValueNullFieldError.checkNotNull(
                  authStrategy, r'AuthRule', 'authStrategy'),
              ownerField: ownerField,
              identityClaim: identityClaim,
              groupClaim: groupClaim,
              groups: _groups?.build(),
              groupsField: groupsField,
              provider: provider,
              operations: _operations?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'groups';
        _groups?.build();

        _$failedField = 'operations';
        _operations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthRule', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
