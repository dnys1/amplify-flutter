// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint_rule_set_trait.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointRuleSetTrait _$EndpointRuleSetTraitFromJson(
        Map<String, dynamic> json) =>
    EndpointRuleSetTrait(
      version: json['version'] as String,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, EndpointParameter.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$EndpointRuleSetTraitToJson(
        EndpointRuleSetTrait instance) =>
    <String, dynamic>{
      'version': instance.version,
      'parameters': instance.parameters,
    };

EndpointParameter _$EndpointParameterFromJson(Map<String, dynamic> json) =>
    EndpointParameter(
      type: $enumDecode(_$EndpointParameterTypeEnumMap, json['type']),
      builtIn: json['builtIn'] as String?,
      defaultValue: json['default'],
      required: json['required'] as bool? ?? false,
      documentation: json['documentation'] as String,
      deprecated: json['deprecated'] == null
          ? null
          : EndpointDeprecatedParameter.fromJson(
              json['deprecated'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EndpointParameterToJson(EndpointParameter instance) =>
    <String, dynamic>{
      'type': _$EndpointParameterTypeEnumMap[instance.type]!,
      'builtIn': instance.builtIn,
      'default': instance.defaultValue,
      'required': instance.required,
      'documentation': instance.documentation,
      'deprecated': instance.deprecated,
    };

const _$EndpointParameterTypeEnumMap = {
  EndpointParameterType.string: 'String',
  EndpointParameterType.boolean: 'Boolean',
};

EndpointDeprecatedParameter _$EndpointDeprecatedParameterFromJson(
        Map<String, dynamic> json) =>
    EndpointDeprecatedParameter(
      message: json['message'] as String?,
      since: json['since'] as String?,
    );

Map<String, dynamic> _$EndpointDeprecatedParameterToJson(
        EndpointDeprecatedParameter instance) =>
    <String, dynamic>{
      'message': instance.message,
      'since': instance.since,
    };
