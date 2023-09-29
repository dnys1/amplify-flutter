import 'dart:collection';

import 'package:amplify_core/amplify_core.dart';
// ignore: implementation_imports
import 'package:amplify_core/src/types/models/mipr.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart' as ast;

// Build a schema which:
// - For every combination of dimensions
// -
// buildField(List<FieldAspect> aspects);
// FieldAspect { apply(gql.FieldBuilder); }
// FieldDimension

final class TestContext {
  const TestContext({
    required this.authConfiguration,
  });

  final TestAuthConfiguration authConfiguration;
}

final class TestAuthConfiguration {
  const TestAuthConfiguration({
    required this.primaryAuthMode,
    this.additionalAuthModes = const [],
  });

  final APIAuthorizationType primaryAuthMode;
  final List<APIAuthorizationType> additionalAuthModes;
}

final class AppSyncResolverConfiguration {
  const AppSyncResolverConfiguration();
}

final class FieldTestCases extends Iterable<ast.FieldDefinitionNode> {
  FieldTestCases({
    this.authDimensions,
    this.nameDimensions,
  });

  factory FieldTestCases.forContext(TestContext context) {
    final authDimensions = FieldAuthDimensions.forConfiguration(
      context.authConfiguration,
    );
    return FieldTestCases(authDimensions: authDimensions);
  }

  final FieldDimensionGroup<FieldAuthDimension>? authDimensions;
  final FieldDimensionGroup<FieldNameDimension>? nameDimensions;

  @override
  Iterator<ast.FieldDefinitionNode> get iterator => _cases.iterator;

  Iterable<ast.FieldDefinitionNode> get _cases sync* {
    final permutations = _permute([
      if (authDimensions != null) authDimensions!,
      if (nameDimensions != null) nameDimensions!,
    ]);
    for (final permutation in permutations) {
      final field = FieldDefinitionNodeBuilder();
      for (final dimension in permutation) {
        dimension.apply(field);
      }
      yield field.build();
    }
  }

  /// Creates all permutations of the dimension [groups].
  static Iterable<Iterable<FieldDimension>> _permute(
    List<FieldDimensionGroup> groups,
  ) {
    throw UnimplementedError();
  }
}

sealed class FieldDimensionGroup<T extends FieldDimension>
    implements Iterable<T> {
  factory FieldDimensionGroup.all(List<FieldDimensionGroup<T>> groups) =
      _FieldDimensionMultiGroup<T>;
}

final class _FieldDimensionMultiGroup<T extends FieldDimension>
    extends DelegatingIterable<T> implements FieldDimensionGroup<T> {
  _FieldDimensionMultiGroup(List<FieldDimensionGroup<T>> groups)
      : super(groups.flattened);
}

sealed class FieldDimension {
  void apply(FieldDefinitionNodeBuilder field);
}

sealed class AuthDimension {}

final class FieldNameDimensions extends Iterable<FieldNameDimension>
    implements FieldDimensionGroup<FieldNameDimension> {
  const FieldNameDimensions();

  @override
  Iterator<FieldNameDimension> get iterator =>
      FieldNameDimension.values.iterator;
}

enum FieldNameDimension implements FieldDimension {
  snake,
  screaming,
  pascal,
  camel;

  @override
  void apply(FieldDefinitionNodeBuilder field) {
    assert(field.name == null, 'Cannot overwrite existing name');
    field.name = ast.NameNode(
      value: switch (this) {
        FieldNameDimension.snake => '',
        FieldNameDimension.screaming => '',
        FieldNameDimension.pascal => '',
        FieldNameDimension.camel => '',
      },
    );
  }
}

final class FieldAuthDimensions extends DelegatingIterable<FieldAuthDimension>
    implements FieldDimensionGroup<FieldAuthDimension> {
  FieldAuthDimensions([Iterable<FieldAuthDimension>? select])
      : super(select ?? buildDimensions());

  factory FieldAuthDimensions.forConfiguration(TestAuthConfiguration config) {
    return FieldAuthDimensions(
      buildDimensions(
        authModes: [config.primaryAuthMode, ...config.additionalAuthModes],
      ),
    );
  }

  static Iterable<FieldAuthDimension> buildDimensions({
    List<APIAuthorizationType> authModes = APIAuthorizationType.values,
  }) sync* {
    // No field-auth mode
    yield const FieldAuthDimension.defer();

    // Single field-auth mode
    for (final authMode in authModes) {
      switch (authMode) {
        case APIAuthorizationType.apiKey:
          yield FieldAuthDimension([
            AuthRule.public(),
          ]);
        case APIAuthorizationType.userPools:
        // yield FieldAuthDimension(authRules)
        case APIAuthorizationType.function:
        // yield FieldAuthDimension();
        // Groups requires either a `groups` array or a `groupsField` reference.

        case APIAuthorizationType.iam:
          // TODO: Handle this case.
          break;
        case APIAuthorizationType.oidc:
          // TODO: Handle this case.
          break;
        case APIAuthorizationType.none:
          break;
      }
    }

    // Multiple field-auth modes

    // All 2-auth modes
  }
}

final class FieldAuthDimension implements FieldDimension {
  const FieldAuthDimension(this.authRules);
  const FieldAuthDimension.defer() : authRules = const [];

  static Iterable<AuthRule> apiKeyRules() sync* {}

  final List<AuthRule> authRules;

  @override
  void apply(FieldDefinitionNodeBuilder field) {}
}

// extension AuthRuleDirective on AuthRule {
//   ast.DirectiveNode get directive {
//     ast.DirectiveNode(name: 'auth')
//   }
// }

class ObjectTypeDefinitionNodeBuilder {
  ast.NameNode? name;
  ast.StringValueNode? description;
  final List<ast.DirectiveNode> directives = [];
  final List<ast.NamedTypeNode> interfaces = [];
  final List<ast.FieldDefinitionNode> fields = [];

  ast.ObjectTypeDefinitionNode build() => ast.ObjectTypeDefinitionNode(
        name: name!,
        description: description,
        directives: directives,
        interfaces: interfaces,
        fields: fields,
      );
}

class FieldDefinitionNodeBuilder {
  ast.StringValueNode? description;
  ast.NameNode? name;
  ast.TypeNode? type;
  final List<ast.DirectiveNode> directives = [];
  final List<ast.InputValueDefinitionNode> args = [];

  void applyAll(List<FieldDimension> dimensions) {
    for (final dimension in dimensions) {
      dimension.apply(this);
    }
  }

  ast.FieldDefinitionNode build() => ast.FieldDefinitionNode(
        name: name!,
        type: type!,
        description: description,
        directives: directives,
        args: args,
      );
}
