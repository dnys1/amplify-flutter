// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/stream_utils/throttle.dart';
import 'package:async/async.dart';

typedef Query<
        ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>,
        P extends PartialModel<ModelIdentifier, M>>
    = Future<List<M>> Function(
  ModelType<ModelIdentifier, M, P> modelType, {
  QueryPredicate? where,
  QueryPagination? pagination,
  List<QuerySortBy>? sortBy,
});

typedef Observe<
        ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>,
        P extends PartialModel<ModelIdentifier, M>>
    = Stream<SubscriptionEvent<ModelIdentifier, M>> Function(
  ModelType<ModelIdentifier, M, P> modelType,
);

/// A class for handling observeQuery operations
class ObserveQueryExecutor {
  final Stream<dynamic> dataStoreEventStream;

  ObserveQueryExecutor({
    required this.dataStoreEventStream,
  }) : _dataStoreHubEventStream = dataStoreEventStream
            .where((event) => event is DataStoreHubEvent)
            .cast<DataStoreHubEvent>()
            .asBroadcastStream() {
    _initModelSyncCache();
  }

  /// A stream of ModelSyncEvents
  final Stream<DataStoreHubEvent> _dataStoreHubEventStream;

  /// a cache of modelSyncEvents in the format {'<Model_Name>': true}
  final Map<String, _ModelSyncStatus> _modelSyncCache = {};

  /// executes an observeQuery operation
  Stream<QuerySnapshot<ModelIdentifier, M>> observeQuery<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>({
    required Query<ModelIdentifier, M, P> query,
    required Observe<ModelIdentifier, M, P> observe,
    required ModelType<ModelIdentifier, M, P> modelType,
    QueryPredicate? where,
    List<QuerySortBy>? sortBy,
    ObserveQueryThrottleOptions throttleOptions =
        const ObserveQueryThrottleOptions.defaults(),
  }) {
    // cached QuerySnapshot
    QuerySnapshot<ModelIdentifier, M>? querySnapshot;

    // cached subscription events that occur prior to the
    // initial query completing
    List<SubscriptionEvent<ModelIdentifier, M>> subscriptionEvents = [];

    Stream<QuerySnapshot<ModelIdentifier, M>> syncStatusStream =
        _isModelSyncedStream(modelType)
            .skipWhile((element) => querySnapshot == null)
            .where((event) => event != querySnapshot!.isSynced)
            .map<QuerySnapshot<ModelIdentifier, M>>((value) {
      querySnapshot = querySnapshot!.withSyncStatus(value);
      return querySnapshot!;
    });

    Stream<QuerySnapshot<ModelIdentifier, M>> observeStream = observe(modelType)
        .map<QuerySnapshot<ModelIdentifier, M>?>((event) {
          // cache subscription events until the initial query is returned
          if (querySnapshot == null) {
            subscriptionEvents.add(event);
            return null;
          }

          // apply the most recent event to the cached QuerySnapshot
          var updatedQuerySnapshot = querySnapshot!.withSubscriptionEvent(
            event: event,
          );

          // if the snapshot has not changed, return null
          if (querySnapshot == updatedQuerySnapshot) {
            return null;
          }

          // otherwise, update the cached QuerySnapshot and return it
          querySnapshot = updatedQuerySnapshot;
          return querySnapshot;
        })
        // filter out null values
        .where((event) => event != null)
        .cast<QuerySnapshot<ModelIdentifier, M>>();

    Future<QuerySnapshot<ModelIdentifier, M>> queryFuture = query(
      modelType,
      where: where,
      sortBy: sortBy,
    ).then((value) {
      // create & cache the intitial QuerySnapshot
      querySnapshot = QuerySnapshot(
        items: value,
        isSynced: _isModelSyncComplete(modelType),
        where: where,
        sortBy: sortBy,
      );

      // apply any cached subscription events
      for (var event in subscriptionEvents) {
        querySnapshot = querySnapshot!.withSubscriptionEvent(event: event);
      }

      // return the QuerySnapshot
      return querySnapshot!;
    });

    final queryStream = Stream.fromFuture(queryFuture);

    return StreamGroup.mergeBroadcast([
      observeStream,
      queryStream,
      syncStatusStream,
    ]).throttleByCountAndTime(
      throttleCount: throttleOptions.maxCount,
      duration: throttleOptions.maxDuration,
      throttleIf: (event) => _isModelSyncStarted(modelType),
    );
  }

  Stream<bool> _isModelSyncedStream(ModelType type) {
    return _dataStoreHubEventStream
        .map((event) => event.payload)
        .where((payload) => payload is ModelSyncedEvent)
        .cast<ModelSyncedEvent>()
        .where((event) => event.modelName == type.modelName)
        .map((event) => true);
  }

  _ModelSyncStatus _getModelSyncStatus(ModelType type) {
    _ModelSyncStatus? status = _modelSyncCache[type.modelName];
    return status ?? _ModelSyncStatus.none;
  }

  bool _isModelSyncComplete(ModelType type) {
    return _getModelSyncStatus(type) == _ModelSyncStatus.complete;
  }

  bool _isModelSyncStarted(ModelType type) {
    return _getModelSyncStatus(type) == _ModelSyncStatus.started;
  }

  void _initModelSyncCache() {
    this
        ._dataStoreHubEventStream
        .map((event) => event.payload)
        .listen((payload) {
      if (payload is ModelSyncedEvent) {
        _modelSyncCache[payload.modelName] = _ModelSyncStatus.complete;
      } else if (payload is SyncQueriesStartedEvent) {
        payload.models.forEach((model) {
          _modelSyncCache[model] = _ModelSyncStatus.started;
        });
      }
    });
  }
}

enum _ModelSyncStatus { none, started, complete }
