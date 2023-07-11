// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';

part 'hub_event_element_with_metadata.dart';

/// The model associated with a DataStore `outboxMutationEnqueued` or
/// `outboxMutationProcessed` Hub event.
class HubEventElement<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const HubEventElement(this.model);

  /// The instance of the mutated model.
  final M model;
}
