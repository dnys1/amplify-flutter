// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_schema_matrix.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestSchemaMatrix extends TestSchemaMatrix {
  @override
  final _i5.BuiltList<_i3.SchemaDimension> dimensions;
  @override
  final _i5.BuiltList<_i4.SchemaDescription>? include;

  factory _$TestSchemaMatrix(
          [void Function(TestSchemaMatrixBuilder)? updates]) =>
      (new TestSchemaMatrixBuilder()..update(updates))._build();

  _$TestSchemaMatrix._({required this.dimensions, this.include}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dimensions, r'TestSchemaMatrix', 'dimensions');
  }

  @override
  TestSchemaMatrix rebuild(void Function(TestSchemaMatrixBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestSchemaMatrixBuilder toBuilder() =>
      new TestSchemaMatrixBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestSchemaMatrix &&
        dimensions == other.dimensions &&
        include == other.include;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dimensions.hashCode);
    _$hash = $jc(_$hash, include.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class TestSchemaMatrixBuilder
    implements Builder<TestSchemaMatrix, TestSchemaMatrixBuilder> {
  _$TestSchemaMatrix? _$v;

  _i5.ListBuilder<_i3.SchemaDimension>? _dimensions;
  _i5.ListBuilder<_i3.SchemaDimension> get dimensions =>
      _$this._dimensions ??= new _i5.ListBuilder<_i3.SchemaDimension>();
  set dimensions(_i5.ListBuilder<_i3.SchemaDimension>? dimensions) =>
      _$this._dimensions = dimensions;

  _i5.ListBuilder<_i4.SchemaDescription>? _include;
  _i5.ListBuilder<_i4.SchemaDescription> get include =>
      _$this._include ??= new _i5.ListBuilder<_i4.SchemaDescription>();
  set include(_i5.ListBuilder<_i4.SchemaDescription>? include) =>
      _$this._include = include;

  TestSchemaMatrixBuilder() {
    TestSchemaMatrix._init(this);
  }

  TestSchemaMatrixBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dimensions = $v.dimensions.toBuilder();
      _include = $v.include?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestSchemaMatrix other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestSchemaMatrix;
  }

  @override
  void update(void Function(TestSchemaMatrixBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestSchemaMatrix build() => _build();

  _$TestSchemaMatrix _build() {
    _$TestSchemaMatrix _$result;
    try {
      _$result = _$v ??
          new _$TestSchemaMatrix._(
              dimensions: dimensions.build(), include: _include?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'dimensions';
        dimensions.build();
        _$failedField = 'include';
        _include?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TestSchemaMatrix', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
