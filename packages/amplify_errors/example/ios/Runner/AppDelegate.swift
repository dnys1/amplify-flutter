import UIKit
import Flutter

import Amplify
import amplify_errors

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "amplify_errors_example",
                                       binaryMessenger: controller.binaryMessenger)
    
    channel.setMethodCallHandler({ call, result in
        do {
            switch call.method {
            case "configure":
               try self.configure(configuration: call.arguments as! String)
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        } catch {
            AmplifyFlutterError(error).post(to: result)
        }
    })
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func configure(configuration: String) throws {
        let amplifyConfiguration = try JSONDecoder().decode(AmplifyConfiguration.self, from: configuration.data(using: .utf8)!)
        try Amplify.configure(amplifyConfiguration)
    }
}
