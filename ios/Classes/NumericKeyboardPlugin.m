#import "NumericKeyboardPlugin.h"
#if __has_include(<numeric_keyboard/numeric_keyboard-Swift.h>)
#import <numeric_keyboard/numeric_keyboard-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "numeric_keyboard-Swift.h"
#endif

@implementation NumericKeyboardPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNumericKeyboardPlugin registerWithRegistrar:registrar];
}
@end
