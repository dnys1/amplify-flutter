// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:smithy/ast.dart';

class MixinTrait extends AnnotationTrait {
  const MixinTrait() : super(id);

  const MixinTrait.fromJson(Object? json) : super(id);

  static const id = ShapeId.core('mixin');
}
