// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codegen_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CodegenRequest extends CodegenRequest {
  @override
  final String projectRoot;
  @override
  final _i3.SchemaDefinition schemaDefinition;

  factory _$CodegenRequest([void Function(CodegenRequestBuilder)? updates]) =>
      (new CodegenRequestBuilder()..update(updates))._build();

  _$CodegenRequest._(
      {required this.projectRoot, required this.schemaDefinition})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        projectRoot, r'CodegenRequest', 'projectRoot');
    BuiltValueNullFieldError.checkNotNull(
        schemaDefinition, r'CodegenRequest', 'schemaDefinition');
  }

  @override
  CodegenRequest rebuild(void Function(CodegenRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CodegenRequestBuilder toBuilder() =>
      new CodegenRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CodegenRequest &&
        projectRoot == other.projectRoot &&
        schemaDefinition == other.schemaDefinition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projectRoot.hashCode);
    _$hash = $jc(_$hash, schemaDefinition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class CodegenRequestBuilder
    implements Builder<CodegenRequest, CodegenRequestBuilder> {
  _$CodegenRequest? _$v;

  String? _projectRoot;
  String? get projectRoot => _$this._projectRoot;
  set projectRoot(String? projectRoot) => _$this._projectRoot = projectRoot;

  _i3.SchemaDefinitionBuilder? _schemaDefinition;
  _i3.SchemaDefinitionBuilder get schemaDefinition =>
      _$this._schemaDefinition ??= new _i3.SchemaDefinitionBuilder();
  set schemaDefinition(_i3.SchemaDefinitionBuilder? schemaDefinition) =>
      _$this._schemaDefinition = schemaDefinition;

  CodegenRequestBuilder() {
    CodegenRequest._init(this);
  }

  CodegenRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectRoot = $v.projectRoot;
      _schemaDefinition = $v.schemaDefinition.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CodegenRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CodegenRequest;
  }

  @override
  void update(void Function(CodegenRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CodegenRequest build() => _build();

  _$CodegenRequest _build() {
    _$CodegenRequest _$result;
    try {
      _$result = _$v ??
          new _$CodegenRequest._(
              projectRoot: BuiltValueNullFieldError.checkNotNull(
                  projectRoot, r'CodegenRequest', 'projectRoot'),
              schemaDefinition: schemaDefinition.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'schemaDefinition';
        schemaDefinition.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CodegenRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
