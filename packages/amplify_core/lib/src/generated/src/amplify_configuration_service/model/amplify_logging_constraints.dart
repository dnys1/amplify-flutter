// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.amplify_logging_constraints; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/amplify_core.dart';
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'amplify_logging_constraints.g.dart';

abstract class AmplifyLoggingConstraints
    with _i1.AWSEquatable<AmplifyLoggingConstraints>
    implements
        Built<AmplifyLoggingConstraints, AmplifyLoggingConstraintsBuilder> {
  factory AmplifyLoggingConstraints({
    LogLevel? defaultLogLevel,
    Map<Category, LogLevel>? categoryLogLevel,
    Map<String, UserLogLevel>? userLogLevel,
  }) {
    defaultLogLevel ??= LogLevel.error;
    categoryLogLevel ??= const {};
    userLogLevel ??= const {};
    return _$AmplifyLoggingConstraints._(
      defaultLogLevel: defaultLogLevel,
      categoryLogLevel: _i2.BuiltMap(categoryLogLevel),
      userLogLevel: _i2.BuiltMap(userLogLevel),
    );
  }

  factory AmplifyLoggingConstraints.build(
          [void Function(AmplifyLoggingConstraintsBuilder) updates]) =
      _$AmplifyLoggingConstraints;

  const AmplifyLoggingConstraints._();

  static const List<_i3.SmithySerializer<AmplifyLoggingConstraints>>
      serializers = [AmplifyLoggingConstraintsSerializer()];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(AmplifyLoggingConstraintsBuilder b) {
    b
      ..defaultLogLevel = LogLevel.error
      ..categoryLogLevel.addAll(const {})
      ..userLogLevel.addAll(const {});
  }

  LogLevel get defaultLogLevel;
  _i2.BuiltMap<Category, LogLevel> get categoryLogLevel;
  _i2.BuiltMap<String, UserLogLevel> get userLogLevel;
  @override
  List<Object?> get props => [
        defaultLogLevel,
        categoryLogLevel,
        userLogLevel,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AmplifyLoggingConstraints')
      ..add(
        'defaultLogLevel',
        defaultLogLevel,
      )
      ..add(
        'categoryLogLevel',
        categoryLogLevel,
      )
      ..add(
        'userLogLevel',
        userLogLevel,
      );
    return helper.toString();
  }
}

class AmplifyLoggingConstraintsSerializer
    extends _i3.StructuredSmithySerializer<AmplifyLoggingConstraints> {
  const AmplifyLoggingConstraintsSerializer()
      : super('AmplifyLoggingConstraints');

  @override
  Iterable<Type> get types => const [
        AmplifyLoggingConstraints,
        _$AmplifyLoggingConstraints,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  AmplifyLoggingConstraints deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AmplifyLoggingConstraintsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'categoryLogLevel':
          result.categoryLogLevel.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltMap,
              [
                FullType(Category),
                FullType(LogLevel),
              ],
            ),
          ) as _i2.BuiltMap<Category, LogLevel>));
        case 'defaultLogLevel':
          result.defaultLogLevel = (serializers.deserialize(
            value,
            specifiedType: const FullType(LogLevel),
          ) as LogLevel);
        case 'userLogLevel':
          result.userLogLevel.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltMap,
              [
                FullType(String),
                FullType(UserLogLevel),
              ],
            ),
          ) as _i2.BuiltMap<String, UserLogLevel>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    AmplifyLoggingConstraints object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final AmplifyLoggingConstraints(
      :categoryLogLevel,
      :defaultLogLevel,
      :userLogLevel
    ) = object;
    result$.addAll([
      'categoryLogLevel',
      serializers.serialize(
        categoryLogLevel,
        specifiedType: const FullType(
          _i2.BuiltMap,
          [
            FullType(Category),
            FullType(LogLevel),
          ],
        ),
      ),
      'defaultLogLevel',
      serializers.serialize(
        defaultLogLevel,
        specifiedType: const FullType(LogLevel),
      ),
      'userLogLevel',
      serializers.serialize(
        userLogLevel,
        specifiedType: const FullType(
          _i2.BuiltMap,
          [
            FullType(String),
            FullType(UserLogLevel),
          ],
        ),
      ),
    ]);
    return result$;
  }
}
