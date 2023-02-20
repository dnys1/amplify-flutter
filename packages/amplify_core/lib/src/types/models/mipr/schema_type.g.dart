// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: deprecated_member_use_from_same_package

part of 'schema_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AppSyncScalar _$id = const AppSyncScalar._('id');
const AppSyncScalar _$string = const AppSyncScalar._('string');
const AppSyncScalar _$int_ = const AppSyncScalar._('int_');
const AppSyncScalar _$float = const AppSyncScalar._('float');
const AppSyncScalar _$boolean = const AppSyncScalar._('boolean');
const AppSyncScalar _$awsDate = const AppSyncScalar._('awsDate');
const AppSyncScalar _$awsTime = const AppSyncScalar._('awsTime');
const AppSyncScalar _$awsDateTime = const AppSyncScalar._('awsDateTime');
const AppSyncScalar _$awsTimestamp = const AppSyncScalar._('awsTimestamp');
const AppSyncScalar _$awsEmail = const AppSyncScalar._('awsEmail');
const AppSyncScalar _$awsJson = const AppSyncScalar._('awsJson');
const AppSyncScalar _$awsPhone = const AppSyncScalar._('awsPhone');
const AppSyncScalar _$awsUrl = const AppSyncScalar._('awsUrl');
const AppSyncScalar _$awsIpAddress = const AppSyncScalar._('awsIpAddress');

AppSyncScalar _$AppSyncScalarValueOf(String name) {
  switch (name) {
    case 'id':
      return _$id;
    case 'string':
      return _$string;
    case 'int_':
      return _$int_;
    case 'float':
      return _$float;
    case 'boolean':
      return _$boolean;
    case 'awsDate':
      return _$awsDate;
    case 'awsTime':
      return _$awsTime;
    case 'awsDateTime':
      return _$awsDateTime;
    case 'awsTimestamp':
      return _$awsTimestamp;
    case 'awsEmail':
      return _$awsEmail;
    case 'awsJson':
      return _$awsJson;
    case 'awsPhone':
      return _$awsPhone;
    case 'awsUrl':
      return _$awsUrl;
    case 'awsIpAddress':
      return _$awsIpAddress;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AppSyncScalar> _$AppSyncScalarValues =
    new BuiltSet<AppSyncScalar>(const <AppSyncScalar>[
  _$id,
  _$string,
  _$int_,
  _$float,
  _$boolean,
  _$awsDate,
  _$awsTime,
  _$awsDateTime,
  _$awsTimestamp,
  _$awsEmail,
  _$awsJson,
  _$awsPhone,
  _$awsUrl,
  _$awsIpAddress,
]);

Serializer<AppSyncScalar> _$appSyncScalarSerializer =
    new _$AppSyncScalarSerializer();

class _$AppSyncScalarSerializer implements PrimitiveSerializer<AppSyncScalar> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'id': 'ID',
    'string': 'String',
    'int_': 'Int',
    'float': 'Float',
    'boolean': 'Boolean',
    'awsDate': 'AWSDate',
    'awsTime': 'AWSTime',
    'awsDateTime': 'AWSDateTime',
    'awsTimestamp': 'AWSTimestamp',
    'awsEmail': 'AWSEmail',
    'awsJson': 'AWSJSON',
    'awsPhone': 'AWSPhone',
    'awsUrl': 'AWSURL',
    'awsIpAddress': 'AWSIPAddress',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ID': 'id',
    'String': 'string',
    'Int': 'int_',
    'Float': 'float',
    'Boolean': 'boolean',
    'AWSDate': 'awsDate',
    'AWSTime': 'awsTime',
    'AWSDateTime': 'awsDateTime',
    'AWSTimestamp': 'awsTimestamp',
    'AWSEmail': 'awsEmail',
    'AWSJSON': 'awsJson',
    'AWSPhone': 'awsPhone',
    'AWSURL': 'awsUrl',
    'AWSIPAddress': 'awsIpAddress',
  };

  @override
  final Iterable<Type> types = const <Type>[AppSyncScalar];
  @override
  final String wireName = 'AppSyncScalar';

  @override
  Object serialize(Serializers serializers, AppSyncScalar object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AppSyncScalar deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AppSyncScalar.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
