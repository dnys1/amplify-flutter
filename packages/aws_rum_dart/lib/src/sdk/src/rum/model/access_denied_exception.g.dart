// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.access_denied_exception;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccessDeniedException extends AccessDeniedException {
  @override
  final String message;
  @override
  final Map<String, String>? headers;

  factory _$AccessDeniedException(
          [void Function(AccessDeniedExceptionBuilder)? updates]) =>
      (new AccessDeniedExceptionBuilder()..update(updates))._build();

  _$AccessDeniedException._({required this.message, this.headers}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'AccessDeniedException', 'message');
  }

  @override
  AccessDeniedException rebuild(
          void Function(AccessDeniedExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccessDeniedExceptionBuilder toBuilder() =>
      new AccessDeniedExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccessDeniedException && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }
}

class AccessDeniedExceptionBuilder
    implements Builder<AccessDeniedException, AccessDeniedExceptionBuilder> {
  _$AccessDeniedException? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  Map<String, String>? _headers;
  Map<String, String>? get headers => _$this._headers;
  set headers(Map<String, String>? headers) => _$this._headers = headers;

  AccessDeniedExceptionBuilder() {
    AccessDeniedException._init(this);
  }

  AccessDeniedExceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _headers = $v.headers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccessDeniedException other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccessDeniedException;
  }

  @override
  void update(void Function(AccessDeniedExceptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AccessDeniedException build() => _build();

  _$AccessDeniedException _build() {
    final _$result = _$v ??
        new _$AccessDeniedException._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'AccessDeniedException', 'message'),
            headers: headers);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
