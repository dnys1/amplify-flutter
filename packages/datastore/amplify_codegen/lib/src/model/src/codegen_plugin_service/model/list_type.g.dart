// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.list_type;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListType extends ListType {
  @override
  final bool isRequired;
  @override
  final _i2.SchemaType ofType;

  factory _$ListType([void Function(ListTypeBuilder)? updates]) =>
      (new ListTypeBuilder()..update(updates))._build();

  _$ListType._({required this.isRequired, required this.ofType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isRequired, r'ListType', 'isRequired');
    BuiltValueNullFieldError.checkNotNull(ofType, r'ListType', 'ofType');
  }

  @override
  ListType rebuild(void Function(ListTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListTypeBuilder toBuilder() => new ListTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListType &&
        isRequired == other.isRequired &&
        ofType == other.ofType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isRequired.hashCode);
    _$hash = $jc(_$hash, ofType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class ListTypeBuilder implements Builder<ListType, ListTypeBuilder> {
  _$ListType? _$v;

  bool? _isRequired;
  bool? get isRequired => _$this._isRequired;
  set isRequired(bool? isRequired) => _$this._isRequired = isRequired;

  _i2.SchemaType? _ofType;
  _i2.SchemaType? get ofType => _$this._ofType;
  set ofType(_i2.SchemaType? ofType) => _$this._ofType = ofType;

  ListTypeBuilder() {
    ListType._init(this);
  }

  ListTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isRequired = $v.isRequired;
      _ofType = $v.ofType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListType;
  }

  @override
  void update(void Function(ListTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListType build() => _build();

  _$ListType _build() {
    final _$result = _$v ??
        new _$ListType._(
            isRequired: BuiltValueNullFieldError.checkNotNull(
                isRequired, r'ListType', 'isRequired'),
            ofType: BuiltValueNullFieldError.checkNotNull(
                ofType, r'ListType', 'ofType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
