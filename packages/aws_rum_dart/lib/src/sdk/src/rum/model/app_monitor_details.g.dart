// GENERATED CODE - DO NOT MODIFY BY HAND

part of aws_rum_dart.rum.model.app_monitor_details;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppMonitorDetails extends AppMonitorDetails {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? version;

  factory _$AppMonitorDetails(
          [void Function(AppMonitorDetailsBuilder)? updates]) =>
      (new AppMonitorDetailsBuilder()..update(updates))._build();

  _$AppMonitorDetails._({this.id, this.name, this.version}) : super._();

  @override
  AppMonitorDetails rebuild(void Function(AppMonitorDetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppMonitorDetailsBuilder toBuilder() =>
      new AppMonitorDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppMonitorDetails &&
        id == other.id &&
        name == other.name &&
        version == other.version;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), version.hashCode));
  }
}

class AppMonitorDetailsBuilder
    implements Builder<AppMonitorDetails, AppMonitorDetailsBuilder> {
  _$AppMonitorDetails? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _version;
  String? get version => _$this._version;
  set version(String? version) => _$this._version = version;

  AppMonitorDetailsBuilder() {
    AppMonitorDetails._init(this);
  }

  AppMonitorDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppMonitorDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppMonitorDetails;
  }

  @override
  void update(void Function(AppMonitorDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppMonitorDetails build() => _build();

  _$AppMonitorDetails _build() {
    final _$result =
        _$v ?? new _$AppMonitorDetails._(id: id, name: name, version: version);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
