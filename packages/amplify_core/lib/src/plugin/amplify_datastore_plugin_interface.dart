// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

library amplify_datastore_plugin_interface;

import 'dart:async';

import 'package:amplify_core/amplify_core.dart';
import 'package:meta/meta.dart';

abstract class DataStorePluginInterface extends AmplifyPluginInterface {
  @override
  @nonVirtual
  Category get category => Category.dataStore;

  Future<M?> queryById<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType,
    ModelIdentifier primaryKey,
  ) {
    throw UnimplementedError('queryById() has not been implemented.');
  }

  Future<List<M>> query<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType, {
    QueryPredicate<ModelIdentifier, M>? where,
    QueryPagination? pagination,
    List<QuerySortBy>? sortBy,
  }) {
    throw UnimplementedError('query() has not been implemented.');
  }

  Future<void> delete<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
  }) {
    throw UnimplementedError('delete() has not been implemented.');
  }

  Future<M>
      save<ModelIdentifier extends Object, M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
  }) {
    throw UnimplementedError('save() has not been implemented');
  }

  Stream<SubscriptionEvent<ModelIdentifier, M>> observe<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType, {
    QueryPredicate<ModelIdentifier, M>? where,
  }) {
    throw UnimplementedError('observe() has not been implemented.');
  }

  Stream<QuerySnapshot<ModelIdentifier, M>> observeQuery<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType, {
    QueryPredicate<ModelIdentifier, M>? where,
    List<QuerySortBy>? sortBy,
    ObserveQueryThrottleOptions throttleOptions =
        const ObserveQueryThrottleOptions.defaults(),
  }) {
    throw UnimplementedError('observeQuery() has not been implemented.');
  }

  Future<void> clear() {
    throw UnimplementedError('clear() has not been implemented.');
  }

  Future<void> start() {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<void> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }
}
