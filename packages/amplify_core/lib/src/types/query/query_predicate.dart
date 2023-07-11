// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

part of 'query_field.dart';

// Top level global function to be used without the context of the enclosing class
QueryPredicateGroup<ModelIdentifier, M>
    not<ModelIdentifier extends Object, M extends Model<ModelIdentifier, M>>(
  QueryPredicate<ModelIdentifier, M> predicate,
) {
  return QueryPredicateGroup(QueryPredicateGroupType.not, [predicate]);
}

/// Represents individual conditions or groups of conditions
/// that are used to query data
abstract class QueryPredicate<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const QueryPredicate();

  /// A static instance of [QueryPredicate] that matches any object.
  ///
  /// You can use [QueryPredicate.all] with [DataStoreSyncExpression] like this:
  /// ```dart
  /// // A sync expression matching any object of Post
  /// var syncExpression = DataStoreSyncExpresion(
  ///   Post.classType,
  ///   () => QueryPredicate.all,
  /// )
  /// ```
  static QueryPredicate all<ModelIdentifier extends Object,
          M extends Model<ModelIdentifier, M>>() =>
      _QueryPredicateConstant<ModelIdentifier, M>(
        QueryPredicateConstantType.all,
      );

  Map<String, dynamic> serializeAsMap();

  /// Evaluate this predicate
  bool evaluate(M model);
}

// Represents rating > 4
class QueryPredicateOperation<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    extends QueryPredicate<ModelIdentifier, M> {
  const QueryPredicateOperation(this.field, this.queryFieldOperator);
  final String field;
  final QueryFieldOperator queryFieldOperator;

  final String field;
  final QueryFieldOperator<Object?> queryFieldOperator;

  // and
  QueryPredicateGroup<ModelIdentifier, M> and(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) {
    return QueryPredicateGroup(QueryPredicateGroupType.and, [this, predicate]);
  }

  QueryPredicateGroup<ModelIdentifier, M> operator &(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) =>
      and(predicate);

  // or
  QueryPredicateGroup<ModelIdentifier, M> or(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) {
    return QueryPredicateGroup(QueryPredicateGroupType.or, [this, predicate]);
  }

  QueryPredicateGroup<ModelIdentifier, M> operator |(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) =>
      or(predicate);

  @override
  bool evaluate(M model) {
    var fieldName = getFieldName(field);
    //ignore:implicit_dynamic_variable
    final value = model.toJson()[fieldName];
    return queryFieldOperator.evaluate(value);
  }

  @override
  Map<String, dynamic> serializeAsMap() {
    return <String, dynamic>{
      'queryPredicateOperation': <String, dynamic>{
        'field': getFieldName(field),
        'fieldOperator': queryFieldOperator.serializeAsMap(),
      },
    };
  }
}

class QueryByIdentifierOperation<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    extends QueryPredicate<ModelIdentifier, M> {
  const QueryByIdentifierOperation(this.field, this.queryFieldOperator);
  final String field;
  final QueryFieldOperator<ModelIdentifier> queryFieldOperator;

  final String field;
  final QueryFieldOperator<Object?> queryFieldOperator;

  @override
  bool evaluate(M model) {
    return queryFieldOperator.evaluate(model.modelIdentifier);
  }

  @override
  Map<String, dynamic> serializeAsMap() {
    return <String, dynamic>{
      'queryByIdentifierOperation': queryFieldOperator.serializeAsMap(),
    };
  }
}

enum QueryPredicateGroupType { and, or, not }

// Represents rating > 4 & blogName.contains("awesome")
class QueryPredicateGroup<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    extends QueryPredicate<ModelIdentifier, M> {
  final QueryPredicateGroupType type;
  final List<QueryPredicate<ModelIdentifier, M>> predicates;

  // and
  QueryPredicateGroup<ModelIdentifier, M> and(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) {
    if (type == QueryPredicateGroupType.and) {
      predicates.add(predicate);
      return this;
    }
    return QueryPredicateGroup(QueryPredicateGroupType.and, [this, predicate]);
  }

  QueryPredicateGroup<ModelIdentifier, M> operator &(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) =>
      and(predicate);

  // or
  QueryPredicateGroup<ModelIdentifier, M> or(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) {
    if (type == QueryPredicateGroupType.or) {
      predicates.add(predicate);
      return this;
    }
    return QueryPredicateGroup(QueryPredicateGroupType.or, [this, predicate]);
  }

  QueryPredicateGroup<ModelIdentifier, M> operator |(
    QueryPredicate<ModelIdentifier, M> predicate,
  ) =>
      or(predicate);

  @override
  bool evaluate(M model) {
    switch (type) {
      case QueryPredicateGroupType.and:
        return predicates.every((predicate) => predicate.evaluate(model));
      case QueryPredicateGroupType.or:
        return predicates.any((predicate) => predicate.evaluate(model));
      case QueryPredicateGroupType.not:
        return predicates.every((predicate) => !predicate.evaluate(model));
    }
  }

  @override
  Map<String, dynamic> serializeAsMap() {
    return <String, dynamic>{
      'queryPredicateGroup': <String, dynamic>{
        'type': type.name,
        'predicates':
            predicates.map((predicate) => predicate.serializeAsMap()).toList()
      },
    };
  }
}

enum QueryPredicateConstantType { none, all }

class _QueryPredicateConstant<ModelIdentifier extends Object,
        M extends Model<ModelIdentifier, M>>
    extends QueryPredicate<ModelIdentifier, M> {
  final QueryPredicateConstantType _type;

  final QueryPredicateConstantType _type;

  @override
  bool evaluate(M model) => _type == QueryPredicateConstantType.all;

  @override
  Map<String, dynamic> serializeAsMap() {
    return <String, dynamic>{
      'queryPredicateConstant': <String, dynamic>{'type': _type.name},
    };
  }
}
