// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.name_casing; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:smithy/smithy.dart' as _i1;

class NameCasing extends _i1.SmithyEnum<NameCasing> {
  const NameCasing._(
    int index,
    String name,
    String value,
  ) : super(
          index,
          name,
          value,
        );

  const NameCasing._sdkUnknown(String value) : super.sdkUnknown(value);

  static const camelCase = NameCasing._(
    0,
    'CAMEL_CASE',
    'camelCase',
  );

  static const pascalCase = NameCasing._(
    1,
    'PASCAL_CASE',
    'PascalCase',
  );

  static const screamingCase = NameCasing._(
    2,
    'SCREAMING_CASE',
    'SCREAMING_CASE',
  );

  static const snakeCase = NameCasing._(
    3,
    'SNAKE_CASE',
    'snake_case',
  );

  /// All values of [NameCasing].
  static const values = <NameCasing>[
    NameCasing.camelCase,
    NameCasing.pascalCase,
    NameCasing.screamingCase,
    NameCasing.snakeCase,
  ];

  static const List<_i1.SmithySerializer<NameCasing>> serializers = [
    _i1.SmithyEnumSerializer(
      'NameCasing',
      values: values,
      sdkUnknown: NameCasing._sdkUnknown,
      supportedProtocols: [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ],
    )
  ];
}

extension NameCasingHelpers on List<NameCasing> {
  /// Returns the value of [NameCasing] whose name matches [name].
  ///
  /// Throws a `StateError` if no matching value is found.
  NameCasing byName(String name) =>
      firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  /// Returns the value of [NameCasing] whose value matches [value].
  NameCasing byValue(String value) => firstWhere((el) => el.value == value);
}
