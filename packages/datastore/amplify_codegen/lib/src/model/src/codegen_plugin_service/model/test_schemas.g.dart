// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_schemas.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TestSchemas extends TestSchemas {
  @override
  final _i3.BuiltList<_i2.GeneratedSchema> generatedSchemas;

  factory _$TestSchemas([void Function(TestSchemasBuilder)? updates]) =>
      (new TestSchemasBuilder()..update(updates))._build();

  _$TestSchemas._({required this.generatedSchemas}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        generatedSchemas, r'TestSchemas', 'generatedSchemas');
  }

  @override
  TestSchemas rebuild(void Function(TestSchemasBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestSchemasBuilder toBuilder() => new TestSchemasBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TestSchemas && generatedSchemas == other.generatedSchemas;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, generatedSchemas.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class TestSchemasBuilder implements Builder<TestSchemas, TestSchemasBuilder> {
  _$TestSchemas? _$v;

  _i3.ListBuilder<_i2.GeneratedSchema>? _generatedSchemas;
  _i3.ListBuilder<_i2.GeneratedSchema> get generatedSchemas =>
      _$this._generatedSchemas ??= new _i3.ListBuilder<_i2.GeneratedSchema>();
  set generatedSchemas(
          _i3.ListBuilder<_i2.GeneratedSchema>? generatedSchemas) =>
      _$this._generatedSchemas = generatedSchemas;

  TestSchemasBuilder() {
    TestSchemas._init(this);
  }

  TestSchemasBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _generatedSchemas = $v.generatedSchemas.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TestSchemas other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TestSchemas;
  }

  @override
  void update(void Function(TestSchemasBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TestSchemas build() => _build();

  _$TestSchemas _build() {
    _$TestSchemas _$result;
    try {
      _$result = _$v ??
          new _$TestSchemas._(generatedSchemas: generatedSchemas.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'generatedSchemas';
        generatedSchemas.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TestSchemas', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
