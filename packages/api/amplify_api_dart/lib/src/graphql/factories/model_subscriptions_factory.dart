// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_api_dart/src/graphql/factories/graphql_request_factory.dart';
import 'package:amplify_core/amplify_core.dart';

// ignore_for_file: public_member_api_docs

class ModelSubscriptionsFactory {
  // Singleton methods/properties
  // usage: ModelSubscriptionsFactory.instance;
  ModelSubscriptionsFactory._();

  static final ModelSubscriptionsFactory _instance =
      ModelSubscriptionsFactory._();

  static ModelSubscriptionsFactory get instance => _instance;

  @override
  GraphQLRequest<M> onCreate<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType, {
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
    QueryPredicate? where,
  }) {
    return GraphQLRequestFactory.instance.buildRequest<ModelIdentifier, M>(
      modelType: modelType,
      variables: variables,
      requestType: GraphQLRequestType.subscription,
      requestOperation: GraphQLRequestOperation.onCreate,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }

  @override
  @override
  GraphQLRequest<M> onUpdate<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType, {
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
    QueryPredicate? where,
  }) {
    return GraphQLRequestFactory.instance.buildRequest<ModelIdentifier, M>(
      modelType: modelType,
      variables: variables,
      requestType: GraphQLRequestType.subscription,
      requestOperation: GraphQLRequestOperation.onUpdate,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }

  @override
  @override
  GraphQLRequest<M> onDelete<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType, {
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
    QueryPredicate? where,
  }) {
    return GraphQLRequestFactory.instance.buildRequest<ModelIdentifier, M>(
      modelType: modelType,
      variables: variables,
      requestType: GraphQLRequestType.subscription,
      requestOperation: GraphQLRequestOperation.onDelete,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }
}
