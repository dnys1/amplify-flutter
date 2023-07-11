// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

part of 'hub_event_element.dart';

/// The model and metadata associated with a DataStore `outboxMutationProcessed`
/// Hub event.
class HubEventElementWithMetadata<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    extends HubEventElement<ModelIdentifier, M> {
  const HubEventElementWithMetadata(
    M model, {
    required this.version,
    required this.lastChangedAt,
    bool? deleted,
  })  : deleted = deleted ?? false,
        super(model);

  /// The version of the model.
  final int version;

  /// The last time the model was updated locally, in seconds since epoch.
  final int lastChangedAt;

  /// Whether or not the model was deleted.
  final bool deleted;
}
