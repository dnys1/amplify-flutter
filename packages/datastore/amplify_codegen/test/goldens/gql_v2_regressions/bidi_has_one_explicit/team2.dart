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

// ignore_for_file: non_constant_identifier_names

library models.team2;

import 'package:amplify_core/amplify_core.dart';

import 'project2.dart';

class Team2Type extends ModelType<String, Team2, PartialTeam2> {
  const Team2Type();

  @override
  T fromJson<T extends PartialModel<String, Team2>>(Map<String, Object?> json) {
    if (T == Team2 || T == Model<String, Team2>) {
      return Team2.fromJson(json) as T;
    }
    if (T == RemoteTeam2 || T == RemoteModel<String, Team2>) {
      return _RemoteTeam2.fromJson(json) as T;
    }
    return _PartialTeam2.fromJson(json) as T;
  }

  @override
  String get modelName => 'Team2';
}

class Team2QueryFields<ModelIdentifier extends Object,
    M extends Model<ModelIdentifier, M>> {
  const Team2QueryFields([this._root]);

  final QueryField<ModelIdentifier, M, Team2>? _root;

  /// Query field for the [Team2.id] field.
  QueryField<ModelIdentifier, M, String> get $id =>
      NestedQueryField<ModelIdentifier, M, String, Team2, String>(
        const QueryField<String, Team2, String>(fieldName: 'id'),
        root: _root,
      );

  /// Query field for the [Team2.name] field.
  QueryField<ModelIdentifier, M, String> get $name =>
      NestedQueryField<ModelIdentifier, M, String, Team2, String>(
        const QueryField<String, Team2, String>(fieldName: 'name'),
        root: _root,
      );

  /// Query field for the [Team2.projectId] field.
  QueryField<ModelIdentifier, M, String?> get $projectId =>
      NestedQueryField<ModelIdentifier, M, String, Team2, String?>(
        const QueryField<String, Team2, String?>(fieldName: 'projectID'),
        root: _root,
      );

  /// Query field for the [Team2.project] field.
  Project2QueryFields<ModelIdentifier, M> get $project => Project2QueryFields(
        NestedQueryField<ModelIdentifier, M, String, Team2, Project2>(
          const QueryField<String, Team2, Project2>(fieldName: 'project'),
          root: _root,
        ),
      );

  /// Query field for the [Team2.createdAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $createdAt =>
      NestedQueryField<ModelIdentifier, M, String, Team2, TemporalDateTime>(
        const QueryField<String, Team2, TemporalDateTime>(
          fieldName: 'createdAt',
        ),
        root: _root,
      );

  /// Query field for the [Team2.updatedAt] field.
  QueryField<ModelIdentifier, M, TemporalDateTime> get $updatedAt =>
      NestedQueryField<ModelIdentifier, M, String, Team2, TemporalDateTime>(
        const QueryField<String, Team2, TemporalDateTime>(
          fieldName: 'updatedAt',
        ),
        root: _root,
      );

  /// Query field for the [Team2] model identifier.
  QueryField<ModelIdentifier, M, String> get $modelIdentifier =>
      NestedQueryField<ModelIdentifier, M, String, Team2, String>(
        const QueryField<String, Team2, String>(fieldName: 'modelIdentifier'),
        root: _root,
      );
}

abstract class PartialTeam2 extends PartialModel<String, Team2>
    with AWSEquatable<PartialTeam2> {
  const PartialTeam2._();

  String get id;
  String? get name;
  String? get projectId;
  AsyncModel<String, Project2, PartialProject2, PartialProject2>? get project;
  TemporalDateTime? get createdAt;
  TemporalDateTime? get updatedAt;
  @override
  String get modelIdentifier => id;
  @override
  Team2Type get modelType => Team2.classType;
  @override
  List<Object?> get props => [
        id,
        name,
        projectId,
        project,
        createdAt,
        updatedAt,
      ];
  @override
  Map<String, Object?> toJson() => {
        'id': id,
        'name': name,
        'projectID': projectId,
        'project': project?.toJson(),
        'createdAt': createdAt?.format(),
        'updatedAt': updatedAt?.format(),
        'version': version,
        'deleted': deleted,
        'lastChangedAt': lastChangedAt?.format(),
      };
  @override
  String get runtimeTypeName => 'Team2';
}

class _PartialTeam2 extends PartialTeam2 {
  const _PartialTeam2({
    required this.id,
    this.name,
    this.projectId,
    this.project,
    this.createdAt,
    this.updatedAt,
  }) : super._();

  factory _PartialTeam2.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Team2',
            'id',
          ))
        : (json['id'] as String);
    final name = json['name'] == null ? null : (json['name'] as String);
    final projectId =
        json['projectID'] == null ? null : (json['projectID'] as String);
    final project = json['project'] == null
        ? null
        : AsyncModel<String, Project2, PartialProject2,
            PartialProject2>.fromModel(
            Project2.classType.fromJson<PartialProject2>(
              (json['project'] as Map<String, Object?>),
            ),
          );
    final createdAt = json['createdAt'] == null
        ? null
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? null
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    return _PartialTeam2(
      id: id,
      name: name,
      projectId: projectId,
      project: project,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  final String id;

  @override
  final String? name;

  @override
  final String? projectId;

  @override
  final AsyncModel<String, Project2, PartialProject2, PartialProject2>? project;

  @override
  final TemporalDateTime? createdAt;

  @override
  final TemporalDateTime? updatedAt;
}

abstract class Team2 extends PartialTeam2 implements Model<String, Team2> {
  factory Team2({
    String? id,
    required String name,
    String? projectId,
    Project2? project,
  }) = _Team2;

  const Team2._() : super._();

  factory Team2.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Team2',
            'id',
          ))
        : (json['id'] as String);
    final name = json['name'] == null
        ? (throw ModelFieldError(
            'Team2',
            'name',
          ))
        : (json['name'] as String);
    final projectId =
        json['projectID'] == null ? null : (json['projectID'] as String);
    final project = json['project'] == null
        ? null
        : AsyncModel<String, Project2, PartialProject2, Project2>.fromModel(
            Project2.classType
                .fromJson<Project2>((json['project'] as Map<String, Object?>)),
          );
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Team2',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Team2',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    return _Team2._(
      id: id,
      name: name,
      projectId: projectId,
      project: project,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static const Team2Type classType = Team2Type();

  static const Team2QueryFields<String, Team2> _queryFields =
      Team2QueryFields();

  @override
  String get id;

  /// Query field for the [id] field.
  QueryField<String, Team2, String> get $id => _queryFields.$id;

  /// Query field for the [id] field.
  @Deprecated(r'Use $id instead')
  QueryField<String, Team2, String> get ID => $id;
  @override
  String get name;

  /// Query field for the [name] field.
  QueryField<String, Team2, String> get $name => _queryFields.$name;

  /// Query field for the [name] field.
  @Deprecated(r'Use $name instead')
  QueryField<String, Team2, String> get NAME => $name;
  @override
  String? get projectId;

  /// Query field for the [projectId] field.
  QueryField<String, Team2, String?> get $projectId => _queryFields.$projectId;

  /// Query field for the [projectId] field.
  @Deprecated(r'Use $projectId instead')
  QueryField<String, Team2, String?> get PROJECT_ID => $projectId;
  @override
  AsyncModel<String, Project2, PartialProject2, Project2>? get project;

  /// Query field for the [project] field.
  Project2QueryFields<String, Team2> get $project => _queryFields.$project;

  /// Query field for the [project] field.
  @Deprecated(r'Use $project instead')
  Project2QueryFields<String, Team2> get PROJECT => $project;
  @override
  TemporalDateTime get createdAt;
  @override
  TemporalDateTime get updatedAt;

  /// Query field for the [modelIdentifier] field.
  QueryField<String, Team2, String> get $modelIdentifier =>
      _queryFields.$modelIdentifier;

  /// Query field for the [modelIdentifier] field.
  @Deprecated(r'Use $modelIdentifier instead')
  QueryField<String, Team2, String> get MODEL_IDENTIFIER => $modelIdentifier;
  @override
  T valueFor<T extends Object?>(QueryField<String, Team2, T> field) {
    Object? value;
    switch (field.fieldName) {
      case r'id':
        value = id;
        break;
      case r'name':
        value = name;
        break;
      case r'projectID':
        value = projectId;
        break;
      case r'project':
        value = project;
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

class _Team2 extends Team2 {
  _Team2({
    String? id,
    required this.name,
    this.projectId,
    Project2? project,
  })  : id = id ?? uuid(),
        project = project == null ? null : AsyncModel.fromModel(project),
        createdAt = TemporalDateTime.now(),
        updatedAt = TemporalDateTime.now(),
        super._();

  const _Team2._({
    required this.id,
    required this.name,
    this.projectId,
    this.project,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();

  @override
  final String id;

  @override
  final String name;

  @override
  final String? projectId;

  @override
  final AsyncModel<String, Project2, PartialProject2, Project2>? project;

  @override
  final TemporalDateTime createdAt;

  @override
  final TemporalDateTime updatedAt;
}

abstract class RemoteTeam2 extends Team2 implements RemoteModel<String, Team2> {
  const RemoteTeam2._() : super._();
}

class _RemoteTeam2 extends RemoteTeam2 {
  const _RemoteTeam2({
    required this.id,
    required this.name,
    this.projectId,
    this.project,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.deleted,
    required this.lastChangedAt,
  }) : super._();

  factory _RemoteTeam2.fromJson(Map<String, Object?> json) {
    final id = json['id'] == null
        ? (throw ModelFieldError(
            'Team2',
            'id',
          ))
        : (json['id'] as String);
    final name = json['name'] == null
        ? (throw ModelFieldError(
            'Team2',
            'name',
          ))
        : (json['name'] as String);
    final projectId =
        json['projectID'] == null ? null : (json['projectID'] as String);
    final project = json['project'] == null
        ? null
        : AsyncModel<String, Project2, PartialProject2,
            RemoteProject2>.fromModel(
            Project2.classType.fromJson<RemoteProject2>(
              (json['project'] as Map<String, Object?>),
            ),
          );
    final createdAt = json['createdAt'] == null
        ? (throw ModelFieldError(
            'Team2',
            'createdAt',
          ))
        : TemporalDateTime.fromString((json['createdAt'] as String));
    final updatedAt = json['updatedAt'] == null
        ? (throw ModelFieldError(
            'Team2',
            'updatedAt',
          ))
        : TemporalDateTime.fromString((json['updatedAt'] as String));
    final version = json['version'] == null
        ? (throw ModelFieldError(
            'Team2',
            'version',
          ))
        : (json['version'] as int);
    final deleted = json['deleted'] == null
        ? (throw ModelFieldError(
            'Team2',
            'deleted',
          ))
        : (json['deleted'] as bool);
    final lastChangedAt = json['lastChangedAt'] == null
        ? (throw ModelFieldError(
            'Team2',
            'lastChangedAt',
          ))
        : TemporalDateTime.fromString((json['lastChangedAt'] as String));
    return _RemoteTeam2(
      id: id,
      name: name,
      projectId: projectId,
      project: project,
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
  final String name;

  @override
  final String? projectId;

  @override
  final AsyncModel<String, Project2, PartialProject2, RemoteProject2>? project;

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
