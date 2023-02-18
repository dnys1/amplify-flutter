# Belongs To (`fields` vs. no `fields`)

`schema.graphql`
```graphql
type Blog @model {
    id: ID!
    title: String!
    posts: [Post!] @hasMany(indexName: "postsByBlog")
}

type Post @model {
    id: ID!
    blogID: ID! @index(name: "postsByBlog")
    blog: Blog! @belongsTo(fields: ["blogID"]) # <-- Concerning this `fields` argument
}
```

In the CLI and current codegen (CLI v10.6.1), the difference between including the `fields` arguments to a `@belongsTo` and not is quite drastic and counterintuitive.

When it's included, a foreign key for `Blog.posts` is still created - thus, two fields in the `Post` schema represent the foreign `Blog` key. (This can be circumvented by adding a `fields` property to the corresponding `@hasMany`).

`build/schema.graphql`
```graphql
type Blog {
  id: ID!
  title: String!
  posts(filter: ModelPostFilterInput, sortDirection: ModelSortDirection, limit: Int, nextToken: String): ModelPostConnection
  createdAt: AWSDateTime!
  updatedAt: AWSDateTime!
}

type Post {
  id: ID!
  blogID: ID!               # Same as `blogPostsId`
  blog: Blog!
  createdAt: AWSDateTime!
  updatedAt: AWSDateTime!
  blogPostsId: ID           # Same as `blogID`
}
```

In codegen, `Post.blogPostsId` is not generated either creating issues for model helpers and other downstream tools:

`lib/models/Post.dart`
```dart
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final Blog? _blog;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  //...
```

...although not DataStore, since the `blogPostsId` appears in the generated `ModelSchema`:

`lib/models/Post.dart`
```dart
static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["blogID"], name: "postsByBlog")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Post.BLOG,
      isRequired: true,
      targetNames: ['blogID'],
      ofModelName: 'Blog'
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}
```

Removing the `fields` argument leads to `blogPostsId` being code generated in the models, but then depending on whether the `@hasMany.fields` argument is present dictates the generated `associatedKey` for the `Blog.posts` field:

**With `@hasMany.fields`**:

`lib/models/Blog.dart`
```dart
modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
    key: Blog.POSTS,
    isRequired: true,
    ofModelName: 'Post',
    associatedKey: Post.BLOGID
));
```

**Without `@hasMany.fields`**:

`lib/models/Blog.dart`
```dart
modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
    key: Blog.POSTS,
    isRequired: true,
    ofModelName: 'Post',
    associatedKey: Post.BLOG // CHANGED
));
```
