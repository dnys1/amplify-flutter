// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.storage_s3_bucket; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/amplify_core.dart';
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'storage_s3_bucket.g.dart';

/// The configuration for an AWS S3 bucket.
abstract class StorageS3Bucket
    with _i1.AWSEquatable<StorageS3Bucket>
    implements Built<StorageS3Bucket, StorageS3BucketBuilder> {
  /// The configuration for an AWS S3 bucket.
  factory StorageS3Bucket({
    required String bucketName,
    required String region,
    StorageAccessLevel? defaultAccessLevel,
  }) {
    defaultAccessLevel ??= StorageAccessLevel.guest;
    return _$StorageS3Bucket._(
      bucketName: bucketName,
      region: region,
      defaultAccessLevel: defaultAccessLevel,
    );
  }

  /// The configuration for an AWS S3 bucket.
  factory StorageS3Bucket.build(
      [void Function(StorageS3BucketBuilder) updates]) = _$StorageS3Bucket;

  const StorageS3Bucket._();

  static const List<_i2.SmithySerializer<StorageS3Bucket>> serializers = [
    StorageS3BucketSerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(StorageS3BucketBuilder b) {
    b.defaultAccessLevel = StorageAccessLevel.guest;
  }

  String get bucketName;
  String get region;
  StorageAccessLevel get defaultAccessLevel;
  @override
  List<Object?> get props => [
        bucketName,
        region,
        defaultAccessLevel,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('StorageS3Bucket')
      ..add(
        'bucketName',
        bucketName,
      )
      ..add(
        'region',
        region,
      )
      ..add(
        'defaultAccessLevel',
        defaultAccessLevel,
      );
    return helper.toString();
  }
}

class StorageS3BucketSerializer
    extends _i2.StructuredSmithySerializer<StorageS3Bucket> {
  const StorageS3BucketSerializer() : super('StorageS3Bucket');

  @override
  Iterable<Type> get types => const [
        StorageS3Bucket,
        _$StorageS3Bucket,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  StorageS3Bucket deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StorageS3BucketBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'bucketName':
          result.bucketName = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'defaultAccessLevel':
          result.defaultAccessLevel = (serializers.deserialize(
            value,
            specifiedType: const FullType(StorageAccessLevel),
          ) as StorageAccessLevel);
        case 'region':
          result.region = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    StorageS3Bucket object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final StorageS3Bucket(:bucketName, :defaultAccessLevel, :region) = object;
    result$.addAll([
      'bucketName',
      serializers.serialize(
        bucketName,
        specifiedType: const FullType(String),
      ),
      'defaultAccessLevel',
      serializers.serialize(
        defaultAccessLevel,
        specifiedType: const FullType(StorageAccessLevel),
      ),
      'region',
      serializers.serialize(
        region,
        specifiedType: const FullType(String),
      ),
    ]);
    return result$;
  }
}
