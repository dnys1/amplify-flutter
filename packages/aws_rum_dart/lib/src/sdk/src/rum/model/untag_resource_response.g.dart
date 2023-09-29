// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.untag_resource_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UntagResourceResponse extends UntagResourceResponse {
  factory _$UntagResourceResponse(
          [void Function(UntagResourceResponseBuilder)? updates]) =>
      (new UntagResourceResponseBuilder()..update(updates))._build();

  _$UntagResourceResponse._() : super._();

  @override
  UntagResourceResponse rebuild(
          void Function(UntagResourceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UntagResourceResponseBuilder toBuilder() =>
      new UntagResourceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UntagResourceResponse;
  }

  @override
  int get hashCode {
    return 9940562;
  }
}

class UntagResourceResponseBuilder
    implements Builder<UntagResourceResponse, UntagResourceResponseBuilder> {
  _$UntagResourceResponse? _$v;

  UntagResourceResponseBuilder() {
    UntagResourceResponse._init(this);
  }

  @override
  void replace(UntagResourceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UntagResourceResponse;
  }

  @override
  void update(void Function(UntagResourceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UntagResourceResponse build() => _build();

  _$UntagResourceResponse _build() {
    final _$result = _$v ?? new _$UntagResourceResponse._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
