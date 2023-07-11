// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

// ignore_for_file: public_member_api_docs

import 'package:amplify_api_dart/src/graphql/utils.dart';
import 'package:amplify_core/amplify_core.dart';

class GraphQLResponseDecoder {
  // Singleton methods/properties
  // usage: GraphQLResponseDecoder.instance;
  GraphQLResponseDecoder._();

  static final GraphQLResponseDecoder _instance = GraphQLResponseDecoder._();

  static GraphQLResponseDecoder get instance => _instance;

  GraphQLResponse<T> decode<T>({
    required GraphQLRequest<T> request,
    required Map<String, Object?> response,
  }) {
    final errors = _deserializeGraphQLResponseErrors(response);
    final data = response['data'];
    if (data == null) {
      return GraphQLResponse(data: null, errors: errors);
    }
    // From here, it appears this is a response that must be parsed into a non-string object.
    if (request.decodePath == null) {
      throw const ApiOperationException(
        'No decodePath found',
        recoverySuggestion: 'Include decodePath when creating a request',
      );
    }

    // Even if the data string is not null, it may be a null value shallow
    // nested in a small JSON object in the `decodePath`. Its structure varies by
    // platform when null. Unpack the JSON object and null check the result along
    // the way. If null at any point, return null response.
    var dataJson = data as Map<String, dynamic>?;
    if (dataJson == null) {
      return GraphQLResponse(data: null, errors: errors);
    }
    request.decodePath!.split('.').forEach((element) {
      if (!dataJson!.containsKey(element)) {
        throw const ApiOperationException(
          'decodePath did not match the structure of the JSON response',
          recoverySuggestion: 'Include decodePath when creating a request '
              'that includes a modelType.',
        );
      }
      dataJson = (dataJson![element] as Map?)?.cast();
    });
    if (dataJson == null) {
      return GraphQLResponse(data: null, errors: errors);
    }
    return GraphQLResponse<T>(
      data: request.decode(dataJson!),
      errors: errors,
    );
  }
}

List<GraphQLResponseError> _deserializeGraphQLResponseErrors(
  Map<String, dynamic>? response,
) {
  final errors = response?['errors'] as List?;
  if (errors == null || errors.isEmpty) {
    return [];
  }
  return errors
      .cast<Map<String, dynamic>>()
      .map(GraphQLResponseError.fromJson)
      .toList();
}
