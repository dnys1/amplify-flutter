// GENERATED CODE - DO NOT MODIFY BY HAND

part of amplify_codegen.codegen_plugin_service.model.codegen_error;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CodegenError extends CodegenError {
  @override
  final String? message;
  @override
  final Map<String, String>? headers;

  factory _$CodegenError([void Function(CodegenErrorBuilder)? updates]) =>
      (new CodegenErrorBuilder()..update(updates))._build();

  _$CodegenError._({this.message, this.headers}) : super._();

  @override
  CodegenError rebuild(void Function(CodegenErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CodegenErrorBuilder toBuilder() => new CodegenErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CodegenError && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class CodegenErrorBuilder
    implements Builder<CodegenError, CodegenErrorBuilder> {
  _$CodegenError? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  Map<String, String>? _headers;
  Map<String, String>? get headers => _$this._headers;
  set headers(Map<String, String>? headers) => _$this._headers = headers;

  CodegenErrorBuilder() {
    CodegenError._init(this);
  }

  CodegenErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _headers = $v.headers;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CodegenError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CodegenError;
  }

  @override
  void update(void Function(CodegenErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CodegenError build() => _build();

  _$CodegenError _build() {
    final _$result =
        _$v ?? new _$CodegenError._(message: message, headers: headers);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
