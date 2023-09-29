// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.auth_strategy; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:smithy/smithy.dart' as _i1;

class AuthStrategy extends _i1.SmithyEnum<AuthStrategy> {
  const AuthStrategy._(
    int index,
    String name,
    String value,
  ) : super(
          index,
          name,
          value,
        );

  const AuthStrategy._sdkUnknown(String value) : super.sdkUnknown(value);

  static const custom = AuthStrategy._(
    0,
    'CUSTOM',
    'custom',
  );

  static const groups = AuthStrategy._(
    1,
    'GROUPS',
    'groups',
  );

  static const owner = AuthStrategy._(
    2,
    'OWNER',
    'owner',
  );

  static const private = AuthStrategy._(
    3,
    'PRIVATE',
    'private',
  );

  static const public = AuthStrategy._(
    4,
    'PUBLIC',
    'public',
  );

  /// All values of [AuthStrategy].
  static const values = <AuthStrategy>[
    AuthStrategy.custom,
    AuthStrategy.groups,
    AuthStrategy.owner,
    AuthStrategy.private,
    AuthStrategy.public,
  ];

  static const List<_i1.SmithySerializer<AuthStrategy>> serializers = [
    _i1.SmithyEnumSerializer(
      'AuthStrategy',
      values: values,
      sdkUnknown: AuthStrategy._sdkUnknown,
      supportedProtocols: [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ],
    )
  ];
}

extension AuthStrategyHelpers on List<AuthStrategy> {
  /// Returns the value of [AuthStrategy] whose name matches [name].
  ///
  /// Throws a `StateError` if no matching value is found.
  AuthStrategy byName(String name) =>
      firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  /// Returns the value of [AuthStrategy] whose value matches [value].
  AuthStrategy byValue(String value) => firstWhere((el) => el.value == value);
}
