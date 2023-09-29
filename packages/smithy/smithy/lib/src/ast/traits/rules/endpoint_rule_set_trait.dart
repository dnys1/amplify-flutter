// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:aws_common/aws_common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:smithy/ast.dart';

part 'endpoint_rule_set_trait.g.dart';

@ShapeIdConverter()
@JsonSerializable()
class EndpointRuleSetTrait implements Trait<EndpointRuleSetTrait> {
  const EndpointRuleSetTrait({
    required this.version,
    this.parameters = const {},
  });

  factory EndpointRuleSetTrait.fromJson(Object? json) =>
      _$EndpointRuleSetTraitFromJson((json as Map).cast<String, Object?>());

  static final id = ShapeId.parse('smithy.rules#endpointRuleSet');

  final String version;
  final Map<String, EndpointParameter> parameters;

  @override
  bool get isSynthetic => false;

  @override
  List<Object?> get props => [version, parameters];

  @override
  ShapeId get shapeId => id;

  @override
  Map<String, Object?> toJson() => _$EndpointRuleSetTraitToJson(this);

  @override
  EndpointRuleSetTrait get value => this;
}

@JsonEnum(fieldRename: FieldRename.pascal)
enum EndpointParameterType { string, boolean }

@JsonSerializable()
class EndpointParameter {
  const EndpointParameter({
    required this.type,
    this.builtIn,
    this.defaultValue,
    this.required = false,
    required this.documentation,
    this.deprecated,
  });

  factory EndpointParameter.fromJson(Map<String, Object?> json) =>
      _$EndpointParameterFromJson(json);

  final EndpointParameterType type;
  final String? builtIn;

  @JsonKey(name: 'default')
  final Object? defaultValue;

  final bool required;
  final String documentation;
  final EndpointDeprecatedParameter? deprecated;

  Map<String, Object?> toJson() => _$EndpointParameterToJson(this);
}

@JsonSerializable()
class EndpointDeprecatedParameter {
  const EndpointDeprecatedParameter({
    this.message,
    this.since,
  });

  factory EndpointDeprecatedParameter.fromJson(Map<String, Object?> json) =>
      _$EndpointDeprecatedParameterFromJson(json);

  final String? message;
  final String? since;

  Map<String, Object?> toJson() => _$EndpointDeprecatedParameterToJson(this);
}

enum RuleType { endpoint, error, tree }

sealed class Rule with AWSSerializable<Map<String, Object?>>, AWSDebuggable {
  const Rule();

  factory Rule.fromJson(Map<String, Object?> json) {
    if (json case {'type': final String type}) {
      return switch (RuleType.values.byName(type)) {
        RuleType.endpoint => EndpointRule.fromJson(json),
      };
    }
    throw ArgumentError.value(json, 'json', 'Invalid endpoint rule');
  }
}

/// {@template endpoint_rule_set_trait.endpointRule}
///
/// {@endtemplate}
@JsonSerializable()
final class EndpointRule extends Rule with AWSEquatable<EndpointRule> {
  /// {@macro endpoint_rule_set_trait.endpointRule}
  const EndpointRule({
    required this.conditions,
  });

  /// Deserializes a [EndpointRule] from JSON.
  ///
  /// {@macro endpoint_rule_set_trait.endpointRule}
  factory EndpointRule.fromJson(Map<String, Object?> json) =>
      _$EndpointRuleFromJson(json);

  final List<EndpointRuleCondition> conditions;

  @override
  List<Object?> get props => [];

  @override
  String get runtimeTypeName => 'EndpointRule';

  @override
  Map<String, Object?> toJson() => _$EndpointRuleToJson(this);
}

/// {@template endpoint_rule_set_trait.endpointRuleCondition}
///
/// {@endtemplate}
@JsonSerializable()
class EndpointRuleCondition
    with
        AWSEquatable<EndpointRuleCondition>,
        AWSSerializable<Map<String, Object?>>,
        AWSDebuggable {
  /// {@macro endpoint_rule_set_trait.endpointRuleCondition}
  const EndpointRuleCondition();

  /// Deserializes a [EndpointRuleCondition] from JSON.
  ///
  /// {@macro endpoint_rule_set_trait.endpointRuleCondition}
  factory EndpointRuleCondition.fromJson(Map<String, Object?> json) =>
      _$EndpointRuleConditionFromJson(json);

  @override
  List<Object?> get props => [];

  @override
  String get runtimeTypeName => 'EndpointRuleCondition';

  @override
  Map<String, Object?> toJson() => _$EndpointRuleConditionToJson(this);
}
