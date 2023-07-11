// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';

/// A GraphQL request with a few extra properties used to decode the response or use the correct API if the backend has multiple.
abstract class GraphQLRequest<T>
    with AWSSerializable<Map<String, Object?>>, AWSDebuggable {
  GraphQLRequest({
    this.apiName,
    required this.document,
    this.variables = const <String, dynamic>{},
    this.headers,
    this.decodePath,
    this.authorizationMode,
  });

  /// Creates a "raw" GraphQL request which returns the data received from
  /// the server without any additional processing.
  ///
  /// If [decodePath] is specified, the object returned is the one located at
  /// the JSON key given by [decodePath].
  static GraphQLRequest<T> raw<T extends Object?>({
    String? apiName,
    required String document,
    Map<String, Object?> variables = const {},
    Map<String, String>? headers,
    String? decodePath,
    APIAuthorizationType? authorizationMode,
  }) =>
      _RawGraphQLRequest(
        apiName: apiName,
        document: document,
        variables: variables,
        headers: headers,
        decodePath: decodePath,
        authorizationMode: authorizationMode,
      );

  /// Creates a GraphQL request for a [modelType].
  ///
  /// The response will be automatically decoded into a model of type [T].
  static GraphQLRequest<T> model<
          ModelIdentifier extends Object,
          M extends Model<ModelIdentifier, M>,
          P extends PartialModel<ModelIdentifier, M>,
          T extends P>({
    String? apiName,
    required String document,
    required ModelType<ModelIdentifier, M, P> modelType,
    Map<String, Object?> variables = const {},
    Map<String, String>? headers,
    String? decodePath,
    APIAuthorizationType? authorizationMode,
  }) =>
      _ModelGraphQLRequest(
        apiName: apiName,
        document: document,
        variables: variables,
        headers: headers,
        decodePath: decodePath,
        modelType: modelType,
        authorizationMode: authorizationMode,
      );

  /// Creates a GraphQL request for listing a [modelType].
  ///
  /// The response will be automatically decoded into a [PaginatedResult] of
  /// type [T] with helpers for requesting subsequent pages.
  static GraphQLRequest<PaginatedResult<ModelIdentifier, M, P, T>> list<
          ModelIdentifier extends Object,
          M extends Model<ModelIdentifier, M>,
          P extends PartialModel<ModelIdentifier, M>,
          T extends P>({
    String? apiName,
    required String document,
    required ModelType<ModelIdentifier, M, P> modelType,
    Map<String, Object?> variables = const {},
    Map<String, String>? headers,
    String? decodePath,
    APIAuthorizationType? authorizationMode,
  }) =>
      _ListGraphQLRequest(
        apiName: apiName,
        document: document,
        variables: variables,
        headers: headers,
        decodePath: decodePath,
        modelType: modelType,
        authorizationMode: authorizationMode,
      );

  /// A unique identifier for the request.
  final String id = uuid();

  /// The body of the request, starting with the operation type and operation name.
  ///
  /// See https://graphql.org/learn/queries/#operation-name for examples and more information.
  final String document;

  /// Only required if your backend has multiple GraphQL endpoints in the amplifyconfiguration.dart file. This parameter is then needed to specify which one to use for this request.
  final String? apiName;

  /// A map of Strings to dynamically use for custom headers in the http request.
  final Map<String, String>? headers;

  /// Authorization type to use for this request.
  ///
  /// If not supplied, the request will use the default endpoint mode.
  final APIAuthorizationType? authorizationMode;

  /// A map of values to dynamically use for variable names in the `document`.
  ///
  /// See https://graphql.org/learn/queries/#variables for more information.
  final Map<String, dynamic> variables;

  /// Only required for custom decoding logic. In most cases, will match the operation name in the `document`.
  ///
  /// See https://docs.amplify.aws/lib/graphqlapi/advanced-workflows/q/platform/flutter/.
  final String? decodePath;

  /// Only required for custom decoding logic. The response will be decoded to this type.
  /// For a request of a single instance (like get, update, create or delete):
  ///
  /// ```dart
  /// modelType: Blog.classType
  /// ```
  ///
  /// Or for a list request:
  ///
  /// ```dart
  /// modelType: const PaginatedModelType(Blog.classType)
  /// ```
  ///
  /// See https://docs.amplify.aws/lib/graphqlapi/advanced-workflows/q/platform/flutter/.
  T decode(Map<String, Object?> json);

  @override
  String get runtimeTypeName => 'GraphQLRequest';

  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'apiName': apiName,
        'document': document,
        'variables': variables,
        'headers': headers,
        'decodePath': decodePath,
      };
}

class _RawGraphQLRequest<T extends Object?> extends GraphQLRequest<T> {
  _RawGraphQLRequest({
    super.apiName,
    required super.document,
    super.variables,
    super.headers,
    super.decodePath,
    super.authorizationMode,
  });

  @override
  T decode(Map<String, Object?> json) {
    final value = decodePath == null ? json : json[decodePath];
    if (value is! T) {
      throw ApiOperationException(
        'Expected a value of type $T but received $value',
        recoverySuggestion: 'Check the value of decodePath',
      );
    }
    return value;
  }
}

class _ModelGraphQLRequest<
    ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>,
    T extends PartialModel<ModelIdentifier, M>> extends GraphQLRequest<T> {
  _ModelGraphQLRequest({
    super.apiName,
    required super.document,
    super.variables,
    super.headers,
    super.decodePath,
    required this.modelType,
    super.authorizationMode,
  });

  final ModelType<ModelIdentifier, M, dynamic> modelType;

  @override
  T decode(Map<String, Object?> json) {
    return modelType.fromJson<T>(json);
  }
}

class _ListGraphQLRequest<
        ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>,
        P extends PartialModel<ModelIdentifier, M>,
        T extends PartialModel<ModelIdentifier, M>>
    extends GraphQLRequest<PaginatedResult<ModelIdentifier, M, P, T>> {
  _ListGraphQLRequest({
    super.apiName,
    required super.document,
    super.variables,
    super.headers,
    super.decodePath,
    required this.modelType,
    super.authorizationMode,
  });

  /// The GraphQL parameter for locating the next pagination token.
  static const _nextToken = 'nextToken';

  final ModelType<ModelIdentifier, M, P> modelType;

  @override
  PaginatedResult<ModelIdentifier, M, P, T> decode(Map<String, Object?> json) {
    final itemsJson = json['items'] as List?;

    if (itemsJson == null || itemsJson.isEmpty) {
      return const PaginatedResult.empty();
    }

    final items = itemsJson
        .cast<Map<String, Object?>?>()
        .nonNulls
        .map(modelType.fromJson<T>)
        .toList();

    final nextToken = json[_nextToken] as String?;

    return PaginatedResult(
      items: items,
      requestForNextResult: nextToken == null
          ? null
          : _ListGraphQLRequest<ModelIdentifier, M, P, T>(
              apiName: apiName,
              document: document,
              variables: {...variables, _nextToken: nextToken},
              headers: headers,
              decodePath: decodePath,
              modelType: modelType,
            ),
      limit: variables['limit'] as int?,
      filter: variables['filter'] as Map<String, Object?>?,
      nextToken: nextToken,
    );
  }
}
