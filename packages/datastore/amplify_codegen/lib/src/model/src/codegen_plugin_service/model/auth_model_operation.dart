// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.auth_model_operation; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:smithy/smithy.dart' as _i1;

class AuthModelOperation extends _i1.SmithyEnum<AuthModelOperation> {
  const AuthModelOperation._(
    int index,
    String name,
    String value,
  ) : super(
          index,
          name,
          value,
        );

  const AuthModelOperation._sdkUnknown(String value) : super.sdkUnknown(value);

  static const create = AuthModelOperation._(
    0,
    'CREATE',
    'create',
  );

  static const delete = AuthModelOperation._(
    1,
    'DELETE',
    'delete',
  );

  static const get = AuthModelOperation._(
    2,
    'GET',
    'get',
  );

  static const list = AuthModelOperation._(
    3,
    'LIST',
    'list',
  );

  static const listen = AuthModelOperation._(
    4,
    'LISTEN',
    'listen',
  );

  static const read = AuthModelOperation._(
    5,
    'READ',
    'read',
  );

  static const search = AuthModelOperation._(
    6,
    'SEARCH',
    'search',
  );

  static const sync = AuthModelOperation._(
    7,
    'SYNC',
    'sync',
  );

  static const update = AuthModelOperation._(
    8,
    'UPDATE',
    'update',
  );

  /// All values of [AuthModelOperation].
  static const values = <AuthModelOperation>[
    AuthModelOperation.create,
    AuthModelOperation.delete,
    AuthModelOperation.get,
    AuthModelOperation.list,
    AuthModelOperation.listen,
    AuthModelOperation.read,
    AuthModelOperation.search,
    AuthModelOperation.sync,
    AuthModelOperation.update,
  ];

  static const List<_i1.SmithySerializer<AuthModelOperation>> serializers = [
    _i1.SmithyEnumSerializer(
      'AuthModelOperation',
      values: values,
      sdkUnknown: AuthModelOperation._sdkUnknown,
      supportedProtocols: [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ],
    )
  ];
}

extension AuthModelOperationHelpers on List<AuthModelOperation> {
  /// Returns the value of [AuthModelOperation] whose name matches [name].
  ///
  /// Throws a `StateError` if no matching value is found.
  AuthModelOperation byName(String name) =>
      firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  /// Returns the value of [AuthModelOperation] whose value matches [value].
  AuthModelOperation byValue(String value) =>
      firstWhere((el) => el.value == value);
}
