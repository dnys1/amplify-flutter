// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.put_rum_events_request;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PutRumEventsRequest extends PutRumEventsRequest {
  @override
  final _i3.AppMonitorDetails appMonitorDetails;
  @override
  final String batchId;
  @override
  final String id;
  @override
  final _i4.BuiltList<_i5.RumEvent> rumEvents;
  @override
  final _i6.UserDetails userDetails;

  factory _$PutRumEventsRequest(
          [void Function(PutRumEventsRequestBuilder)? updates]) =>
      (new PutRumEventsRequestBuilder()..update(updates))._build();

  _$PutRumEventsRequest._(
      {required this.appMonitorDetails,
      required this.batchId,
      required this.id,
      required this.rumEvents,
      required this.userDetails})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appMonitorDetails, r'PutRumEventsRequest', 'appMonitorDetails');
    BuiltValueNullFieldError.checkNotNull(
        batchId, r'PutRumEventsRequest', 'batchId');
    BuiltValueNullFieldError.checkNotNull(id, r'PutRumEventsRequest', 'id');
    BuiltValueNullFieldError.checkNotNull(
        rumEvents, r'PutRumEventsRequest', 'rumEvents');
    BuiltValueNullFieldError.checkNotNull(
        userDetails, r'PutRumEventsRequest', 'userDetails');
  }

  @override
  PutRumEventsRequest rebuild(
          void Function(PutRumEventsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PutRumEventsRequestBuilder toBuilder() =>
      new PutRumEventsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PutRumEventsRequest &&
        appMonitorDetails == other.appMonitorDetails &&
        batchId == other.batchId &&
        id == other.id &&
        rumEvents == other.rumEvents &&
        userDetails == other.userDetails;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, appMonitorDetails.hashCode), batchId.hashCode),
                id.hashCode),
            rumEvents.hashCode),
        userDetails.hashCode));
  }
}

class PutRumEventsRequestBuilder
    implements Builder<PutRumEventsRequest, PutRumEventsRequestBuilder> {
  _$PutRumEventsRequest? _$v;

  _i3.AppMonitorDetailsBuilder? _appMonitorDetails;
  _i3.AppMonitorDetailsBuilder get appMonitorDetails =>
      _$this._appMonitorDetails ??= new _i3.AppMonitorDetailsBuilder();
  set appMonitorDetails(_i3.AppMonitorDetailsBuilder? appMonitorDetails) =>
      _$this._appMonitorDetails = appMonitorDetails;

  String? _batchId;
  String? get batchId => _$this._batchId;
  set batchId(String? batchId) => _$this._batchId = batchId;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i4.ListBuilder<_i5.RumEvent>? _rumEvents;
  _i4.ListBuilder<_i5.RumEvent> get rumEvents =>
      _$this._rumEvents ??= new _i4.ListBuilder<_i5.RumEvent>();
  set rumEvents(_i4.ListBuilder<_i5.RumEvent>? rumEvents) =>
      _$this._rumEvents = rumEvents;

  _i6.UserDetailsBuilder? _userDetails;
  _i6.UserDetailsBuilder get userDetails =>
      _$this._userDetails ??= new _i6.UserDetailsBuilder();
  set userDetails(_i6.UserDetailsBuilder? userDetails) =>
      _$this._userDetails = userDetails;

  PutRumEventsRequestBuilder() {
    PutRumEventsRequest._init(this);
  }

  PutRumEventsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appMonitorDetails = $v.appMonitorDetails.toBuilder();
      _batchId = $v.batchId;
      _id = $v.id;
      _rumEvents = $v.rumEvents.toBuilder();
      _userDetails = $v.userDetails.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PutRumEventsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PutRumEventsRequest;
  }

  @override
  void update(void Function(PutRumEventsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PutRumEventsRequest build() => _build();

  _$PutRumEventsRequest _build() {
    _$PutRumEventsRequest _$result;
    try {
      _$result = _$v ??
          new _$PutRumEventsRequest._(
              appMonitorDetails: appMonitorDetails.build(),
              batchId: BuiltValueNullFieldError.checkNotNull(
                  batchId, r'PutRumEventsRequest', 'batchId'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'PutRumEventsRequest', 'id'),
              rumEvents: rumEvents.build(),
              userDetails: userDetails.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'appMonitorDetails';
        appMonitorDetails.build();

        _$failedField = 'rumEvents';
        rumEvents.build();
        _$failedField = 'userDetails';
        userDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PutRumEventsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PutRumEventsRequestPayload extends PutRumEventsRequestPayload {
  @override
  final _i3.AppMonitorDetails appMonitorDetails;
  @override
  final String batchId;
  @override
  final _i4.BuiltList<_i5.RumEvent> rumEvents;
  @override
  final _i6.UserDetails userDetails;

  factory _$PutRumEventsRequestPayload(
          [void Function(PutRumEventsRequestPayloadBuilder)? updates]) =>
      (new PutRumEventsRequestPayloadBuilder()..update(updates))._build();

  _$PutRumEventsRequestPayload._(
      {required this.appMonitorDetails,
      required this.batchId,
      required this.rumEvents,
      required this.userDetails})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appMonitorDetails, r'PutRumEventsRequestPayload', 'appMonitorDetails');
    BuiltValueNullFieldError.checkNotNull(
        batchId, r'PutRumEventsRequestPayload', 'batchId');
    BuiltValueNullFieldError.checkNotNull(
        rumEvents, r'PutRumEventsRequestPayload', 'rumEvents');
    BuiltValueNullFieldError.checkNotNull(
        userDetails, r'PutRumEventsRequestPayload', 'userDetails');
  }

  @override
  PutRumEventsRequestPayload rebuild(
          void Function(PutRumEventsRequestPayloadBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PutRumEventsRequestPayloadBuilder toBuilder() =>
      new PutRumEventsRequestPayloadBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PutRumEventsRequestPayload &&
        appMonitorDetails == other.appMonitorDetails &&
        batchId == other.batchId &&
        rumEvents == other.rumEvents &&
        userDetails == other.userDetails;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, appMonitorDetails.hashCode), batchId.hashCode),
            rumEvents.hashCode),
        userDetails.hashCode));
  }
}

class PutRumEventsRequestPayloadBuilder
    implements
        Builder<PutRumEventsRequestPayload, PutRumEventsRequestPayloadBuilder> {
  _$PutRumEventsRequestPayload? _$v;

  _i3.AppMonitorDetailsBuilder? _appMonitorDetails;
  _i3.AppMonitorDetailsBuilder get appMonitorDetails =>
      _$this._appMonitorDetails ??= new _i3.AppMonitorDetailsBuilder();
  set appMonitorDetails(_i3.AppMonitorDetailsBuilder? appMonitorDetails) =>
      _$this._appMonitorDetails = appMonitorDetails;

  String? _batchId;
  String? get batchId => _$this._batchId;
  set batchId(String? batchId) => _$this._batchId = batchId;

  _i4.ListBuilder<_i5.RumEvent>? _rumEvents;
  _i4.ListBuilder<_i5.RumEvent> get rumEvents =>
      _$this._rumEvents ??= new _i4.ListBuilder<_i5.RumEvent>();
  set rumEvents(_i4.ListBuilder<_i5.RumEvent>? rumEvents) =>
      _$this._rumEvents = rumEvents;

  _i6.UserDetailsBuilder? _userDetails;
  _i6.UserDetailsBuilder get userDetails =>
      _$this._userDetails ??= new _i6.UserDetailsBuilder();
  set userDetails(_i6.UserDetailsBuilder? userDetails) =>
      _$this._userDetails = userDetails;

  PutRumEventsRequestPayloadBuilder() {
    PutRumEventsRequestPayload._init(this);
  }

  PutRumEventsRequestPayloadBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appMonitorDetails = $v.appMonitorDetails.toBuilder();
      _batchId = $v.batchId;
      _rumEvents = $v.rumEvents.toBuilder();
      _userDetails = $v.userDetails.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PutRumEventsRequestPayload other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PutRumEventsRequestPayload;
  }

  @override
  void update(void Function(PutRumEventsRequestPayloadBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PutRumEventsRequestPayload build() => _build();

  _$PutRumEventsRequestPayload _build() {
    _$PutRumEventsRequestPayload _$result;
    try {
      _$result = _$v ??
          new _$PutRumEventsRequestPayload._(
              appMonitorDetails: appMonitorDetails.build(),
              batchId: BuiltValueNullFieldError.checkNotNull(
                  batchId, r'PutRumEventsRequestPayload', 'batchId'),
              rumEvents: rumEvents.build(),
              userDetails: userDetails.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'appMonitorDetails';
        appMonitorDetails.build();

        _$failedField = 'rumEvents';
        rumEvents.build();
        _$failedField = 'userDetails';
        userDetails.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PutRumEventsRequestPayload', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
