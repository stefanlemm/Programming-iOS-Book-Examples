
import UIKit

func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let scheme = url.scheme
        let host = url.host
        if scheme == "coffeetime" {
            if let host = host, let min = Int(host) {
                print("got \(min) from our today extension")
                return true
            }
        }
        return false
    }
}

@available(iOS 13.0, *)
class SceneDelegate : UIResponder, UIWindowSceneDelegate {
    var window : UIWindow?

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        let scheme = url.scheme
        let host = url.host
        if scheme == "coffeetime" {
            if let host = host, let min = Int(host) {
                print("got \(min) from our today extension")
            }
        }
    }
    
}
