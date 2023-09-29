// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.rum_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RumEvent extends RumEvent {
  @override
  final _i2.JsonObject details;
  @override
  final String id;
  @override
  final _i2.JsonObject? metadata;
  @override
  final DateTime timestamp;
  @override
  final String type;

  factory _$RumEvent([void Function(RumEventBuilder)? updates]) =>
      (new RumEventBuilder()..update(updates))._build();

  _$RumEvent._(
      {required this.details,
      required this.id,
      this.metadata,
      required this.timestamp,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(details, r'RumEvent', 'details');
    BuiltValueNullFieldError.checkNotNull(id, r'RumEvent', 'id');
    BuiltValueNullFieldError.checkNotNull(timestamp, r'RumEvent', 'timestamp');
    BuiltValueNullFieldError.checkNotNull(type, r'RumEvent', 'type');
  }

  @override
  RumEvent rebuild(void Function(RumEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RumEventBuilder toBuilder() => new RumEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RumEvent &&
        details == other.details &&
        id == other.id &&
        metadata == other.metadata &&
        timestamp == other.timestamp &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, details.hashCode), id.hashCode), metadata.hashCode),
            timestamp.hashCode),
        type.hashCode));
  }
}

class RumEventBuilder implements Builder<RumEvent, RumEventBuilder> {
  _$RumEvent? _$v;

  _i2.JsonObject? _details;
  _i2.JsonObject? get details => _$this._details;
  set details(_i2.JsonObject? details) => _$this._details = details;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  _i2.JsonObject? _metadata;
  _i2.JsonObject? get metadata => _$this._metadata;
  set metadata(_i2.JsonObject? metadata) => _$this._metadata = metadata;

  DateTime? _timestamp;
  DateTime? get timestamp => _$this._timestamp;
  set timestamp(DateTime? timestamp) => _$this._timestamp = timestamp;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  RumEventBuilder() {
    RumEvent._init(this);
  }

  RumEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _details = $v.details;
      _id = $v.id;
      _metadata = $v.metadata;
      _timestamp = $v.timestamp;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RumEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RumEvent;
  }

  @override
  void update(void Function(RumEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RumEvent build() => _build();

  _$RumEvent _build() {
    final _$result = _$v ??
        new _$RumEvent._(
            details: BuiltValueNullFieldError.checkNotNull(
                details, r'RumEvent', 'details'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'RumEvent', 'id'),
            metadata: metadata,
            timestamp: BuiltValueNullFieldError.checkNotNull(
                timestamp, r'RumEvent', 'timestamp'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'RumEvent', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
