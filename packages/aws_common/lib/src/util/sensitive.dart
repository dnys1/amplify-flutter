// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

/// Marks a type/value as sensitive which can be leveraged by the Dart
/// analyzer to detect printing/logging these values accidentally.
const sensitive = _Sensitive();

class _Sensitive {
  const _Sensitive();
}
