// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.throttling_exception;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ThrottlingException extends ThrottlingException {
  @override
  final String message;
  @override
  final String? quotaCode;
  @override
  final int? retryAfterSeconds;
  @override
  final String? serviceCode;
  @override
  final Map<String, String>? headers;

  factory _$ThrottlingException(
          [void Function(ThrottlingExceptionBuilder)? updates]) =>
      (new ThrottlingExceptionBuilder()..update(updates))._build();

  _$ThrottlingException._(
      {required this.message,
      this.quotaCode,
      this.retryAfterSeconds,
      this.serviceCode,
      this.headers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'ThrottlingException', 'message');
  }

  @override
  ThrottlingException rebuild(
          void Function(ThrottlingExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThrottlingExceptionBuilder toBuilder() =>
      new ThrottlingExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThrottlingException &&
        message == other.message &&
        quotaCode == other.quotaCode &&
        retryAfterSeconds == other.retryAfterSeconds &&
        serviceCode == other.serviceCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), quotaCode.hashCode),
            retryAfterSeconds.hashCode),
        serviceCode.hashCode));
  }
}

class ThrottlingExceptionBuilder
    implements Builder<ThrottlingException, ThrottlingExceptionBuilder> {
  _$ThrottlingException? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _quotaCode;
  String? get quotaCode => _$this._quotaCode;
  set quotaCode(String? quotaCode) => _$this._quotaCode = quotaCode;

  int? _retryAfterSeconds;
  int? get retryAfterSeconds => _$this._retryAfterSeconds;
  set retryAfterSeconds(int? retryAfterSeconds) =>
      _$this._retryAfterSeconds = retryAfterSeconds;

  String? _serviceCode;
  String? get serviceCode => _$this._serviceCode;
  set serviceCode(String? serviceCode) => _$this._serviceCode = serviceCode;

  Map<String, String>? _headers;
  Map<String, String>? get headers => _$this._headers;
  set headers(Map<String, String>? headers) => _$this._headers = headers;

  ThrottlingExceptionBuilder() {
    ThrottlingException._init(this);
  }

  ThrottlingExceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _quotaCode = $v.quotaCode;
      _retryAfterSeconds = $v.retryAfterSeconds;
      _serviceCode = $v.serviceCode;
      _headers = $v.headers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThrottlingException other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThrottlingException;
  }

  @override
  void update(void Function(ThrottlingExceptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThrottlingException build() => _build();

  _$ThrottlingException _build() {
    final _$result = _$v ??
        new _$ThrottlingException._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ThrottlingException', 'message'),
            quotaCode: quotaCode,
            retryAfterSeconds: retryAfterSeconds,
            serviceCode: serviceCode,
            headers: headers);
    replace(_$result);
    return _$result;
  }
}

class _$ThrottlingExceptionPayload extends ThrottlingExceptionPayload {
  @override
  final String message;
  @override
  final String? quotaCode;
  @override
  final String? serviceCode;

  factory _$ThrottlingExceptionPayload(
          [void Function(ThrottlingExceptionPayloadBuilder)? updates]) =>
      (new ThrottlingExceptionPayloadBuilder()..update(updates))._build();

  _$ThrottlingExceptionPayload._(
      {required this.message, this.quotaCode, this.serviceCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'ThrottlingExceptionPayload', 'message');
  }

  @override
  ThrottlingExceptionPayload rebuild(
          void Function(ThrottlingExceptionPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThrottlingExceptionPayloadBuilder toBuilder() =>
      new ThrottlingExceptionPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThrottlingExceptionPayload &&
        message == other.message &&
        quotaCode == other.quotaCode &&
        serviceCode == other.serviceCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, message.hashCode), quotaCode.hashCode),
        serviceCode.hashCode));
  }
}

class ThrottlingExceptionPayloadBuilder
    implements
        Builder<ThrottlingExceptionPayload, ThrottlingExceptionPayloadBuilder> {
  _$ThrottlingExceptionPayload? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _quotaCode;
  String? get quotaCode => _$this._quotaCode;
  set quotaCode(String? quotaCode) => _$this._quotaCode = quotaCode;

  String? _serviceCode;
  String? get serviceCode => _$this._serviceCode;
  set serviceCode(String? serviceCode) => _$this._serviceCode = serviceCode;

  ThrottlingExceptionPayloadBuilder() {
    ThrottlingExceptionPayload._init(this);
  }

  ThrottlingExceptionPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _quotaCode = $v.quotaCode;
      _serviceCode = $v.serviceCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThrottlingExceptionPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThrottlingExceptionPayload;
  }

  @override
  void update(void Function(ThrottlingExceptionPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ThrottlingExceptionPayload build() => _build();

  _$ThrottlingExceptionPayload _build() {
    final _$result = _$v ??
        new _$ThrottlingExceptionPayload._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'ThrottlingExceptionPayload', 'message'),
            quotaCode: quotaCode,
            serviceCode: serviceCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
