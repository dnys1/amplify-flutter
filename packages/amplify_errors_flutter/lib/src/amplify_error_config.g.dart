// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amplify_error_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmplifyErrorConfig _$AmplifyErrorConfigFromJson(Map json) {
  return $checkedNew('AmplifyErrorConfig', json, () {
    $checkKeys(json, allowedKeys: const ['errors']);
    final val = AmplifyErrorConfig(
      errors: $checkedConvert(
          json,
          'errors',
          (v) => (v as List<dynamic>)
              .map((e) => AmplifyError.fromJson(e as Map))
              .toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$AmplifyErrorConfigToJson(AmplifyErrorConfig instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };

AmplifyError _$AmplifyErrorFromJson(Map json) {
  return $checkedNew('AmplifyError', json, () {
    $checkKeys(json, allowedKeys: const ['ios', 'android', 'dart']);
    final val = AmplifyError(
      iosName: $checkedConvert(json, 'ios', (v) => v as String),
      androidName: $checkedConvert(json, 'android', (v) => v as String),
      dartDetails:
          $checkedConvert(json, 'dart', (v) => DartDetails.fromJson(v as Map)),
    );
    return val;
  }, fieldKeyMap: const {
    'iosName': 'ios',
    'androidName': 'android',
    'dartDetails': 'dart'
  });
}

Map<String, dynamic> _$AmplifyErrorToJson(AmplifyError instance) =>
    <String, dynamic>{
      'ios': instance.iosName,
      'android': instance.androidName,
      'dart': instance.dartDetails,
    };

DartDetails _$DartDetailsFromJson(Map json) {
  return $checkedNew('DartDetails', json, () {
    $checkKeys(json, allowedKeys: const ['class', 'factory']);
    final val = DartDetails(
      dartClass: $checkedConvert(json, 'class', (v) => v as String),
      dartFactory: $checkedConvert(json, 'factory', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'dartClass': 'class', 'dartFactory': 'factory'});
}

Map<String, dynamic> _$DartDetailsToJson(DartDetails instance) =>
    <String, dynamic>{
      'class': instance.dartClass,
      'factory': instance.dartFactory,
    };
