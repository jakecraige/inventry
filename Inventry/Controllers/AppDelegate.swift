import UIKit
import Firebase
import FirebaseAuthUI

let applicationViewController = ApplicationViewController()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    Styles.configure()
    window = UIWindow(frame: UIScreen.main.bounds)
    if let window = window {
      window.rootViewController = applicationViewController
      window.makeKeyAndVisible()
    }

    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    guard let authUI = FIRAuthUI.default() else { return false }

    return authUI.handleOpen(url, sourceApplication: options[.sourceApplication] as! String?)
  }
}
