// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amplify_logging_constraints.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AmplifyLoggingConstraints extends AmplifyLoggingConstraints {
  @override
  final LogLevel defaultLogLevel;
  @override
  final _i2.BuiltMap<Category, LogLevel> categoryLogLevel;
  @override
  final _i2.BuiltMap<String, UserLogLevel> userLogLevel;

  factory _$AmplifyLoggingConstraints(
          [void Function(AmplifyLoggingConstraintsBuilder)? updates]) =>
      (new AmplifyLoggingConstraintsBuilder()..update(updates))._build();

  _$AmplifyLoggingConstraints._(
      {required this.defaultLogLevel,
      required this.categoryLogLevel,
      required this.userLogLevel})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        defaultLogLevel, r'AmplifyLoggingConstraints', 'defaultLogLevel');
    BuiltValueNullFieldError.checkNotNull(
        categoryLogLevel, r'AmplifyLoggingConstraints', 'categoryLogLevel');
    BuiltValueNullFieldError.checkNotNull(
        userLogLevel, r'AmplifyLoggingConstraints', 'userLogLevel');
  }

  @override
  AmplifyLoggingConstraints rebuild(
          void Function(AmplifyLoggingConstraintsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmplifyLoggingConstraintsBuilder toBuilder() =>
      new AmplifyLoggingConstraintsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AmplifyLoggingConstraints &&
        defaultLogLevel == other.defaultLogLevel &&
        categoryLogLevel == other.categoryLogLevel &&
        userLogLevel == other.userLogLevel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, defaultLogLevel.hashCode);
    _$hash = $jc(_$hash, categoryLogLevel.hashCode);
    _$hash = $jc(_$hash, userLogLevel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class AmplifyLoggingConstraintsBuilder
    implements
        Builder<AmplifyLoggingConstraints, AmplifyLoggingConstraintsBuilder> {
  _$AmplifyLoggingConstraints? _$v;

  LogLevel? _defaultLogLevel;
  LogLevel? get defaultLogLevel => _$this._defaultLogLevel;
  set defaultLogLevel(LogLevel? defaultLogLevel) =>
      _$this._defaultLogLevel = defaultLogLevel;

  _i2.MapBuilder<Category, LogLevel>? _categoryLogLevel;
  _i2.MapBuilder<Category, LogLevel> get categoryLogLevel =>
      _$this._categoryLogLevel ??= new _i2.MapBuilder<Category, LogLevel>();
  set categoryLogLevel(_i2.MapBuilder<Category, LogLevel>? categoryLogLevel) =>
      _$this._categoryLogLevel = categoryLogLevel;

  _i2.MapBuilder<String, UserLogLevel>? _userLogLevel;
  _i2.MapBuilder<String, UserLogLevel> get userLogLevel =>
      _$this._userLogLevel ??= new _i2.MapBuilder<String, UserLogLevel>();
  set userLogLevel(_i2.MapBuilder<String, UserLogLevel>? userLogLevel) =>
      _$this._userLogLevel = userLogLevel;

  AmplifyLoggingConstraintsBuilder() {
    AmplifyLoggingConstraints._init(this);
  }

  AmplifyLoggingConstraintsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _defaultLogLevel = $v.defaultLogLevel;
      _categoryLogLevel = $v.categoryLogLevel.toBuilder();
      _userLogLevel = $v.userLogLevel.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AmplifyLoggingConstraints other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AmplifyLoggingConstraints;
  }

  @override
  void update(void Function(AmplifyLoggingConstraintsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AmplifyLoggingConstraints build() => _build();

  _$AmplifyLoggingConstraints _build() {
    _$AmplifyLoggingConstraints _$result;
    try {
      _$result = _$v ??
          new _$AmplifyLoggingConstraints._(
              defaultLogLevel: BuiltValueNullFieldError.checkNotNull(
                  defaultLogLevel,
                  r'AmplifyLoggingConstraints',
                  'defaultLogLevel'),
              categoryLogLevel: categoryLogLevel.build(),
              userLogLevel: userLogLevel.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoryLogLevel';
        categoryLogLevel.build();
        _$failedField = 'userLogLevel';
        userLogLevel.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AmplifyLoggingConstraints', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
