library amplify_errors_flutter;

import 'package:amplify_errors/amplify_errors.dart';
import 'package:flutter/services.dart';

export 'package:amplify_errors/amplify_errors.dart';

part 'src/lookup.dart';

typedef AmplifyExceptionFactory = AmplifyException Function(Map);

AmplifyException parsePlatformException(PlatformException e) {
  AmplifyExceptionFactory? res = _lookupTable[e.code];
  if (res != null) {
    return res(e.details as Map);
  }
  return AmplifyException.unknown(e.details as Map?);
}
