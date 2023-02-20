// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structure_shape.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StructureShape> _$structureShapeSerializer =
    new _$StructureShapeSerializer();

class _$StructureShapeSerializer
    implements StructuredSerializer<StructureShape> {
  @override
  final Iterable<Type> types = const [StructureShape, _$StructureShape];
  @override
  final String wireName = 'StructureShape';

  @override
  Iterable<Object?> serialize(Serializers serializers, StructureShape object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'mixins',
      serializers.serialize(object.mixins,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ShapeRef)])),
      'members',
      serializers.serialize(object.members,
          specifiedType: const FullType(NamedMembersMap)),
      'traits',
      serializers.serialize(object.traits,
          specifiedType: const FullType(TraitMap)),
    ];

    return result;
  }

  @override
  StructureShape deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StructureShapeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mixins':
          result.mixins.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ShapeRef)]))!
              as BuiltList<Object?>);
          break;
        case 'members':
          result.members = serializers.deserialize(value,
                  specifiedType: const FullType(NamedMembersMap))!
              as NamedMembersMap;
          break;
        case 'traits':
          result.traits = serializers.deserialize(value,
              specifiedType: const FullType(TraitMap))! as TraitMap;
          break;
      }
    }

    return result.build();
  }
}

class _$StructureShape extends StructureShape {
  @override
  final BuiltList<ShapeRef> mixins;
  @override
  final NamedMembersMap members;
  @override
  final ShapeId shapeId;
  @override
  final TraitMap traits;

  factory _$StructureShape([void Function(StructureShapeBuilder)? updates]) =>
      (new StructureShapeBuilder()..update(updates))._build();

  _$StructureShape._(
      {required this.mixins,
      required this.members,
      required this.shapeId,
      required this.traits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(mixins, r'StructureShape', 'mixins');
    BuiltValueNullFieldError.checkNotNull(
        members, r'StructureShape', 'members');
    BuiltValueNullFieldError.checkNotNull(
        shapeId, r'StructureShape', 'shapeId');
    BuiltValueNullFieldError.checkNotNull(traits, r'StructureShape', 'traits');
  }

  @override
  StructureShape rebuild(void Function(StructureShapeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StructureShapeBuilder toBuilder() =>
      new StructureShapeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StructureShape &&
        mixins == other.mixins &&
        members == other.members &&
        shapeId == other.shapeId &&
        traits == other.traits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mixins.hashCode);
    _$hash = $jc(_$hash, members.hashCode);
    _$hash = $jc(_$hash, shapeId.hashCode);
    _$hash = $jc(_$hash, traits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StructureShape')
          ..add('mixins', mixins)
          ..add('members', members)
          ..add('shapeId', shapeId)
          ..add('traits', traits))
        .toString();
  }
}

class StructureShapeBuilder
    implements
        Builder<StructureShape, StructureShapeBuilder>,
        NamedMembersShapeBuilder {
  _$StructureShape? _$v;

  ListBuilder<ShapeRef>? _mixins;
  ListBuilder<ShapeRef> get mixins =>
      _$this._mixins ??= new ListBuilder<ShapeRef>();
  set mixins(covariant ListBuilder<ShapeRef>? mixins) =>
      _$this._mixins = mixins;

  NamedMembersMap? _members;
  NamedMembersMap? get members => _$this._members;
  set members(covariant NamedMembersMap? members) => _$this._members = members;

  ShapeId? _shapeId;
  ShapeId? get shapeId => _$this._shapeId;
  set shapeId(covariant ShapeId? shapeId) => _$this._shapeId = shapeId;

  TraitMap? _traits;
  TraitMap? get traits => _$this._traits;
  set traits(covariant TraitMap? traits) => _$this._traits = traits;

  StructureShapeBuilder() {
    StructureShape._init(this);
  }

  StructureShapeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mixins = $v.mixins.toBuilder();
      _members = $v.members;
      _shapeId = $v.shapeId;
      _traits = $v.traits;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant StructureShape other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StructureShape;
  }

  @override
  void update(void Function(StructureShapeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StructureShape build() => _build();

  _$StructureShape _build() {
    _$StructureShape _$result;
    try {
      _$result = _$v ??
          new _$StructureShape._(
              mixins: mixins.build(),
              members: BuiltValueNullFieldError.checkNotNull(
                  members, r'StructureShape', 'members'),
              shapeId: BuiltValueNullFieldError.checkNotNull(
                  shapeId, r'StructureShape', 'shapeId'),
              traits: BuiltValueNullFieldError.checkNotNull(
                  traits, r'StructureShape', 'traits'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'mixins';
        mixins.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StructureShape', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
