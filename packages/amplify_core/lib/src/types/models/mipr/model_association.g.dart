// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_association.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ModelAssociationType _$hasOne = const ModelAssociationType._('hasOne');
const ModelAssociationType _$hasMany = const ModelAssociationType._('hasMany');
const ModelAssociationType _$belongsTo =
    const ModelAssociationType._('belongsTo');
const ModelAssociationType _$manyToMany =
    const ModelAssociationType._('manyToMany');

ModelAssociationType _$ModelAssociationTypeValueOf(String name) {
  switch (name) {
    case 'hasOne':
      return _$hasOne;
    case 'hasMany':
      return _$hasMany;
    case 'belongsTo':
      return _$belongsTo;
    case 'manyToMany':
      return _$manyToMany;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ModelAssociationType> _$ModelAssociationTypeValues =
    new BuiltSet<ModelAssociationType>(const <ModelAssociationType>[
  _$hasOne,
  _$hasMany,
  _$belongsTo,
  _$manyToMany,
]);

Serializer<ModelAssociationType> _$modelAssociationTypeSerializer =
    new _$ModelAssociationTypeSerializer();
Serializer<ModelAssociation> _$modelAssociationSerializer =
    new _$ModelAssociationSerializer();

class _$ModelAssociationTypeSerializer
    implements PrimitiveSerializer<ModelAssociationType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'hasOne': 'HasOne',
    'hasMany': 'HasMany',
    'belongsTo': 'BelongsTo',
    'manyToMany': 'ManyToMany',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'HasOne': 'hasOne',
    'HasMany': 'hasMany',
    'BelongsTo': 'belongsTo',
    'ManyToMany': 'manyToMany',
  };

  @override
  final Iterable<Type> types = const <Type>[ModelAssociationType];
  @override
  final String wireName = 'ModelAssociationType';

  @override
  Object serialize(Serializers serializers, ModelAssociationType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ModelAssociationType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ModelAssociationType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ModelAssociationSerializer
    implements StructuredSerializer<ModelAssociation> {
  @override
  final Iterable<Type> types = const [ModelAssociation, _$ModelAssociation];
  @override
  final String wireName = 'ModelAssociation';

  @override
  Iterable<Object?> serialize(Serializers serializers, ModelAssociation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'associationType',
      serializers.serialize(object.associationType,
          specifiedType: const FullType(ModelAssociationType)),
      'associatedType',
      serializers.serialize(object.associatedType,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.associatedFields;
    if (value != null) {
      result
        ..add('associatedFields')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.targetNames;
    if (value != null) {
      result
        ..add('targetNames')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ModelAssociation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModelAssociationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'associationType':
          result.associationType = serializers.deserialize(value,
                  specifiedType: const FullType(ModelAssociationType))!
              as ModelAssociationType;
          break;
        case 'associatedType':
          result.associatedType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'associatedFields':
          result.associatedFields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'targetNames':
          result.targetNames.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ModelAssociation extends ModelAssociation {
  @override
  final ModelAssociationType associationType;
  @override
  final String associatedType;
  @override
  final BuiltList<String>? associatedFields;
  @override
  final BuiltList<String>? targetNames;

  factory _$ModelAssociation(
          [void Function(ModelAssociationBuilder)? updates]) =>
      (new ModelAssociationBuilder()..update(updates))._build();

  _$ModelAssociation._(
      {required this.associationType,
      required this.associatedType,
      this.associatedFields,
      this.targetNames})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        associationType, r'ModelAssociation', 'associationType');
    BuiltValueNullFieldError.checkNotNull(
        associatedType, r'ModelAssociation', 'associatedType');
  }

  @override
  ModelAssociation rebuild(void Function(ModelAssociationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelAssociationBuilder toBuilder() =>
      new ModelAssociationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelAssociation &&
        associationType == other.associationType &&
        associatedType == other.associatedType &&
        associatedFields == other.associatedFields &&
        targetNames == other.targetNames;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, associationType.hashCode), associatedType.hashCode),
            associatedFields.hashCode),
        targetNames.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ModelAssociation')
          ..add('associationType', associationType)
          ..add('associatedType', associatedType)
          ..add('associatedFields', associatedFields)
          ..add('targetNames', targetNames))
        .toString();
  }
}

class ModelAssociationBuilder
    implements Builder<ModelAssociation, ModelAssociationBuilder> {
  _$ModelAssociation? _$v;

  ModelAssociationType? _associationType;
  ModelAssociationType? get associationType => _$this._associationType;
  set associationType(ModelAssociationType? associationType) =>
      _$this._associationType = associationType;

  String? _associatedType;
  String? get associatedType => _$this._associatedType;
  set associatedType(String? associatedType) =>
      _$this._associatedType = associatedType;

  ListBuilder<String>? _associatedFields;
  ListBuilder<String> get associatedFields =>
      _$this._associatedFields ??= new ListBuilder<String>();
  set associatedFields(ListBuilder<String>? associatedFields) =>
      _$this._associatedFields = associatedFields;

  ListBuilder<String>? _targetNames;
  ListBuilder<String> get targetNames =>
      _$this._targetNames ??= new ListBuilder<String>();
  set targetNames(ListBuilder<String>? targetNames) =>
      _$this._targetNames = targetNames;

  ModelAssociationBuilder();

  ModelAssociationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _associationType = $v.associationType;
      _associatedType = $v.associatedType;
      _associatedFields = $v.associatedFields?.toBuilder();
      _targetNames = $v.targetNames?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelAssociation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ModelAssociation;
  }

  @override
  void update(void Function(ModelAssociationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ModelAssociation build() => _build();

  _$ModelAssociation _build() {
    _$ModelAssociation _$result;
    try {
      _$result = _$v ??
          new _$ModelAssociation._(
              associationType: BuiltValueNullFieldError.checkNotNull(
                  associationType, r'ModelAssociation', 'associationType'),
              associatedType: BuiltValueNullFieldError.checkNotNull(
                  associatedType, r'ModelAssociation', 'associatedType'),
              associatedFields: _associatedFields?.build(),
              targetNames: _targetNames?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'associatedFields';
        _associatedFields?.build();
        _$failedField = 'targetNames';
        _targetNames?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ModelAssociation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
