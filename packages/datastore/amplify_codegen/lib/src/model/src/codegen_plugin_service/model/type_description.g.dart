// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_description.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TypeDescription extends TypeDescription {
  @override
  final _i2.TypeDimension typeDimension;
  @override
  final _i4.BuiltList<_i3.FieldDimension>? fieldDimensions;

  factory _$TypeDescription([void Function(TypeDescriptionBuilder)? updates]) =>
      (new TypeDescriptionBuilder()..update(updates))._build();

  _$TypeDescription._({required this.typeDimension, this.fieldDimensions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        typeDimension, r'TypeDescription', 'typeDimension');
  }

  @override
  TypeDescription rebuild(void Function(TypeDescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeDescriptionBuilder toBuilder() =>
      new TypeDescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeDescription &&
        typeDimension == other.typeDimension &&
        fieldDimensions == other.fieldDimensions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, typeDimension.hashCode);
    _$hash = $jc(_$hash, fieldDimensions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class TypeDescriptionBuilder
    implements Builder<TypeDescription, TypeDescriptionBuilder> {
  _$TypeDescription? _$v;

  _i2.TypeDimension? _typeDimension;
  _i2.TypeDimension? get typeDimension => _$this._typeDimension;
  set typeDimension(_i2.TypeDimension? typeDimension) =>
      _$this._typeDimension = typeDimension;

  _i4.ListBuilder<_i3.FieldDimension>? _fieldDimensions;
  _i4.ListBuilder<_i3.FieldDimension> get fieldDimensions =>
      _$this._fieldDimensions ??= new _i4.ListBuilder<_i3.FieldDimension>();
  set fieldDimensions(_i4.ListBuilder<_i3.FieldDimension>? fieldDimensions) =>
      _$this._fieldDimensions = fieldDimensions;

  TypeDescriptionBuilder() {
    TypeDescription._init(this);
  }

  TypeDescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _typeDimension = $v.typeDimension;
      _fieldDimensions = $v.fieldDimensions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeDescription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeDescription;
  }

  @override
  void update(void Function(TypeDescriptionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeDescription build() => _build();

  _$TypeDescription _build() {
    _$TypeDescription _$result;
    try {
      _$result = _$v ??
          new _$TypeDescription._(
              typeDimension: BuiltValueNullFieldError.checkNotNull(
                  typeDimension, r'TypeDescription', 'typeDimension'),
              fieldDimensions: _fieldDimensions?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fieldDimensions';
        _fieldDimensions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TypeDescription', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
