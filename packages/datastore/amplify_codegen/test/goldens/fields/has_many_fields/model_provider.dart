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

library models.model_provider;

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/types/models/mipr.dart' as mipr;

import 'blog.dart';
import 'post.dart';

export 'blog.dart';
export 'post.dart';

class ModelProvider extends ModelProviderInterface {
  ModelProvider._();

  static final instance = ModelProvider._();

  @override
  String get version => 'e65ba13fdc15e20d46c36489bf04d4c3';
  @override
  List<mipr.ModelTypeDefinition> get modelSchemas => [
        Blog.schema,
        Post.schema,
      ];
  @override
  List<mipr.NonModelTypeDefinition> get customTypeSchemas => [];
  @override
  ModelType<ModelIdentifier, M, P> getModelType<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(String modelName) {
    switch (modelName) {
      case 'Blog':
        return (Blog.classType as ModelType<ModelIdentifier, M, P>);
      case 'Post':
        return (Post.classType as ModelType<ModelIdentifier, M, P>);
      default:
        throw ArgumentError(
          'Failed to find model in model provider for model name: $modelName',
        );
    }
  }

  @override
  ModelType<ModelIdentifier, M, P> getModelTypeByModelName<
          ModelIdentifier extends Object,
          M extends Model<ModelIdentifier, M>,
          P extends PartialModel<ModelIdentifier, M>>(String modelName) =>
      getModelType(modelName);
}
