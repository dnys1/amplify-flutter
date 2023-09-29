// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.tag_resource_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TagResourceResponse extends TagResourceResponse {
  factory _$TagResourceResponse(
          [void Function(TagResourceResponseBuilder)? updates]) =>
      (new TagResourceResponseBuilder()..update(updates))._build();

  _$TagResourceResponse._() : super._();

  @override
  TagResourceResponse rebuild(
          void Function(TagResourceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagResourceResponseBuilder toBuilder() =>
      new TagResourceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagResourceResponse;
  }

  @override
  int get hashCode {
    return 296797815;
  }
}

class TagResourceResponseBuilder
    implements Builder<TagResourceResponse, TagResourceResponseBuilder> {
  _$TagResourceResponse? _$v;

  TagResourceResponseBuilder() {
    TagResourceResponse._init(this);
  }

  @override
  void replace(TagResourceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TagResourceResponse;
  }

  @override
  void update(void Function(TagResourceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagResourceResponse build() => _build();

  _$TagResourceResponse _build() {
    final _$result = _$v ?? new _$TagResourceResponse._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
