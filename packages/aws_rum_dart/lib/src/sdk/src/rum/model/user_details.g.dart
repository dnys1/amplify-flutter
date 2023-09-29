// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.user_details;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDetails extends UserDetails {
  @override
  final String? sessionId;
  @override
  final String? userId;

  factory _$UserDetails([void Function(UserDetailsBuilder)? updates]) =>
      (new UserDetailsBuilder()..update(updates))._build();

  _$UserDetails._({this.sessionId, this.userId}) : super._();

  @override
  UserDetails rebuild(void Function(UserDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailsBuilder toBuilder() => new UserDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetails &&
        sessionId == other.sessionId &&
        userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sessionId.hashCode), userId.hashCode));
  }
}

class UserDetailsBuilder implements Builder<UserDetails, UserDetailsBuilder> {
  _$UserDetails? _$v;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  UserDetailsBuilder() {
    UserDetails._init(this);
  }

  UserDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionId = $v.sessionId;
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDetails;
  }

  @override
  void update(void Function(UserDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDetails build() => _build();

  _$UserDetails _build() {
    final _$result =
        _$v ?? new _$UserDetails._(sessionId: sessionId, userId: userId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
