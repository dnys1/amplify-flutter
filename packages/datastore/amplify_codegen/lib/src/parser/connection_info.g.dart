// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectionInfo extends ConnectionInfo {
  @override
  final BuiltList<SchemaTypeDefinition> newTypes;
  @override
  final BuiltListMultimap<String, ModelField> newFields;
  @override
  final BuiltListMultimap<String, ModelIndex> newIndexes;
  @override
  final ModelAssociation association;

  factory _$ConnectionInfo([void Function(ConnectionInfoBuilder)? updates]) =>
      (new ConnectionInfoBuilder()..update(updates))._build();

  _$ConnectionInfo._(
      {required this.newTypes,
      required this.newFields,
      required this.newIndexes,
      required this.association})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        newTypes, r'ConnectionInfo', 'newTypes');
    BuiltValueNullFieldError.checkNotNull(
        newFields, r'ConnectionInfo', 'newFields');
    BuiltValueNullFieldError.checkNotNull(
        newIndexes, r'ConnectionInfo', 'newIndexes');
    BuiltValueNullFieldError.checkNotNull(
        association, r'ConnectionInfo', 'association');
  }

  @override
  ConnectionInfo rebuild(void Function(ConnectionInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectionInfoBuilder toBuilder() =>
      new ConnectionInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectionInfo &&
        newTypes == other.newTypes &&
        newFields == other.newFields &&
        newIndexes == other.newIndexes &&
        association == other.association;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, newTypes.hashCode);
    _$hash = $jc(_$hash, newFields.hashCode);
    _$hash = $jc(_$hash, newIndexes.hashCode);
    _$hash = $jc(_$hash, association.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectionInfo')
          ..add('newTypes', newTypes)
          ..add('newFields', newFields)
          ..add('newIndexes', newIndexes)
          ..add('association', association))
        .toString();
  }
}

class ConnectionInfoBuilder
    implements Builder<ConnectionInfo, ConnectionInfoBuilder> {
  _$ConnectionInfo? _$v;

  ListBuilder<SchemaTypeDefinition>? _newTypes;
  ListBuilder<SchemaTypeDefinition> get newTypes =>
      _$this._newTypes ??= new ListBuilder<SchemaTypeDefinition>();
  set newTypes(ListBuilder<SchemaTypeDefinition>? newTypes) =>
      _$this._newTypes = newTypes;

  ListMultimapBuilder<String, ModelField>? _newFields;
  ListMultimapBuilder<String, ModelField> get newFields =>
      _$this._newFields ??= new ListMultimapBuilder<String, ModelField>();
  set newFields(ListMultimapBuilder<String, ModelField>? newFields) =>
      _$this._newFields = newFields;

  ListMultimapBuilder<String, ModelIndex>? _newIndexes;
  ListMultimapBuilder<String, ModelIndex> get newIndexes =>
      _$this._newIndexes ??= new ListMultimapBuilder<String, ModelIndex>();
  set newIndexes(ListMultimapBuilder<String, ModelIndex>? newIndexes) =>
      _$this._newIndexes = newIndexes;

  ModelAssociationBuilder? _association;
  ModelAssociationBuilder get association =>
      _$this._association ??= new ModelAssociationBuilder();
  set association(ModelAssociationBuilder? association) =>
      _$this._association = association;

  ConnectionInfoBuilder();

  ConnectionInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _newTypes = $v.newTypes.toBuilder();
      _newFields = $v.newFields.toBuilder();
      _newIndexes = $v.newIndexes.toBuilder();
      _association = $v.association.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectionInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectionInfo;
  }

  @override
  void update(void Function(ConnectionInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectionInfo build() => _build();

  _$ConnectionInfo _build() {
    _$ConnectionInfo _$result;
    try {
      _$result = _$v ??
          new _$ConnectionInfo._(
              newTypes: newTypes.build(),
              newFields: newFields.build(),
              newIndexes: newIndexes.build(),
              association: association.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newTypes';
        newTypes.build();
        _$failedField = 'newFields';
        newFields.build();
        _$failedField = 'newIndexes';
        newIndexes.build();
        _$failedField = 'association';
        association.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectionInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
