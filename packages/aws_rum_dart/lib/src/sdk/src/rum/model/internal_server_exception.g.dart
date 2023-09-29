// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.internal_server_exception;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InternalServerException extends InternalServerException {
  @override
  final String message;
  @override
  final int? retryAfterSeconds;
  @override
  final Map<String, String>? headers;

  factory _$InternalServerException(
          [void Function(InternalServerExceptionBuilder)? updates]) =>
      (new InternalServerExceptionBuilder()..update(updates))._build();

  _$InternalServerException._(
      {required this.message, this.retryAfterSeconds, this.headers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'InternalServerException', 'message');
  }

  @override
  InternalServerException rebuild(
          void Function(InternalServerExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InternalServerExceptionBuilder toBuilder() =>
      new InternalServerExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InternalServerException &&
        message == other.message &&
        retryAfterSeconds == other.retryAfterSeconds;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), retryAfterSeconds.hashCode));
  }
}

class InternalServerExceptionBuilder
    implements
        Builder<InternalServerException, InternalServerExceptionBuilder> {
  _$InternalServerException? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _retryAfterSeconds;
  int? get retryAfterSeconds => _$this._retryAfterSeconds;
  set retryAfterSeconds(int? retryAfterSeconds) =>
      _$this._retryAfterSeconds = retryAfterSeconds;

  Map<String, String>? _headers;
  Map<String, String>? get headers => _$this._headers;
  set headers(Map<String, String>? headers) => _$this._headers = headers;

  InternalServerExceptionBuilder() {
    InternalServerException._init(this);
  }

  InternalServerExceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _retryAfterSeconds = $v.retryAfterSeconds;
      _headers = $v.headers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InternalServerException other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InternalServerException;
  }

  @override
  void update(void Function(InternalServerExceptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InternalServerException build() => _build();

  _$InternalServerException _build() {
    final _$result = _$v ??
        new _$InternalServerException._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'InternalServerException', 'message'),
            retryAfterSeconds: retryAfterSeconds,
            headers: headers);
    replace(_$result);
    return _$result;
  }
}

class _$InternalServerExceptionPayload extends InternalServerExceptionPayload {
  @override
  final String message;

  factory _$InternalServerExceptionPayload(
          [void Function(InternalServerExceptionPayloadBuilder)? updates]) =>
      (new InternalServerExceptionPayloadBuilder()..update(updates))._build();

  _$InternalServerExceptionPayload._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'InternalServerExceptionPayload', 'message');
  }

  @override
  InternalServerExceptionPayload rebuild(
          void Function(InternalServerExceptionPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InternalServerExceptionPayloadBuilder toBuilder() =>
      new InternalServerExceptionPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InternalServerExceptionPayload && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }
}

class InternalServerExceptionPayloadBuilder
    implements
        Builder<InternalServerExceptionPayload,
            InternalServerExceptionPayloadBuilder> {
  _$InternalServerExceptionPayload? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  InternalServerExceptionPayloadBuilder() {
    InternalServerExceptionPayload._init(this);
  }

  InternalServerExceptionPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InternalServerExceptionPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InternalServerExceptionPayload;
  }

  @override
  void update(void Function(InternalServerExceptionPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InternalServerExceptionPayload build() => _build();

  _$InternalServerExceptionPayload _build() {
    final _$result = _$v ??
        new _$InternalServerExceptionPayload._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'InternalServerExceptionPayload', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
