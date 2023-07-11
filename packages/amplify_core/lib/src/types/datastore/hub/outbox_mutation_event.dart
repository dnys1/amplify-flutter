// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';

class OutboxMutationEvent extends DataStoreHubEventPayload {
  const OutboxMutationEvent(this.modelName, this.element);
  final HubEventElement element;
  final String modelName;
}
