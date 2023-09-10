// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:aws_common/aws_common.dart';

/// {@template aws_common.config.aws_region}
/// The AWS region to send requests to.
///
/// The region MUST be specified on a request. It may be configured globally or on a
/// per-client basis unless otherwise noted.
///
/// See [Regions and Endpoints](http://docs.aws.amazon.com/general/latest/gr/rande.html)
/// for a full list and for more information on AWS regions.
/// {@endtemplate}
final class AWSRegion
    with AWSDebuggable, AWSEquatable<AWSRegion>
    implements AWSConfigValueResolver<AWSRegion> {
  /// {@macro aws_common.config.aws_region}
  const AWSRegion(this.name);

  /// The US East (N. Virginia) region.
  static const AWSRegion usEast1 = AWSRegion('us-east-1');

  /// The US East (Ohio) region.
  static const AWSRegion usEast2 = AWSRegion('us-east-2');

  /// The US West (N. California) region.
  static const AWSRegion usWest1 = AWSRegion('us-west-1');

  /// The US West (Oregon) region.
  static const AWSRegion usWest2 = AWSRegion('us-west-2');

  /// The Africa (Cape Town) region.
  static const AWSRegion afSouth1 = AWSRegion('af-south-1');

  /// The Asia Pacific (Hong Kong) region.
  static const AWSRegion apEast1 = AWSRegion('ap-east-1');

  /// The Asia Pacific (Hyderabad) region.
  static const AWSRegion apSouth2 = AWSRegion('ap-south-2');

  /// The Asia Pacific (Jakarta) region.
  static const AWSRegion apSoutheast3 = AWSRegion('ap-southeast-3');

  /// The Asia Pacific (Melbourne) region.
  static const AWSRegion apSoutheast4 = AWSRegion('ap-southeast-4');

  /// The Asia Pacific (Mumbai) region.
  static const AWSRegion apSouth1 = AWSRegion('ap-south-1');

  /// The Asia Pacific (Osaka) region.
  static const AWSRegion apNortheast3 = AWSRegion('ap-northeast-3');

  /// The Asia Pacific (Seoul) region.
  static const AWSRegion apNortheast2 = AWSRegion('ap-northeast-2');

  /// The Asia Pacific (Singapore) region.
  static const AWSRegion apSoutheast1 = AWSRegion('ap-southeast-1');

  /// The Asia Pacific (Sydney) region.
  static const AWSRegion apSoutheast2 = AWSRegion('ap-southeast-2');

  /// The Asia Pacific (Tokyo) region.
  static const AWSRegion apNortheast1 = AWSRegion('ap-northeast-1');

  /// The Canada (Central) region.
  static const AWSRegion caCentral1 = AWSRegion('ca-central-1');

  /// The Europe (Frankfurt) region.
  static const AWSRegion euCentral1 = AWSRegion('eu-central-1');

  /// The Europe (Ireland) region.
  static const AWSRegion euWest1 = AWSRegion('eu-west-1');

  /// The Europe (London) region.
  static const AWSRegion euWest2 = AWSRegion('eu-west-2');

  /// The Europe (Milan) region.
  static const AWSRegion euSouth1 = AWSRegion('eu-south-1');

  /// The Europe (Paris) region.
  static const AWSRegion euWest3 = AWSRegion('eu-west-3');

  /// The Europe (Spain) region.
  static const AWSRegion euSouth2 = AWSRegion('eu-south-2');

  /// The Europe (Stockholm) region.
  static const AWSRegion euNorth1 = AWSRegion('eu-north-1');

  /// The Europe (Zurich) region.
  static const AWSRegion euCentral2 = AWSRegion('eu-central-2');

  /// The Israel (Tel Aviv) region.
  static const AWSRegion ilCentral1 = AWSRegion('il-central-1');

  /// The Middle East (Bahrain) region.
  static const AWSRegion meSouth1 = AWSRegion('me-south-1');

  /// The Middle East (UAE) region.
  static const AWSRegion meCentral1 = AWSRegion('me-central-1');

  /// The South America (São Paulo) region.
  static const AWSRegion saEast1 = AWSRegion('sa-east-1');

  /// The AWS GovCloud (US-East) region.
  static const AWSRegion usGovEast1 = AWSRegion('us-gov-east-1');

  /// The AWS GovCloud (US-West) region.
  static const AWSRegion usGovWest1 = AWSRegion('us-gov-west-1');

  /// The name of the region, e.g. `us-east-1`.
  final String name;

  @override
  List<Object?> get props => [name];

  @override
  String get runtimeTypeName => 'AWSRegion';

  @override
  String toString() => name;

  @override
  AWSRegion resolve() => this;
}
