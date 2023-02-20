// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: deprecated_member_use_from_same_package

part of 'schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SchemaDefinition> _$schemaDefinitionSerializer =
    new _$SchemaDefinitionSerializer();

class _$SchemaDefinitionSerializer
    implements StructuredSerializer<SchemaDefinition> {
  @override
  final Iterable<Type> types = const [SchemaDefinition, _$SchemaDefinition];
  @override
  final String wireName = 'SchemaDefinition';

  @override
  Iterable<Object?> serialize(Serializers serializers, SchemaDefinition object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'typeDefinitions',
      serializers.serialize(object.typeDefinitions,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(SchemaTypeDefinition)
          ])),
    ];

    return result;
  }

  @override
  SchemaDefinition deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SchemaDefinitionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'typeDefinitions':
          result.typeDefinitions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(SchemaTypeDefinition)
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$SchemaDefinition extends SchemaDefinition {
  @override
  final BuiltMap<String, SchemaTypeDefinition> typeDefinitions;

  factory _$SchemaDefinition(
          [void Function(SchemaDefinitionBuilder)? updates]) =>
      (new SchemaDefinitionBuilder()..update(updates))._build();

  _$SchemaDefinition._({required this.typeDefinitions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        typeDefinitions, r'SchemaDefinition', 'typeDefinitions');
  }

  @override
  SchemaDefinition rebuild(void Function(SchemaDefinitionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SchemaDefinitionBuilder toBuilder() =>
      new SchemaDefinitionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SchemaDefinition &&
        typeDefinitions == other.typeDefinitions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, typeDefinitions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SchemaDefinition')
          ..add('typeDefinitions', typeDefinitions))
        .toString();
  }
}

class SchemaDefinitionBuilder
    implements Builder<SchemaDefinition, SchemaDefinitionBuilder> {
  _$SchemaDefinition? _$v;

  MapBuilder<String, SchemaTypeDefinition>? _typeDefinitions;
  MapBuilder<String, SchemaTypeDefinition> get typeDefinitions =>
      _$this._typeDefinitions ??=
          new MapBuilder<String, SchemaTypeDefinition>();
  set typeDefinitions(
          MapBuilder<String, SchemaTypeDefinition>? typeDefinitions) =>
      _$this._typeDefinitions = typeDefinitions;

  SchemaDefinitionBuilder();

  SchemaDefinitionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _typeDefinitions = $v.typeDefinitions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SchemaDefinition other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SchemaDefinition;
  }

  @override
  void update(void Function(SchemaDefinitionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SchemaDefinition build() => _build();

  _$SchemaDefinition _build() {
    _$SchemaDefinition _$result;
    try {
      _$result = _$v ??
          new _$SchemaDefinition._(typeDefinitions: typeDefinitions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'typeDefinitions';
        typeDefinitions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SchemaDefinition', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
