// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:json_annotation/json_annotation.dart';
import 'package:smithy/ast.dart';

part 'endpoint_tests_trait.g.dart';

@ShapeIdConverter()
@JsonSerializable()
class EndpointTestsTrait implements Trait<EndpointTestsTrait> {
  const EndpointTestsTrait({
    required this.version,
    required this.testCases,
  });

  factory EndpointTestsTrait.fromJson(Object? json) =>
      _$EndpointTestsTraitFromJson((json as Map).cast<String, Object?>());

  static final id = ShapeId.parse('smithy.rules#endpointTests');

  final String version;
  final List<EndpointTestCase> testCases;

  @override
  bool get isSynthetic => false;

  @override
  List<Object?> get props => [version, testCases];

  @override
  ShapeId get shapeId => id;

  @override
  Map<String, Object?> toJson() => _$EndpointTestsTraitToJson(this);

  @override
  EndpointTestsTrait get value => this;
}

@JsonSerializable()
class EndpointTestCase {
  const EndpointTestCase({
    required this.expectation,
    this.documentation,
    this.parameters = const {},
    this.operationInputs = const [],
  });

  factory EndpointTestCase.fromJson(Map<String, Object?> json) =>
      _$EndpointTestCaseFromJson(json);

  final String? documentation;

  @JsonKey(name: 'expect')
  final EndpointTestExpectation expectation;

  @JsonKey(name: 'params')
  final Map<String, Object?> parameters;

  final List<EndpointTestOperationInput> operationInputs;

  Map<String, Object?> toJson() => _$EndpointTestCaseToJson(this);
}

@JsonSerializable()
class EndpointTestExpectation {
  const EndpointTestExpectation({
    this.endpoint,
    this.error,
  }) : assert(
          endpoint != null || error != null,
          'Either endpoint or error case must be specified',
        );

  factory EndpointTestExpectation.fromJson(Map<String, Object?> json) =>
      _$EndpointTestExpectationFromJson(json);

  final ExpectedEndpoint? endpoint;
  final String? error;

  Map<String, Object?> toJson() => _$EndpointTestExpectationToJson(this);
}

@JsonSerializable()
class ExpectedEndpoint {
  const ExpectedEndpoint({
    required this.url,
    this.headers = const {},
    this.properties,
  });

  factory ExpectedEndpoint.fromJson(
    Map<String, Object?> json,
  ) =>
      _$ExpectedEndpointFromJson(json);

  final String url;
  final Map<String, List<String>> headers;
  final Map<String, Object?>? properties;

  Map<String, Object?> toJson() => _$ExpectedEndpointToJson(this);
}

// @JsonSerializable()
// class EndpointProperties {
//   const EndpointProperties({
//     this.authSchemes = const [],
//   });

//   factory EndpointProperties.fromJson(
//     Map<String, Object?> json,
//   ) =>
//       _$EndpointPropertiesFromJson(json);

//   final List<> authSchemes;

//   Map<String, Object?> toJson() => _$EndpointPropertiesToJson(this);
// }

// @JsonSerializable()
// class EndpointAuthScheme {
//   const EndpointAuthScheme({
//     required this.name,
//     this.signingName,
//     required this.signingRegion,
//     this.disableDoubleEncoding = false,
//   });

//   factory EndpointAuthScheme.fromJson(Map<String, Object?> json) =>
//       _$EndpointAuthSchemeFromJson(json);

//   final String name;
//   final String? signingName;
//   final String signingRegion;
//   final bool disableDoubleEncoding;

//   Map<String, Object?> toJson() => _$EndpointAuthSchemeToJson(this);
// }

@JsonSerializable()
class EndpointTestOperationInput {
  const EndpointTestOperationInput({
    required this.builtInParams,
    required this.operationName,
    required this.operationParams,
  });

  factory EndpointTestOperationInput.fromJson(Map<String, Object?> json) =>
      _$EndpointTestOperationInputFromJson(json);

  final Map<String, Object?> builtInParams;
  final String operationName;
  final Map<String, Object?> operationParams;

  Map<String, Object?> toJson() => _$EndpointTestOperationInputToJson(this);
}
