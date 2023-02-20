// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.app_sync_scalar; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:smithy/smithy.dart' as _i1;

/// A primitive GraphQL type used in an AppSync schema. Supported scalar types are defined \[here\](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html): - \`ID\` - \`String\` - \`Int\` - \`Float\` - \`Boolean\` - \`AWSDate\` - \`AWSTime\` - \`AWSDateTime\` - \`AWSTimestamp\` - \`AWSEmail\` - \`AWSJSON\` - \`AWSPhone\` - \`AWSURL\` - \`AWSIPAddress\`
class AppSyncScalar extends _i1.SmithyEnum<AppSyncScalar> {
  const AppSyncScalar._(
    int index,
    String name,
    String value,
  ) : super(
          index,
          name,
          value,
        );

  const AppSyncScalar._sdkUnknown(String value) : super.sdkUnknown(value);

  /// An extended \[ISO 8601 date\](https://en.wikipedia.org/wiki/ISO\_8601#Calendar\_dates) string in the format \`YYYY-MM-DD\`. > **Note**: The \`AWSDate\`, \`AWSTime\`, and \`AWSDateTime\` scalars can optionally include a \[time zone offset\](https://en.wikipedia.org/wiki/ISO\_8601#Time\_zone_designators). For example, the values \`1970-01-01Z\`, \`1970-01-01-07:00\`, and \`1970-01-01+05:30\` are all valid for \`AWSDate\`. The time zone offset must be either \`Z\` (UTC) or an offset in hours and minutes (and, optionally, seconds). For example, `±hh:mm:ss`. The seconds field in the time zone offset is considered valid even though it's not part of the ISO 8601 standard.
  static const awsDate = AppSyncScalar._(
    0,
    'AWS_DATE',
    'AWSDate',
  );

  /// An extended \[ISO 8601 date and time\](https://en.wikipedia.org/wiki/ISO\_8601#Combined\_date\_and\_time\_representations) string in the format \`YYYY-MM-DDThh:mm:ss.sssZ\`. > **Note**: The \`AWSDate\`, \`AWSTime\`, and \`AWSDateTime\` scalars can optionally include a \[time zone offset\](https://en.wikipedia.org/wiki/ISO\_8601#Time\_zone\_designators). For example, the values \`1970-01-01Z\`, \`1970-01-01-07:00\`, and \`1970-01-01+05:30\` are all valid for \`AWSDate\`. The time zone offset must be either \`Z\` (UTC) or an offset in hours and minutes (and, optionally, seconds). For example, `±hh:mm:ss`. The seconds field in the time zone offset is considered valid even though it's not part of the ISO 8601 standard.
  static const awsDateTime = AppSyncScalar._(
    1,
    'AWS_DATE_TIME',
    'AWSDateTime',
  );

  /// An email address in the format local-part@domain-part as defined by \[RFC 822\](https://tools.ietf.org/html/rfc822).
  static const awsEmail = AppSyncScalar._(
    2,
    'AWS_EMAIL',
    'AWSEmail',
  );

  /// A valid IPv4 or IPv6 address. IPv4 addresses are expected in quad-dotted notation (\`123.12.34.56\`). IPv6 addresses are expected in non-bracketed, colon-separated format (\`1a2b:3c4b::1234:4567\`). You can include an optional CIDR suffix (\`123.45.67.89/16\`) to indicate subnet mask.
  static const awsIpAddress = AppSyncScalar._(
    3,
    'AWS_IP_ADDRESS',
    'AWSIPAddress',
  );

  /// A JSON string. Any valid JSON construct is automatically parsed and loaded in the resolver mapping templates as maps, lists, or scalar values rather than as the literal input strings. Unquoted strings or otherwise invalid JSON result in a GraphQL validation error.
  static const awsJson = AppSyncScalar._(
    4,
    'AWS_JSON',
    'AWSJSON',
  );

  /// A phone number. This value is stored as a string. Phone numbers can contain either spaces or hyphens to separate digit groups. Phone numbers without a country code are assumed to be US/North American numbers adhering to the \[North American Numbering Plan (NANP)\](https://en.wikipedia.org/wiki/North\_American\_Numbering_Plan).
  static const awsPhone = AppSyncScalar._(
    5,
    'AWS_PHONE',
    'AWSPhone',
  );

  /// An extended \[ISO 8601 time\](https://en.wikipedia.org/wiki/ISO\_8601#Times) string in the format \`hh:mm:ss.sss\`. > **Note**: The \`AWSDate\`, \`AWSTime\`, and \`AWSDateTime\` scalars can optionally include a \[time zone offset\](https://en.wikipedia.org/wiki/ISO\_8601#Time\_zone\_designators). For example, the values \`1970-01-01Z\`, \`1970-01-01-07:00\`, and \`1970-01-01+05:30\` are all valid for \`AWSDate\`. The time zone offset must be either \`Z\` (UTC) or an offset in hours and minutes (and, optionally, seconds). For example, `±hh:mm:ss`. The seconds field in the time zone offset is considered valid even though it's not part of the ISO 8601 standard.
  static const awsTime = AppSyncScalar._(
    6,
    'AWS_TIME',
    'AWSTime',
  );

  /// An integer value representing the number of seconds before or after \`1970-01-01-T00:00Z\`.
  static const awsTimestamp = AppSyncScalar._(
    7,
    'AWS_TIMESTAMP',
    'AWSTimestamp',
  );

  /// A URL as defined by \[RFC 1738\](https://tools.ietf.org/html/rfc1738). For example, \`https://www.amazon.com/dp/B000NZW3KC/\` or \`mailto:example@example.com\`. URLs must contain a schema (\`http\`, \`mailto\`) and can't contain two forward slashes (`//`) in the path part.
  static const awsUrl = AppSyncScalar._(
    8,
    'AWS_URL',
    'AWSURL',
  );

  /// A boolean value, either \`true\` or \`false\`.
  static const boolean = AppSyncScalar._(
    9,
    'BOOLEAN',
    'Boolean',
  );

  /// An IEEE 754 double-precision floating-point value.
  static const float = AppSyncScalar._(
    10,
    'FLOAT',
    'Float',
  );

  /// A unique identifier for an object. This scalar is serialized like a \`String\` but isn't meant to be human-readable.
  static const id = AppSyncScalar._(
    11,
    'ID',
    'ID',
  );

  /// A signed 32-bit integer, e.g. an integer value between -(2^31) and 2^31-1.
  static const int$ = AppSyncScalar._(
    12,
    'INT',
    'Int',
  );

  /// A UTF-8 character sequence.
  static const string = AppSyncScalar._(
    13,
    'STRING',
    'String',
  );

  /// All values of [AppSyncScalar].
  static const values = <AppSyncScalar>[
    AppSyncScalar.awsDate,
    AppSyncScalar.awsDateTime,
    AppSyncScalar.awsEmail,
    AppSyncScalar.awsIpAddress,
    AppSyncScalar.awsJson,
    AppSyncScalar.awsPhone,
    AppSyncScalar.awsTime,
    AppSyncScalar.awsTimestamp,
    AppSyncScalar.awsUrl,
    AppSyncScalar.boolean,
    AppSyncScalar.float,
    AppSyncScalar.id,
    AppSyncScalar.int$,
    AppSyncScalar.string,
  ];

  static const List<_i1.SmithySerializer<AppSyncScalar>> serializers = [
    _i1.SmithyEnumSerializer(
      'AppSyncScalar',
      values: values,
      sdkUnknown: AppSyncScalar._sdkUnknown,
      supportedProtocols: [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ],
    )
  ];
}

extension AppSyncScalarHelpers on List<AppSyncScalar> {
  /// Returns the value of [AppSyncScalar] whose name matches [name].
  ///
  /// Throws a `StateError` if no matching value is found.
  AppSyncScalar byName(String name) =>
      firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  /// Returns the value of [AppSyncScalar] whose value matches [value].
  AppSyncScalar byValue(String value) => firstWhere((el) => el.value == value);
}
