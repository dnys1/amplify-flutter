// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.list_tags_for_resource_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListTagsForResourceResponse extends ListTagsForResourceResponse {
  @override
  final String resourceArn;
  @override
  final _i2.BuiltMap<String, String> tags;

  factory _$ListTagsForResourceResponse(
          [void Function(ListTagsForResourceResponseBuilder)? updates]) =>
      (new ListTagsForResourceResponseBuilder()..update(updates))._build();

  _$ListTagsForResourceResponse._(
      {required this.resourceArn, required this.tags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        resourceArn, r'ListTagsForResourceResponse', 'resourceArn');
    BuiltValueNullFieldError.checkNotNull(
        tags, r'ListTagsForResourceResponse', 'tags');
  }

  @override
  ListTagsForResourceResponse rebuild(
          void Function(ListTagsForResourceResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListTagsForResourceResponseBuilder toBuilder() =>
      new ListTagsForResourceResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListTagsForResourceResponse &&
        resourceArn == other.resourceArn &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, resourceArn.hashCode), tags.hashCode));
  }
}

class ListTagsForResourceResponseBuilder
    implements
        Builder<ListTagsForResourceResponse,
            ListTagsForResourceResponseBuilder> {
  _$ListTagsForResourceResponse? _$v;

  String? _resourceArn;
  String? get resourceArn => _$this._resourceArn;
  set resourceArn(String? resourceArn) => _$this._resourceArn = resourceArn;

  _i2.MapBuilder<String, String>? _tags;
  _i2.MapBuilder<String, String> get tags =>
      _$this._tags ??= new _i2.MapBuilder<String, String>();
  set tags(_i2.MapBuilder<String, String>? tags) => _$this._tags = tags;

  ListTagsForResourceResponseBuilder() {
    ListTagsForResourceResponse._init(this);
  }

  ListTagsForResourceResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _resourceArn = $v.resourceArn;
      _tags = $v.tags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListTagsForResourceResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListTagsForResourceResponse;
  }

  @override
  void update(void Function(ListTagsForResourceResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListTagsForResourceResponse build() => _build();

  _$ListTagsForResourceResponse _build() {
    _$ListTagsForResourceResponse _$result;
    try {
      _$result = _$v ??
          new _$ListTagsForResourceResponse._(
              resourceArn: BuiltValueNullFieldError.checkNotNull(
                  resourceArn, r'ListTagsForResourceResponse', 'resourceArn'),
              tags: tags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListTagsForResourceResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
