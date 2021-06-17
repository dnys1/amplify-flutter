//ignore_for_file:public_member_api_docs
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'amplify_error_config.g.dart';

const _serializerConfig = JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
);

@_serializerConfig
class AmplifyErrorConfig {
  final List<AmplifyError> errors;

  const AmplifyErrorConfig({
    required this.errors,
  });

  factory AmplifyErrorConfig.fromJson(Map json) =>
      _$AmplifyErrorConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AmplifyErrorConfigToJson(this);

  @override
  String toString() {
    const jsonIndent = JsonEncoder.withIndent('  ');
    return 'AmplifyErrorConfig: ${jsonIndent.convert(toJson())}';
  }
}

@_serializerConfig
class AmplifyError {
  @JsonKey(name: 'ios')
  final String iosName;

  @JsonKey(name: 'android')
  final String androidName;

  @JsonKey(name: 'dart')
  final DartDetails dartDetails;

  const AmplifyError({
    required this.iosName,
    required this.androidName,
    required this.dartDetails,
  });

  factory AmplifyError.fromJson(Map json) => _$AmplifyErrorFromJson(json);

  Map<String, dynamic> toJson() => _$AmplifyErrorToJson(this);

  @override
  String toString() {
    const jsonIndent = JsonEncoder.withIndent('  ');
    return 'AmplifyErrorConfig${jsonIndent.convert(toJson())}';
  }
}

@_serializerConfig
class DartDetails {
  @JsonKey(name: 'class')
  final String dartClass;

  @JsonKey(name: 'factory')
  final String dartFactory;

  const DartDetails({
    required this.dartClass,
    this.dartFactory = 'fromJson',
  });

  factory DartDetails.fromJson(Map json) => _$DartDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DartDetailsToJson(this);

  @override
  String toString() {
    const jsonIndent = JsonEncoder.withIndent('  ');
    return 'AmplifyErrorConfig${jsonIndent.convert(toJson())}';
  }
}
