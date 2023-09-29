// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.put_rum_events_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PutRumEventsResponse extends PutRumEventsResponse {
  factory _$PutRumEventsResponse(
          [void Function(PutRumEventsResponseBuilder)? updates]) =>
      (new PutRumEventsResponseBuilder()..update(updates))._build();

  _$PutRumEventsResponse._() : super._();

  @override
  PutRumEventsResponse rebuild(
          void Function(PutRumEventsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PutRumEventsResponseBuilder toBuilder() =>
      new PutRumEventsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PutRumEventsResponse;
  }

  @override
  int get hashCode {
    return 729574421;
  }
}

class PutRumEventsResponseBuilder
    implements Builder<PutRumEventsResponse, PutRumEventsResponseBuilder> {
  _$PutRumEventsResponse? _$v;

  PutRumEventsResponseBuilder() {
    PutRumEventsResponse._init(this);
  }

  @override
  void replace(PutRumEventsResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PutRumEventsResponse;
  }

  @override
  void update(void Function(PutRumEventsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PutRumEventsResponse build() => _build();

  _$PutRumEventsResponse _build() {
    final _$result = _$v ?? new _$PutRumEventsResponse._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
