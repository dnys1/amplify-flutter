library amplify_errors;

import 'package:flutter/services.dart';
import 'exceptions.dart';

export 'exceptions.dart';

part 'src/lookup.dart';

typedef AmplifyExceptionFactory = AmplifyException Function(Map);

AmplifyException parsePlatformException(PlatformException e) {
  AmplifyExceptionFactory? res = _lookupTable[e.code];
  if (res != null) {
    return res(e.details as Map);
  }
  return AmplifyException.unknown(e.details as Map?);
}
