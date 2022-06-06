// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amplify_secure_storage_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AmplifySecureStorageConfig> _$amplifySecureStorageConfigSerializer =
    new _$AmplifySecureStorageConfigSerializer();

class _$AmplifySecureStorageConfigSerializer
    implements StructuredSerializer<AmplifySecureStorageConfig> {
  @override
  final Iterable<Type> types = const [
    AmplifySecureStorageConfig,
    _$AmplifySecureStorageConfig
  ];
  @override
  final String wireName = 'AmplifySecureStorageConfig';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AmplifySecureStorageConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'packageId',
      serializers.serialize(object.packageId,
          specifiedType: const FullType(String)),
      'scope',
      serializers.serialize(object.scope,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AmplifySecureStorageConfig deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AmplifySecureStorageConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'packageId':
          result.packageId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AmplifySecureStorageConfig extends AmplifySecureStorageConfig {
  @override
  final String packageId;
  @override
  final String scope;

  factory _$AmplifySecureStorageConfig(
          [void Function(AmplifySecureStorageConfigBuilder)? updates]) =>
      (new AmplifySecureStorageConfigBuilder()..update(updates))._build();

  _$AmplifySecureStorageConfig._({required this.packageId, required this.scope})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        packageId, r'AmplifySecureStorageConfig', 'packageId');
    BuiltValueNullFieldError.checkNotNull(
        scope, r'AmplifySecureStorageConfig', 'scope');
  }

  @override
  AmplifySecureStorageConfig rebuild(
          void Function(AmplifySecureStorageConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AmplifySecureStorageConfigBuilder toBuilder() =>
      new AmplifySecureStorageConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AmplifySecureStorageConfig &&
        packageId == other.packageId &&
        scope == other.scope;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, packageId.hashCode), scope.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AmplifySecureStorageConfig')
          ..add('packageId', packageId)
          ..add('scope', scope))
        .toString();
  }
}

class AmplifySecureStorageConfigBuilder
    implements
        Builder<AmplifySecureStorageConfig, AmplifySecureStorageConfigBuilder> {
  _$AmplifySecureStorageConfig? _$v;

  String? _packageId;
  String? get packageId => _$this._packageId;
  set packageId(String? packageId) => _$this._packageId = packageId;

  String? _scope;
  String? get scope => _$this._scope;
  set scope(String? scope) => _$this._scope = scope;

  AmplifySecureStorageConfigBuilder();

  AmplifySecureStorageConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _packageId = $v.packageId;
      _scope = $v.scope;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AmplifySecureStorageConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AmplifySecureStorageConfig;
  }

  @override
  void update(void Function(AmplifySecureStorageConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AmplifySecureStorageConfig build() => _build();

  _$AmplifySecureStorageConfig _build() {
    final _$result = _$v ??
        new _$AmplifySecureStorageConfig._(
            packageId: BuiltValueNullFieldError.checkNotNull(
                packageId, r'AmplifySecureStorageConfig', 'packageId'),
            scope: BuiltValueNullFieldError.checkNotNull(
                scope, r'AmplifySecureStorageConfig', 'scope'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
