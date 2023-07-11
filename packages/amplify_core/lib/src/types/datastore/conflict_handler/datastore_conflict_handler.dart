// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';
import 'package:meta/meta.dart';

@immutable
class ConflictData<
    ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>,
    P extends PartialModel<ModelIdentifier, M>> {
  const ConflictData(this.local, this.remote);

  ConflictData.fromJson(
    ModelType<ModelIdentifier, M, P> modelType,
    Map<String, Object?> localJson,
    Map<String, Object?> remoteJson,
  )   : local = modelType.fromJson<M>(
          (localJson['serializedData'] as Map).cast<String, dynamic>(),
        ),
        remote = modelType.fromJson<M>(
          (remoteJson['serializedData'] as Map).cast<String, dynamic>(),
        );
  final M local;
  final M remote;
}

enum ResolutionStrategy { applyRemote, retryLocal, retry }

@immutable
class ConflictResolutionDecision<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const ConflictResolutionDecision(this._resolutionStrategy, this.customModel);

  const ConflictResolutionDecision.applyRemote()
      : _resolutionStrategy = ResolutionStrategy.applyRemote,
        customModel = null;

  const ConflictResolutionDecision.retryLocal()
      : _resolutionStrategy = ResolutionStrategy.retryLocal,
        customModel = null;

  const ConflictResolutionDecision.retry(M this.customModel)
      : _resolutionStrategy = ResolutionStrategy.retry;

  final ResolutionStrategy _resolutionStrategy;
  final M? customModel;

  @override
  String toString() {
    return 'ConflictResolutionDecision{resolutionStrategy=$_resolutionStrategy,'
        ' customModel=$customModel}';
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'resolutionStrategy': _resolutionStrategy.name,
        'customModel': customModel?.toJson()
      };
}
