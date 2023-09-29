// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.globals; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'globals.g.dart';

abstract class Globals
    with _i1.AWSEquatable<Globals>
    implements Built<Globals, GlobalsBuilder> {
  factory Globals({_i2.AuthRule? globalAuthRule}) {
    return _$Globals._(globalAuthRule: globalAuthRule);
  }

  factory Globals.build([void Function(GlobalsBuilder) updates]) = _$Globals;

  const Globals._();

  static const List<_i3.SmithySerializer<Globals>> serializers = [
    GlobalsRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(GlobalsBuilder b) {}
  _i2.AuthRule? get globalAuthRule;
  @override
  List<Object?> get props => [globalAuthRule];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('Globals')
      ..add(
        'globalAuthRule',
        globalAuthRule,
      );
    return helper.toString();
  }
}

class GlobalsRestJson1Serializer
    extends _i3.StructuredSmithySerializer<Globals> {
  const GlobalsRestJson1Serializer() : super('Globals');

  @override
  Iterable<Type> get types => const [
        Globals,
        _$Globals,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  Globals deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GlobalsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'globalAuthRule':
          result.globalAuthRule.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.AuthRule),
          ) as _i2.AuthRule));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Globals object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final Globals(:globalAuthRule) = object;
    if (globalAuthRule != null) {
      result$
        ..add('globalAuthRule')
        ..add(serializers.serialize(
          globalAuthRule,
          specifiedType: const FullType(_i2.AuthRule),
        ));
    }
    return result$;
  }
}
