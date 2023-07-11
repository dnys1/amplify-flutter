// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';

/// {@template subscription_event}
/// An event containing the details of mutations that have occurred on the backend
/// {@endtemplate}
class SubscriptionEvent<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  /// {@macro subscription_event}
  const SubscriptionEvent({
    required this.item,
    required this.eventType,
  });

  /// The item that was created, updated, or deleted
  final M item;

  /// {@macro subscription_event_type}
  final EventType eventType;
}

/// The different type of mutations that may be observed
enum EventType { create, update, delete }
