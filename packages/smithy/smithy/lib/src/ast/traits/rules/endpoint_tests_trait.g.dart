// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint_tests_trait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointTestsTrait _$EndpointTestsTraitFromJson(Map<String, dynamic> json) =>
    EndpointTestsTrait(
      version: json['version'] as String,
      testCases: (json['testCases'] as List<dynamic>)
          .map((e) => EndpointTestCase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EndpointTestsTraitToJson(EndpointTestsTrait instance) =>
    <String, dynamic>{
      'version': instance.version,
      'testCases': instance.testCases,
    };

EndpointTestCase _$EndpointTestCaseFromJson(Map<String, dynamic> json) =>
    EndpointTestCase(
      expectation: EndpointTestExpectation.fromJson(
          json['expect'] as Map<String, dynamic>),
      documentation: json['documentation'] as String?,
      parameters: json['params'] as Map<String, dynamic>? ?? const {},
      operationInputs: (json['operationInputs'] as List<dynamic>?)
              ?.map((e) => EndpointTestOperationInput.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EndpointTestCaseToJson(EndpointTestCase instance) =>
    <String, dynamic>{
      'documentation': instance.documentation,
      'expect': instance.expectation,
      'params': instance.parameters,
      'operationInputs': instance.operationInputs,
    };

EndpointTestExpectation _$EndpointTestExpectationFromJson(
        Map<String, dynamic> json) =>
    EndpointTestExpectation(
      endpoint: json['endpoint'] == null
          ? null
          : ExpectedEndpoint.fromJson(json['endpoint'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$EndpointTestExpectationToJson(
        EndpointTestExpectation instance) =>
    <String, dynamic>{
      'endpoint': instance.endpoint,
      'error': instance.error,
    };

ExpectedEndpoint _$ExpectedEndpointFromJson(Map<String, dynamic> json) =>
    ExpectedEndpoint(
      url: json['url'] as String,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
      properties: json['properties'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ExpectedEndpointToJson(ExpectedEndpoint instance) =>
    <String, dynamic>{
      'url': instance.url,
      'headers': instance.headers,
      'properties': instance.properties,
    };

EndpointTestOperationInput _$EndpointTestOperationInputFromJson(
        Map<String, dynamic> json) =>
    EndpointTestOperationInput(
      builtInParams: json['builtInParams'] as Map<String, dynamic>,
      operationName: json['operationName'] as String,
      operationParams: json['operationParams'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$EndpointTestOperationInputToJson(
        EndpointTestOperationInput instance) =>
    <String, dynamic>{
      'builtInParams': instance.builtInParams,
      'operationName': instance.operationName,
      'operationParams': instance.operationParams,
    };
