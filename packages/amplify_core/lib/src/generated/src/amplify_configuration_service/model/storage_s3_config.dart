// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.storage_s3_config; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/storage_s3_bucket.dart';
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'storage_s3_config.g.dart';

/// The Amplify Storage S3 plugin configuration.
abstract class StorageS3Config
    with _i1.AWSEquatable<StorageS3Config>
    implements Built<StorageS3Config, StorageS3ConfigBuilder> {
  /// The Amplify Storage S3 plugin configuration.
  factory StorageS3Config({required List<StorageS3Bucket> buckets}) {
    return _$StorageS3Config._(buckets: _i2.BuiltList(buckets));
  }

  /// The Amplify Storage S3 plugin configuration.
  factory StorageS3Config.build(
      [void Function(StorageS3ConfigBuilder) updates]) = _$StorageS3Config;

  const StorageS3Config._();

  static const List<_i3.SmithySerializer<StorageS3Config>> serializers = [
    StorageS3ConfigSerializer()
  ];

  _i2.BuiltList<StorageS3Bucket> get buckets;
  @override
  List<Object?> get props => [buckets];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('StorageS3Config')
      ..add(
        'buckets',
        buckets,
      );
    return helper.toString();
  }
}

class StorageS3ConfigSerializer
    extends _i3.StructuredSmithySerializer<StorageS3Config> {
  const StorageS3ConfigSerializer() : super('StorageS3Config');

  @override
  Iterable<Type> get types => const [
        StorageS3Config,
        _$StorageS3Config,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  StorageS3Config deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StorageS3ConfigBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'buckets':
          result.buckets.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(StorageS3Bucket)],
            ),
          ) as _i2.BuiltList<StorageS3Bucket>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    StorageS3Config object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final StorageS3Config(:buckets) = object;
    result$.addAll([
      'buckets',
      serializers.serialize(
        buckets,
        specifiedType: const FullType(
          _i2.BuiltList,
          [FullType(StorageS3Bucket)],
        ),
      ),
    ]);
    return result$;
  }
}
