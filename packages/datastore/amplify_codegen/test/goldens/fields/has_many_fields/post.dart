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

library models.post;

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;

import 'blog.dart';

class PostType extends ModelType<String, Post, PartialPost> {
  const PostType();

  @override
  T fromJson<T extends PartialModel<String, Post>>(Map<String, Object?> json) {
    if (T == Post || T == Model<String, Post>) {
      return Post.fromJson(json) as T;
    }
    if (T == RemotePost || T == RemoteModel<String, Post>) {
      return _RemotePost.fromJson(json) as T;
    }
    return _PartialPost.fromJson(json) as T;
  }

  @override
  String get modelName => 'Post';
}

class PostQueryFields<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const PostQueryFields([this._root]);

  final QueryField<ModelIdentifier, M, Post>? _root;

  /// Query field for the [Post.id] field.
  QueryField<ModelIdentifier, M, String> get $id =>
      NestedQueryField<ModelIdentifier, M, String, Post, String>(
        const QueryField<String, Post, String>(fieldName: 'id'),
        root: _root,
      );

  /// Query field for the [Post.blogId] field.
  QueryField<ModelIdentifier, M, String> get $blogId =>
      NestedQueryField<ModelIdentifier, M, String, Post, String>(
        const QueryField<String, Post, String>(fieldName: 'blogID'),
        root: _root,
      );

  /// Query field for the [Post.blog] field.
  BlogQueryFields<ModelIdentifier, M> get $blog => BlogQueryFields(
        NestedQueryField<ModelIdentifier, M, String, Post, Blog>(
          const QueryField<String, Post, Blog>(fieldName: 'blog'),
          root: _root,
        ),
      );

  /// Query field for the [Post.createdAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $createdAt =>
      NestedQueryField<ModelIdentifier, M, String, Post, TemporalDateTime>(
        const QueryField<String, Post, TemporalDateTime>(
          fieldName: 'createdAt',
        ),
        root: _root,
      );

  /// Query field for the [Post.updatedAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $updatedAt =>
      NestedQueryField<ModelIdentifier, M, String, Post, TemporalDateTime>(
        const QueryField<String, Post, TemporalDateTime>(
          fieldName: 'updatedAt',
        ),
        root: _root,
      );

  /// Query field for the [Post.blogPostsId] field.
  QueryField<ModelIdentifier, M, String> get $blogPostsId =>
      NestedQueryField<ModelIdentifier, M, String, Post, String>(
        const QueryField<String, Post, String>(fieldName: 'blogPostsId'),
        root: _root,
      );

  /// Query field for the [Post] model identifier.
  QueryField<ModelIdentifier, M, String> get $modelIdentifier =>
      NestedQueryField<ModelIdentifier, M, String, Post, String>(
        const QueryField<String, Post, String>(fieldName: 'modelIdentifier'),
        root: _root,
      );
}

abstract class PartialPost extends PartialModel<String, Post>
    with AWSEquatable<PartialPost> {
  const PartialPost._();

  String get id;
  String? get blogId;
  PartialBlog? get blog;
  TemporalDateTime? get createdAt;
  TemporalDateTime? get updatedAt;
  String? get blogPostsId;
  @override
  String get modelIdentifier => id;
  @override
  PostType get modelType => Post.classType;
  @override
  List<Object?> get props => [
        id,
        blogId,
        blog,
        createdAt,
        updatedAt,
        blogPostsId,
      ];
  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'blogID': blogId,
        'blog': blog?.toJson(),
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format(),
        'blogPostsId': blogPostsId,
        '_version': version,
        '_deleted': deleted,
        '_lastChangedAt': lastChangedAt?.format(),
      };
  @override
  String get runtimeTypeName => 'Post';
}

class _PartialPost extends PartialPost {
  const _PartialPost({
    required this.id,
    this.blogId,
    this.blog,
    this.createdAt,
    this.updatedAt,
    this.blogPostsId,
  }) : super._();

  factory _PartialPost.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Post',
            'id',
          ))
        : (json['id'] as String);
    final blogId = json['blogID'] == null ? null : (json['blogID'] as String);
    final createdAt = json['createdAt'] == null
        ? null
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? null
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final blogPostsId =
        json['blogPostsId'] == null ? null : (json['blogPostsId'] as String);
    final blog = json['blog'] == null
        ? null
        : Blog.classType
            .fromJson<PartialBlog>((json['blog'] as Map<String, Object?>));
    return _PartialPost(
      id: id,
      blogId: blogId,
      blog: blog,
      createdAt: createdAt,
      updatedAt: updatedAt,
      blogPostsId: blogPostsId,
    );
  }

  @override
  final String id;

  @override
  final String? blogId;

  @override
  final PartialBlog? blog;

  @override
  final TemporalDateTime? createdAt;

  @override
  final TemporalDateTime? updatedAt;

  @override
  final String? blogPostsId;
}

abstract class Post extends PartialPost
    with LegacyModelFields<String, Post>
    implements Model<String, Post> {
  factory Post({
    String? id,
    required String blogId,
    required Blog blog,
  }) = _Post;

  const Post._() : super._();

  factory Post.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Post',
            'id',
          ))
        : (json['id'] as String);
    final blogId = json['blogID'] == null
        ? (throw ModelFieldError(
            'Post',
            'blogID',
          ))
        : (json['blogID'] as String);
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Post',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Post',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final blogPostsId = json['blogPostsId'] == null
        ? (throw ModelFieldError(
            'Post',
            'blogPostsId',
          ))
        : (json['blogPostsId'] as String);
    final blog = json['blog'] == null
        ? (throw ModelFieldError(
            'Post',
            'blog',
          ))
        : Blog.classType.fromJson<Blog>((json['blog'] as Map<String, Object?>));
    return _Post._(
      id: id,
      blogId: blogId,
      blog: blog,
      createdAt: createdAt,
      updatedAt: updatedAt,
      blogPostsId: blogPostsId,
    );
  }

  static const PostType classType = PostType();

  static const PostQueryFields<String, Post> _queryFields = PostQueryFields();

  static final mipr.ModelTypeDefinition schema =
      mipr.serializers.deserializeWith(
    mipr.ModelTypeDefinition.serializer,
    const [
      'name',
      'Post',
      'pluralName',
      'Posts',
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
        'blogID',
        [
          'name',
          'blogID',
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
        'blog',
        [
          'name',
          'blog',
          'type',
          [
            'model',
            'Blog',
            true,
          ],
          'isReadOnly',
          false,
          'authRules',
          [],
          'association',
          [
            'associationType',
            'BelongsTo',
            'associatedType',
            'Blog',
            'targetNames',
            ['blogPostsId'],
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
        'blogPostsId',
        [
          'name',
          'blogPostsId',
          'type',
          [
            'scalar',
            'ID',
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
          'secondary',
          'primaryField',
          'blogID',
          'sortKeyFields',
          [],
          'name',
          'postsByBlog',
          'queryField',
          'postsByBlogID',
        ],
        [
          'type',
          'primary',
          'primaryField',
          'id',
          'sortKeyFields',
          [],
        ],
        [
          'type',
          'foreign',
          'primaryField',
          'blog',
          'sortKeyFields',
          ['blogPostsId'],
          'name',
          'blog',
        ],
      ],
    ],
  )!;

  @override
  String get id;

  /// Query field for the [id] field.
  static QueryField<String, Post, String> get $id => _queryFields.$id;

  /// Query field for the [id] field.
  @Deprecated(r'Use $id instead')
  static QueryField<String, Post, String> get ID => $id;
  @override
  String get blogId;

  /// Query field for the [blogId] field.
  static QueryField<String, Post, String> get $blogId => _queryFields.$blogId;

  /// Query field for the [blogId] field.
  @Deprecated(r'Use $blogId instead')
  static QueryField<String, Post, String> get BLOG_ID => $blogId;
  @override
  Blog get blog;

  /// Query field for the [blog] field.
  static BlogQueryFields<String, Post> get $blog => _queryFields.$blog;

  /// Query field for the [blog] field.
  @Deprecated(r'Use $blog instead')
  static BlogQueryFields<String, Post> get BLOG => $blog;
  @override
  TemporalDateTime get createdAt;
  @override
  TemporalDateTime get updatedAt;
  @override
  String get blogPostsId;

  /// Query field for the [modelIdentifier] field.
  static QueryField<String, Post, String> get $modelIdentifier =>
      _queryFields.$modelIdentifier;

  /// Query field for the [modelIdentifier] field.
  @Deprecated(r'Use $modelIdentifier instead')
  static QueryField<String, Post, String> get MODEL_IDENTIFIER =>
      $modelIdentifier;
  Post copyWith({
    String? id,
    String? blogId,
    Blog? blog,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? blogPostsId,
  }) {
    return _Post._(
      id: id ?? this.id,
      blogId: blogId ?? this.blogId,
      blog: blog ?? this.blog,
      createdAt:
          createdAt == null ? this.createdAt : TemporalDateTime(createdAt),
      updatedAt:
          updatedAt == null ? this.updatedAt : TemporalDateTime(updatedAt),
      blogPostsId: blogPostsId ?? this.blogPostsId,
    );
  }

  @override
  T valueFor<T extends Object?>(QueryField<String, Post, T> field) {
    Object? value;
    switch (field.fieldName) {
      case r'id':
        value = id;
        break;
      case r'blogID':
        value = blogId;
        break;
      case r'blog':
        value = blog;
        break;
      case r'createdAt':
        value = createdAt;
        break;
      case r'updatedAt':
        value = updatedAt;
        break;
      case r'blogPostsId':
        value = blogPostsId;
        break;
    }
    assert(
      value is T,
      'Invalid field ${field.fieldName}: $value (expected $T)',
    );
    return value as T;
  }
}

class _Post extends Post {
  _Post({
    String? id,
    required this.blogId,
    required this.blog,
  })  : id = id ?? uuid(),
        createdAt = TemporalDateTime.now(),
        updatedAt = TemporalDateTime.now(),
        blogPostsId = blog.id,
        super._();

  const _Post._({
    required this.id,
    required this.blogId,
    required this.blog,
    required this.createdAt,
    required this.updatedAt,
    required this.blogPostsId,
  }) : super._();

  @override
  final String id;

  @override
  final String blogId;

  @override
  final Blog blog;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;

  @override
  final String blogPostsId;
}

abstract class RemotePost extends Post implements RemoteModel<String, Post> {
  const RemotePost._() : super._();
}

class _RemotePost extends RemotePost {
  const _RemotePost({
    required this.id,
    required this.blogId,
    required this.blog,
    required this.createdAt,
    required this.updatedAt,
    required this.blogPostsId,
    required this.version,
    required this.deleted,
    required this.lastChangedAt,
  }) : super._();

  factory _RemotePost.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Post',
            'id',
          ))
        : (json['id'] as String);
    final blogId = json['blogID'] == null
        ? (throw ModelFieldError(
            'Post',
            'blogID',
          ))
        : (json['blogID'] as String);
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Post',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Post',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final blogPostsId = json['blogPostsId'] == null
        ? (throw ModelFieldError(
            'Post',
            'blogPostsId',
          ))
        : (json['blogPostsId'] as String);
    final version = json['_version'] == null
        ? (throw ModelFieldError(
            'Post',
            '_version',
          ))
        : (json['_version'] as int);
    final deleted =
        json['_deleted'] == null ? false : (json['_deleted'] as bool);
    final lastChangedAt = json['_lastChangedAt'] == null
        ? (throw ModelFieldError(
            'Post',
            '_lastChangedAt',
          ))
        : TemporalDateTime.fromString((json['_lastChangedAt'] as String));
    final blog = json['blog'] == null
        ? (throw ModelFieldError(
            'Post',
            'blog',
          ))
        : Blog.classType
            .fromJson<RemoteBlog>((json['blog'] as Map<String, Object?>));
    return _RemotePost(
      id: id,
      blogId: blogId,
      blog: blog,
      createdAt: createdAt,
      updatedAt: updatedAt,
      blogPostsId: blogPostsId,
      version: version,
      deleted: deleted,
      lastChangedAt: lastChangedAt,
    );
  }

  @override
  final String id;

  @override
  final String blogId;

  @override
  final RemoteBlog blog;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;

  @override
  final String blogPostsId;

  @override
  final int version;

  @override
  final bool deleted;

  @override
  final TemporalDateTime lastChangedAt;
}
