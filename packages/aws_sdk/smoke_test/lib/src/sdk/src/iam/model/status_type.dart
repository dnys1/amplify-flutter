// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library smoke_test.iam.model.status_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:smithy/smithy.dart' as _i1;

class StatusType extends _i1.SmithyEnum<StatusType> {
  const StatusType._(
    int index,
    String name,
    String value,
  ) : super(
          index,
          name,
          value,
        );

  const StatusType._sdkUnknown(String value) : super.sdkUnknown(value);

  static const active = StatusType._(
    0,
    'Active',
    'Active',
  );

  static const inactive = StatusType._(
    1,
    'Inactive',
    'Inactive',
  );

  /// All values of [StatusType].
  static const values = <StatusType>[
    StatusType.active,
    StatusType.inactive,
  ];

  static const List<_i1.SmithySerializer<StatusType>> serializers = [
    _i1.SmithyEnumSerializer(
      'statusType',
      values: values,
      sdkUnknown: StatusType._sdkUnknown,
      supportedProtocols: [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'awsQuery',
        )
      ],
    )
  ];
}

extension StatusTypeHelpers on List<StatusType> {
  /// Returns the value of [StatusType] whose name matches [name].
  ///
  /// Throws a `StateError` if no matching value is found.
  StatusType byName(String name) =>
      firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  /// Returns the value of [StatusType] whose value matches [value].
  StatusType byValue(String value) => firstWhere((el) => el.value == value);
}
