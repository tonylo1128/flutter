import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyC_hnNBoKjIv3uHmCQ_ILHFU-NsNXtZZ9k ")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
