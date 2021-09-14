#import "AmplifyFlutterPlugin.h"
#if __has_include(<amplify_flutter/amplify_flutter-Swift.h>)
#import <amplify_flutter/amplify_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "amplify_flutter-Swift.h"
#endif

@implementation AmplifyFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAmplifyFlutterPlugin registerWithRegistrar:registrar];
}
@end
