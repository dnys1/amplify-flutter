// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_pool_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthUserPoolConfig extends AuthUserPoolConfig {
  @override
  final String poolId;
  @override
  final String region;
  @override
  final String clientId;
  @override
  final String? clientSecret;
  @override
  final Uri? endpoint;
  @override
  final AuthenticationFlowType? authFlowType;
  @override
  final _i2.BuiltList<AuthProvider>? socialProviders;
  @override
  final _i2.BuiltList<AuthUsernameAttribute>? usernameAttributes;
  @override
  final _i2.BuiltList<CognitoUserAttributeKey>? signUpAttributes;
  @override
  final _i2.BuiltList<CognitoUserAttributeKey>? verificationMechanisms;
  @override
  final AnalyticsPinpointConfig? pinpointConfig;
  @override
  final AuthPasswordPolicy? passwordPolicy;
  @override
  final AuthMfaConfiguration? mfaConfiguration;
  @override
  final AuthHostedUiConfig? hostedUi;

  factory _$AuthUserPoolConfig(
          [void Function(AuthUserPoolConfigBuilder)? updates]) =>
      (new AuthUserPoolConfigBuilder()..update(updates))._build();

  _$AuthUserPoolConfig._(
      {required this.poolId,
      required this.region,
      required this.clientId,
      this.clientSecret,
      this.endpoint,
      this.authFlowType,
      this.socialProviders,
      this.usernameAttributes,
      this.signUpAttributes,
      this.verificationMechanisms,
      this.pinpointConfig,
      this.passwordPolicy,
      this.mfaConfiguration,
      this.hostedUi})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        poolId, r'AuthUserPoolConfig', 'poolId');
    BuiltValueNullFieldError.checkNotNull(
        region, r'AuthUserPoolConfig', 'region');
    BuiltValueNullFieldError.checkNotNull(
        clientId, r'AuthUserPoolConfig', 'clientId');
  }

  @override
  AuthUserPoolConfig rebuild(
          void Function(AuthUserPoolConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthUserPoolConfigBuilder toBuilder() =>
      new AuthUserPoolConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthUserPoolConfig &&
        poolId == other.poolId &&
        region == other.region &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        endpoint == other.endpoint &&
        authFlowType == other.authFlowType &&
        socialProviders == other.socialProviders &&
        usernameAttributes == other.usernameAttributes &&
        signUpAttributes == other.signUpAttributes &&
        verificationMechanisms == other.verificationMechanisms &&
        pinpointConfig == other.pinpointConfig &&
        passwordPolicy == other.passwordPolicy &&
        mfaConfiguration == other.mfaConfiguration &&
        hostedUi == other.hostedUi;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, poolId.hashCode);
    _$hash = $jc(_$hash, region.hashCode);
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jc(_$hash, endpoint.hashCode);
    _$hash = $jc(_$hash, authFlowType.hashCode);
    _$hash = $jc(_$hash, socialProviders.hashCode);
    _$hash = $jc(_$hash, usernameAttributes.hashCode);
    _$hash = $jc(_$hash, signUpAttributes.hashCode);
    _$hash = $jc(_$hash, verificationMechanisms.hashCode);
    _$hash = $jc(_$hash, pinpointConfig.hashCode);
    _$hash = $jc(_$hash, passwordPolicy.hashCode);
    _$hash = $jc(_$hash, mfaConfiguration.hashCode);
    _$hash = $jc(_$hash, hostedUi.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class AuthUserPoolConfigBuilder
    implements Builder<AuthUserPoolConfig, AuthUserPoolConfigBuilder> {
  _$AuthUserPoolConfig? _$v;

  String? _poolId;
  String? get poolId => _$this._poolId;
  set poolId(String? poolId) => _$this._poolId = poolId;

  String? _region;
  String? get region => _$this._region;
  set region(String? region) => _$this._region = region;

  String? _clientId;
  String? get clientId => _$this._clientId;
  set clientId(String? clientId) => _$this._clientId = clientId;

  String? _clientSecret;
  String? get clientSecret => _$this._clientSecret;
  set clientSecret(String? clientSecret) => _$this._clientSecret = clientSecret;

  Uri? _endpoint;
  Uri? get endpoint => _$this._endpoint;
  set endpoint(Uri? endpoint) => _$this._endpoint = endpoint;

  AuthenticationFlowType? _authFlowType;
  AuthenticationFlowType? get authFlowType => _$this._authFlowType;
  set authFlowType(AuthenticationFlowType? authFlowType) =>
      _$this._authFlowType = authFlowType;

  _i2.ListBuilder<AuthProvider>? _socialProviders;
  _i2.ListBuilder<AuthProvider> get socialProviders =>
      _$this._socialProviders ??= new _i2.ListBuilder<AuthProvider>();
  set socialProviders(_i2.ListBuilder<AuthProvider>? socialProviders) =>
      _$this._socialProviders = socialProviders;

  _i2.ListBuilder<AuthUsernameAttribute>? _usernameAttributes;
  _i2.ListBuilder<AuthUsernameAttribute> get usernameAttributes =>
      _$this._usernameAttributes ??=
          new _i2.ListBuilder<AuthUsernameAttribute>();
  set usernameAttributes(
          _i2.ListBuilder<AuthUsernameAttribute>? usernameAttributes) =>
      _$this._usernameAttributes = usernameAttributes;

  _i2.ListBuilder<CognitoUserAttributeKey>? _signUpAttributes;
  _i2.ListBuilder<CognitoUserAttributeKey> get signUpAttributes =>
      _$this._signUpAttributes ??=
          new _i2.ListBuilder<CognitoUserAttributeKey>();
  set signUpAttributes(
          _i2.ListBuilder<CognitoUserAttributeKey>? signUpAttributes) =>
      _$this._signUpAttributes = signUpAttributes;

  _i2.ListBuilder<CognitoUserAttributeKey>? _verificationMechanisms;
  _i2.ListBuilder<CognitoUserAttributeKey> get verificationMechanisms =>
      _$this._verificationMechanisms ??=
          new _i2.ListBuilder<CognitoUserAttributeKey>();
  set verificationMechanisms(
          _i2.ListBuilder<CognitoUserAttributeKey>? verificationMechanisms) =>
      _$this._verificationMechanisms = verificationMechanisms;

  AnalyticsPinpointConfigBuilder? _pinpointConfig;
  AnalyticsPinpointConfigBuilder get pinpointConfig =>
      _$this._pinpointConfig ??= new AnalyticsPinpointConfigBuilder();
  set pinpointConfig(AnalyticsPinpointConfigBuilder? pinpointConfig) =>
      _$this._pinpointConfig = pinpointConfig;

  AuthPasswordPolicyBuilder? _passwordPolicy;
  AuthPasswordPolicyBuilder get passwordPolicy =>
      _$this._passwordPolicy ??= new AuthPasswordPolicyBuilder();
  set passwordPolicy(AuthPasswordPolicyBuilder? passwordPolicy) =>
      _$this._passwordPolicy = passwordPolicy;

  AuthMfaConfigurationBuilder? _mfaConfiguration;
  AuthMfaConfigurationBuilder get mfaConfiguration =>
      _$this._mfaConfiguration ??= new AuthMfaConfigurationBuilder();
  set mfaConfiguration(AuthMfaConfigurationBuilder? mfaConfiguration) =>
      _$this._mfaConfiguration = mfaConfiguration;

  AuthHostedUiConfigBuilder? _hostedUi;
  AuthHostedUiConfigBuilder get hostedUi =>
      _$this._hostedUi ??= new AuthHostedUiConfigBuilder();
  set hostedUi(AuthHostedUiConfigBuilder? hostedUi) =>
      _$this._hostedUi = hostedUi;

  AuthUserPoolConfigBuilder();

  AuthUserPoolConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _poolId = $v.poolId;
      _region = $v.region;
      _clientId = $v.clientId;
      _clientSecret = $v.clientSecret;
      _endpoint = $v.endpoint;
      _authFlowType = $v.authFlowType;
      _socialProviders = $v.socialProviders?.toBuilder();
      _usernameAttributes = $v.usernameAttributes?.toBuilder();
      _signUpAttributes = $v.signUpAttributes?.toBuilder();
      _verificationMechanisms = $v.verificationMechanisms?.toBuilder();
      _pinpointConfig = $v.pinpointConfig?.toBuilder();
      _passwordPolicy = $v.passwordPolicy?.toBuilder();
      _mfaConfiguration = $v.mfaConfiguration?.toBuilder();
      _hostedUi = $v.hostedUi?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthUserPoolConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthUserPoolConfig;
  }

  @override
  void update(void Function(AuthUserPoolConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthUserPoolConfig build() => _build();

  _$AuthUserPoolConfig _build() {
    _$AuthUserPoolConfig _$result;
    try {
      _$result = _$v ??
          new _$AuthUserPoolConfig._(
              poolId: BuiltValueNullFieldError.checkNotNull(
                  poolId, r'AuthUserPoolConfig', 'poolId'),
              region: BuiltValueNullFieldError.checkNotNull(
                  region, r'AuthUserPoolConfig', 'region'),
              clientId: BuiltValueNullFieldError.checkNotNull(
                  clientId, r'AuthUserPoolConfig', 'clientId'),
              clientSecret: clientSecret,
              endpoint: endpoint,
              authFlowType: authFlowType,
              socialProviders: _socialProviders?.build(),
              usernameAttributes: _usernameAttributes?.build(),
              signUpAttributes: _signUpAttributes?.build(),
              verificationMechanisms: _verificationMechanisms?.build(),
              pinpointConfig: _pinpointConfig?.build(),
              passwordPolicy: _passwordPolicy?.build(),
              mfaConfiguration: _mfaConfiguration?.build(),
              hostedUi: _hostedUi?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'socialProviders';
        _socialProviders?.build();
        _$failedField = 'usernameAttributes';
        _usernameAttributes?.build();
        _$failedField = 'signUpAttributes';
        _signUpAttributes?.build();
        _$failedField = 'verificationMechanisms';
        _verificationMechanisms?.build();
        _$failedField = 'pinpointConfig';
        _pinpointConfig?.build();
        _$failedField = 'passwordPolicy';
        _passwordPolicy?.build();
        _$failedField = 'mfaConfiguration';
        _mfaConfiguration?.build();
        _$failedField = 'hostedUi';
        _hostedUi?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthUserPoolConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
