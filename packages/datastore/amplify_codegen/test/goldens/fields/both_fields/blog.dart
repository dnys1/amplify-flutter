// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: non_constant_identifier_names,inference_failure_on_collection_literal

library models.blog;

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;

import 'post.dart';

class BlogType extends ModelType<String, Blog, PartialBlog> {
  const BlogType();

  @override
  T fromJson<T extends PartialModel<String, Blog>>(Map<String, Object?> json) {
    if (T == Blog || T == Model<String, Blog>) {
      return Blog.fromJson(json) as T;
    }
    if (T == RemoteBlog || T == RemoteModel<String, Blog>) {
      return _RemoteBlog.fromJson(json) as T;
    }
    return _PartialBlog.fromJson(json) as T;
  }

  @override
  String get modelName => 'Blog';
}

class BlogQueryFields<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const BlogQueryFields([this._root]);

  final QueryField<ModelIdentifier, M, Blog>? _root;

  /// Query field for the [Blog.id] field.
  QueryField<ModelIdentifier, M, String> get $id =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String>(
        const QueryField<String, Blog, String>(fieldName: 'id'),
        root: _root,
      );

  /// Query field for the [Blog.title] field.
  QueryField<ModelIdentifier, M, String> get $title =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String>(
        const QueryField<String, Blog, String>(fieldName: 'title'),
        root: _root,
      );

  /// Query field for the [Blog.posts] field.
  PostQueryFields<ModelIdentifier, M> get $posts => PostQueryFields(
        NestedQueryField<ModelIdentifier, M, String, Blog, Post>(
          const QueryField<String, Blog, Post>(fieldName: 'posts'),
          root: _root,
        ),
      );

  /// Query field for the [Blog.createdAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $createdAt =>
      NestedQueryField<ModelIdentifier, M, String, Blog, TemporalDateTime>(
        const QueryField<String, Blog, TemporalDateTime>(
          fieldName: 'createdAt',
        ),
        root: _root,
      );

  /// Query field for the [Blog.updatedAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $updatedAt =>
      NestedQueryField<ModelIdentifier, M, String, Blog, TemporalDateTime>(
        const QueryField<String, Blog, TemporalDateTime>(
          fieldName: 'updatedAt',
        ),
        root: _root,
      );

  /// Query field for the [Blog] model identifier.
  QueryField<ModelIdentifier, M, String> get $modelIdentifier =>
      NestedQueryField<ModelIdentifier, M, String, Blog, String>(
        const QueryField<String, Blog, String>(fieldName: 'modelIdentifier'),
        root: _root,
      );
}

abstract class PartialBlog extends PartialModel<String, Blog>
    with AWSEquatable<PartialBlog> {
  const PartialBlog._();

  String get id;
  String? get title;
  AsyncModelCollection<String, Post, PartialPost, PartialPost>? get posts;
  TemporalDateTime? get createdAt;
  TemporalDateTime? get updatedAt;
  @override
  String get modelIdentifier => id;
  @override
  BlogType get modelType => Blog.classType;
  @override
  List<Object?> get props => [
        id,
        title,
        posts,
        createdAt,
        updatedAt,
      ];
  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'posts': posts?.toJson(),
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format(),
        '_version': version,
        '_deleted': deleted,
        '_lastChangedAt': lastChangedAt?.format(),
      };
  @override
  String get runtimeTypeName => 'Blog';
}

class _PartialBlog extends PartialBlog {
  const _PartialBlog({
    required this.id,
    this.title,
    this.posts,
    this.createdAt,
    this.updatedAt,
  }) : super._();

  factory _PartialBlog.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Blog',
            'id',
          ))
        : (json['id'] as String);
    final title = json['title'] == null ? null : (json['title'] as String);
    final createdAt = json['createdAt'] == null
        ? null
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? null
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final posts = json['posts'] == null
        ? null
        : AsyncModelCollection<String, Post, PartialPost, PartialPost>.fromList(
            (json['posts'] as List<Object?>)
                .cast<Map<String, Object?>?>()
                .map(
                  (el) => el == null
                      ? (throw ModelFieldError(
                          'Blog',
                          'posts',
                        ))
                      : Post.classType.fromJson<PartialPost>(el),
                )
                .toList(),
          );
    return _PartialBlog(
      id: id,
      title: title,
      posts: posts,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  final String id;

  @override
  final String? title;

  @override
  final AsyncModelCollection<String, Post, PartialPost, PartialPost>? posts;

  @override
  final TemporalDateTime? createdAt;

  @override
  final TemporalDateTime? updatedAt;
}

abstract class Blog extends PartialBlog
    with LegacyModelFields<String, Blog>
    implements Model<String, Blog> {
  factory Blog({
    String? id,
    required String title,
    List<Post>? posts,
  }) = _Blog;

  const Blog._() : super._();

  factory Blog.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Blog',
            'id',
          ))
        : (json['id'] as String);
    final title = json['title'] == null
        ? (throw ModelFieldError(
            'Blog',
            'title',
          ))
        : (json['title'] as String);
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final posts = json['posts'] == null
        ? null
        : AsyncModelCollection<String, Post, PartialPost, Post>.fromList(
            (json['posts'] as List<Object?>)
                .cast<Map<String, Object?>?>()
                .map(
                  (el) => el == null
                      ? (throw ModelFieldError(
                          'Blog',
                          'posts',
                        ))
                      : Post.classType.fromJson<Post>(el),
                )
                .toList(),
          );
    return _Blog._(
      id: id,
      title: title,
      posts: posts,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static const BlogType classType = BlogType();

  static const BlogQueryFields<String, Blog> _queryFields = BlogQueryFields();

  static final mipr.ModelTypeDefinition schema =
      mipr.serializers.deserializeWith(
    mipr.ModelTypeDefinition.serializer,
    const [
      'name',
      'Blog',
      'pluralName',
      'Blogs',
      'fields',
      [
        'id',
        [
          'name',
          'id',
          'type',
          [
            'scalar',
            'ID',
            true,
          ],
          'isReadOnly',
          false,
          'authRules',
          [],
        ],
        'title',
        [
          'name',
          'title',
          'type',
          [
            'scalar',
            'String',
            true,
          ],
          'isReadOnly',
          false,
          'authRules',
          [],
        ],
        'posts',
        [
          'name',
          'posts',
          'type',
          [
            'list',
            [
              'model',
              'Post',
              true,
            ],
            false,
          ],
          'isReadOnly',
          false,
          'authRules',
          [],
          'association',
          [
            'associationType',
            'HasMany',
            'associatedType',
            'Post',
            'associatedFields',
            ['blog'],
          ],
        ],
        'createdAt',
        [
          'name',
          'createdAt',
          'type',
          [
            'scalar',
            'AWSDateTime',
            true,
          ],
          'isReadOnly',
          true,
          'authRules',
          [],
        ],
        'updatedAt',
        [
          'name',
          'updatedAt',
          'type',
          [
            'scalar',
            'AWSDateTime',
            true,
          ],
          'isReadOnly',
          true,
          'authRules',
          [],
        ],
      ],
      'authRules',
      [],
      'indexes',
      [
        [
          'type',
          'primary',
          'primaryField',
          'id',
          'sortKeyFields',
          [],
        ]
      ],
    ],
  )!;

  @override
  String get id;

  /// Query field for the [id] field.
  static QueryField<String, Blog, String> get $id => _queryFields.$id;

  /// Query field for the [id] field.
  @Deprecated(r'Use $id instead')
  static QueryField<String, Blog, String> get ID => $id;
  @override
  String get title;

  /// Query field for the [title] field.
  static QueryField<String, Blog, String> get $title => _queryFields.$title;

  /// Query field for the [title] field.
  @Deprecated(r'Use $title instead')
  static QueryField<String, Blog, String> get TITLE => $title;
  @override
  AsyncModelCollection<String, Post, PartialPost, Post>? get posts;

  /// Query field for the [posts] field.
  static PostQueryFields<String, Blog> get $posts => _queryFields.$posts;

  /// Query field for the [posts] field.
  @Deprecated(r'Use $posts instead')
  static PostQueryFields<String, Blog> get POSTS => $posts;
  @override
  TemporalDateTime get createdAt;
  @override
  TemporalDateTime get updatedAt;

  /// Query field for the [modelIdentifier] field.
  static QueryField<String, Blog, String> get $modelIdentifier =>
      _queryFields.$modelIdentifier;

  /// Query field for the [modelIdentifier] field.
  @Deprecated(r'Use $modelIdentifier instead')
  static QueryField<String, Blog, String> get MODEL_IDENTIFIER =>
      $modelIdentifier;
  Blog copyWith({
    String? id,
    String? title,
    List<Post>? posts,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return _Blog._(
      id: id ?? this.id,
      title: title ?? this.title,
      posts: posts == null ? this.posts : AsyncModelCollection.fromList(posts),
      createdAt:
          createdAt == null ? this.createdAt : TemporalDateTime(createdAt),
      updatedAt:
          updatedAt == null ? this.updatedAt : TemporalDateTime(updatedAt),
    );
  }

  @override
  T valueFor<T extends Object?>(QueryField<String, Blog, T> field) {
    Object? value;
    switch (field.fieldName) {
      case r'id':
        value = id;
        break;
      case r'title':
        value = title;
        break;
      case r'posts':
        value = posts;
        break;
      case r'createdAt':
        value = createdAt;
        break;
      case r'updatedAt':
        value = updatedAt;
        break;
    }
    assert(
      value is T,
      'Invalid field ${field.fieldName}: $value (expected $T)',
    );
    return value as T;
  }
}

class _Blog extends Blog {
  _Blog({
    String? id,
    required this.title,
    List<Post>? posts,
  })  : id = id ?? uuid(),
        posts = posts == null ? null : AsyncModelCollection.fromList(posts),
        createdAt = TemporalDateTime.now(),
        updatedAt = TemporalDateTime.now(),
        super._();

  const _Blog._({
    required this.id,
    required this.title,
    this.posts,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;

  @override
  final String title;

  @override
  final AsyncModelCollection<String, Post, PartialPost, Post>? posts;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;
}

abstract class RemoteBlog extends Blog implements RemoteModel<String, Blog> {
  const RemoteBlog._() : super._();
}

class _RemoteBlog extends RemoteBlog {
  const _RemoteBlog({
    required this.id,
    required this.title,
    this.posts,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.deleted,
    required this.lastChangedAt,
  }) : super._();

  factory _RemoteBlog.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Blog',
            'id',
          ))
        : (json['id'] as String);
    final title = json['title'] == null
        ? (throw ModelFieldError(
            'Blog',
            'title',
          ))
        : (json['title'] as String);
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final version = json['_version'] == null
        ? (throw ModelFieldError(
            'Blog',
            '_version',
          ))
        : (json['_version'] as int);
    final deleted =
        json['_deleted'] == null ? false : (json['_deleted'] as bool);
    final lastChangedAt = json['_lastChangedAt'] == null
        ? (throw ModelFieldError(
            'Blog',
            '_lastChangedAt',
          ))
        : TemporalDateTime.fromString((json['_lastChangedAt'] as String));
    final posts = json['posts'] == null
        ? null
        : AsyncModelCollection<String, Post, PartialPost, RemotePost>.fromList(
            (json['posts'] as List<Object?>)
                .cast<Map<String, Object?>?>()
                .map(
                  (el) => el == null
                      ? (throw ModelFieldError(
                          'Blog',
                          'posts',
                        ))
                      : Post.classType.fromJson<RemotePost>(el),
                )
                .toList(),
          );
    return _RemoteBlog(
      id: id,
      title: title,
      posts: posts,
      createdAt: createdAt,
      updatedAt: updatedAt,
      version: version,
      deleted: deleted,
      lastChangedAt: lastChangedAt,
    );
  }

  @override
  final String id;

  @override
  final String title;

  @override
  final AsyncModelCollection<String, Post, PartialPost, Post>? posts;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;

  @override
  final int version;

  @override
  final bool deleted;

  @override
  final TemporalDateTime lastChangedAt;
}
