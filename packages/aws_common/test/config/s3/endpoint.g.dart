// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Endpoint extends Endpoint {
  @override
  final Uri uri;
  @override
  final BuiltListMultimap<String, String> headers;
  @override
  final BuiltMap<String, Object?> properties;

  factory _$Endpoint([void Function(EndpointBuilder)? updates]) =>
      (new EndpointBuilder()..update(updates))._build();

  _$Endpoint._(
      {required this.uri, required this.headers, required this.properties})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uri, r'Endpoint', 'uri');
    BuiltValueNullFieldError.checkNotNull(headers, r'Endpoint', 'headers');
    BuiltValueNullFieldError.checkNotNull(
        properties, r'Endpoint', 'properties');
  }

  @override
  Endpoint rebuild(void Function(EndpointBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EndpointBuilder toBuilder() => new EndpointBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Endpoint &&
        uri == other.uri &&
        headers == other.headers &&
        properties == other.properties;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, uri.hashCode);
    _$hash = $jc(_$hash, headers.hashCode);
    _$hash = $jc(_$hash, properties.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Endpoint')
          ..add('uri', uri)
          ..add('headers', headers)
          ..add('properties', properties))
        .toString();
  }
}

class EndpointBuilder implements Builder<Endpoint, EndpointBuilder> {
  _$Endpoint? _$v;

  Uri? _uri;
  Uri? get uri => _$this._uri;
  set uri(Uri? uri) => _$this._uri = uri;

  ListMultimapBuilder<String, String>? _headers;
  ListMultimapBuilder<String, String> get headers =>
      _$this._headers ??= new ListMultimapBuilder<String, String>();
  set headers(ListMultimapBuilder<String, String>? headers) =>
      _$this._headers = headers;

  MapBuilder<String, Object?>? _properties;
  MapBuilder<String, Object?> get properties =>
      _$this._properties ??= new MapBuilder<String, Object?>();
  set properties(MapBuilder<String, Object?>? properties) =>
      _$this._properties = properties;

  EndpointBuilder();

  EndpointBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uri = $v.uri;
      _headers = $v.headers.toBuilder();
      _properties = $v.properties.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Endpoint other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Endpoint;
  }

  @override
  void update(void Function(EndpointBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Endpoint build() => _build();

  _$Endpoint _build() {
    _$Endpoint _$result;
    try {
      _$result = _$v ??
          new _$Endpoint._(
              uri: BuiltValueNullFieldError.checkNotNull(
                  uri, r'Endpoint', 'uri'),
              headers: headers.build(),
              properties: properties.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'headers';
        headers.build();
        _$failedField = 'properties';
        properties.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Endpoint', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$S3EndpointParameters extends S3EndpointParameters {
  @override
  final String? bucket;
  @override
  final AWSRegion? region;
  @override
  final bool useFips;
  @override
  final bool useDualStack;
  @override
  final String? endpoint;
  @override
  final bool forcePathStyle;
  @override
  final bool accelerate;
  @override
  final bool useGlobalEndpoint;
  @override
  final bool? useObjectLambdaEndpoint;
  @override
  final bool? disableAccessPoints;
  @override
  final bool disableMultiRegionAccessPoints;
  @override
  final bool? useArnRegion;

  factory _$S3EndpointParameters(
          [void Function(S3EndpointParametersBuilder)? updates]) =>
      (new S3EndpointParametersBuilder()..update(updates))._build();

  _$S3EndpointParameters._(
      {this.bucket,
      this.region,
      required this.useFips,
      required this.useDualStack,
      this.endpoint,
      required this.forcePathStyle,
      required this.accelerate,
      required this.useGlobalEndpoint,
      this.useObjectLambdaEndpoint,
      this.disableAccessPoints,
      required this.disableMultiRegionAccessPoints,
      this.useArnRegion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        useFips, r'S3EndpointParameters', 'useFips');
    BuiltValueNullFieldError.checkNotNull(
        useDualStack, r'S3EndpointParameters', 'useDualStack');
    BuiltValueNullFieldError.checkNotNull(
        forcePathStyle, r'S3EndpointParameters', 'forcePathStyle');
    BuiltValueNullFieldError.checkNotNull(
        accelerate, r'S3EndpointParameters', 'accelerate');
    BuiltValueNullFieldError.checkNotNull(
        useGlobalEndpoint, r'S3EndpointParameters', 'useGlobalEndpoint');
    BuiltValueNullFieldError.checkNotNull(disableMultiRegionAccessPoints,
        r'S3EndpointParameters', 'disableMultiRegionAccessPoints');
  }

  @override
  S3EndpointParameters rebuild(
          void Function(S3EndpointParametersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  S3EndpointParametersBuilder toBuilder() =>
      new S3EndpointParametersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is S3EndpointParameters &&
        bucket == other.bucket &&
        region == other.region &&
        useFips == other.useFips &&
        useDualStack == other.useDualStack &&
        endpoint == other.endpoint &&
        forcePathStyle == other.forcePathStyle &&
        accelerate == other.accelerate &&
        useGlobalEndpoint == other.useGlobalEndpoint &&
        useObjectLambdaEndpoint == other.useObjectLambdaEndpoint &&
        disableAccessPoints == other.disableAccessPoints &&
        disableMultiRegionAccessPoints ==
            other.disableMultiRegionAccessPoints &&
        useArnRegion == other.useArnRegion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bucket.hashCode);
    _$hash = $jc(_$hash, region.hashCode);
    _$hash = $jc(_$hash, useFips.hashCode);
    _$hash = $jc(_$hash, useDualStack.hashCode);
    _$hash = $jc(_$hash, endpoint.hashCode);
    _$hash = $jc(_$hash, forcePathStyle.hashCode);
    _$hash = $jc(_$hash, accelerate.hashCode);
    _$hash = $jc(_$hash, useGlobalEndpoint.hashCode);
    _$hash = $jc(_$hash, useObjectLambdaEndpoint.hashCode);
    _$hash = $jc(_$hash, disableAccessPoints.hashCode);
    _$hash = $jc(_$hash, disableMultiRegionAccessPoints.hashCode);
    _$hash = $jc(_$hash, useArnRegion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'S3EndpointParameters')
          ..add('bucket', bucket)
          ..add('region', region)
          ..add('useFips', useFips)
          ..add('useDualStack', useDualStack)
          ..add('endpoint', endpoint)
          ..add('forcePathStyle', forcePathStyle)
          ..add('accelerate', accelerate)
          ..add('useGlobalEndpoint', useGlobalEndpoint)
          ..add('useObjectLambdaEndpoint', useObjectLambdaEndpoint)
          ..add('disableAccessPoints', disableAccessPoints)
          ..add(
              'disableMultiRegionAccessPoints', disableMultiRegionAccessPoints)
          ..add('useArnRegion', useArnRegion))
        .toString();
  }
}

class S3EndpointParametersBuilder
    implements Builder<S3EndpointParameters, S3EndpointParametersBuilder> {
  _$S3EndpointParameters? _$v;

  String? _bucket;
  String? get bucket => _$this._bucket;
  set bucket(String? bucket) => _$this._bucket = bucket;

  AWSRegion? _region;
  AWSRegion? get region => _$this._region;
  set region(AWSRegion? region) => _$this._region = region;

  bool? _useFips;
  bool? get useFips => _$this._useFips;
  set useFips(bool? useFips) => _$this._useFips = useFips;

  bool? _useDualStack;
  bool? get useDualStack => _$this._useDualStack;
  set useDualStack(bool? useDualStack) => _$this._useDualStack = useDualStack;

  String? _endpoint;
  String? get endpoint => _$this._endpoint;
  set endpoint(String? endpoint) => _$this._endpoint = endpoint;

  bool? _forcePathStyle;
  bool? get forcePathStyle => _$this._forcePathStyle;
  set forcePathStyle(bool? forcePathStyle) =>
      _$this._forcePathStyle = forcePathStyle;

  bool? _accelerate;
  bool? get accelerate => _$this._accelerate;
  set accelerate(bool? accelerate) => _$this._accelerate = accelerate;

  bool? _useGlobalEndpoint;
  bool? get useGlobalEndpoint => _$this._useGlobalEndpoint;
  set useGlobalEndpoint(bool? useGlobalEndpoint) =>
      _$this._useGlobalEndpoint = useGlobalEndpoint;

  bool? _useObjectLambdaEndpoint;
  bool? get useObjectLambdaEndpoint => _$this._useObjectLambdaEndpoint;
  set useObjectLambdaEndpoint(bool? useObjectLambdaEndpoint) =>
      _$this._useObjectLambdaEndpoint = useObjectLambdaEndpoint;

  bool? _disableAccessPoints;
  bool? get disableAccessPoints => _$this._disableAccessPoints;
  set disableAccessPoints(bool? disableAccessPoints) =>
      _$this._disableAccessPoints = disableAccessPoints;

  bool? _disableMultiRegionAccessPoints;
  bool? get disableMultiRegionAccessPoints =>
      _$this._disableMultiRegionAccessPoints;
  set disableMultiRegionAccessPoints(bool? disableMultiRegionAccessPoints) =>
      _$this._disableMultiRegionAccessPoints = disableMultiRegionAccessPoints;

  bool? _useArnRegion;
  bool? get useArnRegion => _$this._useArnRegion;
  set useArnRegion(bool? useArnRegion) => _$this._useArnRegion = useArnRegion;

  S3EndpointParametersBuilder();

  S3EndpointParametersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bucket = $v.bucket;
      _region = $v.region;
      _useFips = $v.useFips;
      _useDualStack = $v.useDualStack;
      _endpoint = $v.endpoint;
      _forcePathStyle = $v.forcePathStyle;
      _accelerate = $v.accelerate;
      _useGlobalEndpoint = $v.useGlobalEndpoint;
      _useObjectLambdaEndpoint = $v.useObjectLambdaEndpoint;
      _disableAccessPoints = $v.disableAccessPoints;
      _disableMultiRegionAccessPoints = $v.disableMultiRegionAccessPoints;
      _useArnRegion = $v.useArnRegion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(S3EndpointParameters other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$S3EndpointParameters;
  }

  @override
  void update(void Function(S3EndpointParametersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  S3EndpointParameters build() => _build();

  _$S3EndpointParameters _build() {
    final _$result = _$v ??
        new _$S3EndpointParameters._(
            bucket: bucket,
            region: region,
            useFips: BuiltValueNullFieldError.checkNotNull(
                useFips, r'S3EndpointParameters', 'useFips'),
            useDualStack: BuiltValueNullFieldError.checkNotNull(
                useDualStack, r'S3EndpointParameters', 'useDualStack'),
            endpoint: endpoint,
            forcePathStyle: BuiltValueNullFieldError.checkNotNull(
                forcePathStyle, r'S3EndpointParameters', 'forcePathStyle'),
            accelerate: BuiltValueNullFieldError.checkNotNull(
                accelerate, r'S3EndpointParameters', 'accelerate'),
            useGlobalEndpoint: BuiltValueNullFieldError.checkNotNull(
                useGlobalEndpoint,
                r'S3EndpointParameters',
                'useGlobalEndpoint'),
            useObjectLambdaEndpoint: useObjectLambdaEndpoint,
            disableAccessPoints: disableAccessPoints,
            disableMultiRegionAccessPoints:
                BuiltValueNullFieldError.checkNotNull(
                    disableMultiRegionAccessPoints,
                    r'S3EndpointParameters',
                    'disableMultiRegionAccessPoints'),
            useArnRegion: useArnRegion);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
