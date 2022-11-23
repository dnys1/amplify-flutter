// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: non_constant_identifier_names

library models.phone;

import 'package:amplify_core/amplify_core.dart';

class Phone
    with
        AWSEquatable<Phone>,
        AWSSerializable<Map<String, Object?>>,
        AWSDebuggable {
  const Phone({
    required this.countryCode,
    required this.areaCode,
    required this.number,
  });

  factory Phone.fromJson(Map<String, Object?> json) {
    final countryCode = json['countryCode'] == null
        ? (throw ModelFieldError(
            'Phone',
            'countryCode',
          ))
        : (json['countryCode'] as String);
    final areaCode = json['areaCode'] == null
        ? (throw ModelFieldError(
            'Phone',
            'areaCode',
          ))
        : (json['areaCode'] as String);
    final number = json['number'] == null
        ? (throw ModelFieldError(
            'Phone',
            'number',
          ))
        : (json['number'] as String);
    return Phone(
      countryCode: countryCode,
      areaCode: areaCode,
      number: number,
    );
  }

  final String countryCode;

  final String areaCode;

  final String number;

  @override
  List<Object?> get props => [
        countryCode,
        areaCode,
        number,
      ];
  @override
  String get runtimeTypeName => 'Phone';
  @override
  Map<String, Object?> toJson() => {
        'countryCode': countryCode,
        'areaCode': areaCode,
        'number': number,
      };
}
