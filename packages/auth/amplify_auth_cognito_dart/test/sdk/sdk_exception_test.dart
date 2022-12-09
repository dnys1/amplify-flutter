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

import 'package:amplify_auth_cognito_dart/amplify_auth_cognito_dart.dart';
import 'package:test/test.dart';

void main() {
  group('LambdaException', () {
    const error = 'something bad happened';
    const message = 'PreConfirmation failed with error $error.';

    test('matches string', () {
      expect(LambdaException.isLambdaException(message), isTrue);

      final exception = LambdaException(message);
      expect(exception.message, error);
      expect(exception.lambdaName, 'PreConfirmation');
    });

    test('matches exception', () {
      const wrapped = UserNotConfirmedException(message);
      expect(LambdaException.isLambdaException(wrapped.toString()), isTrue);

      final exception = LambdaException(wrapped.toString());
      expect(exception.message, error);
      expect(exception.lambdaName, 'PreConfirmation');
    });
  });
}
