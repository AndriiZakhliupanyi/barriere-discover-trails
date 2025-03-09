import Foundation
import SwiftUI
import UserNotifications
import AppTrackingTransparency
import AdSupport
import AdServices
import OneSignalFramework
import AppsFlyerLib


extension Notification.Name {
    static let didReceiveTrackFurs = Notification.Name("didReceiveTrackingAuthorization")
}
protocol StatusDelIDFAFurs: AnyObject {
    func didReceiveIDFAStatuFurs(_ status: ATTrackingManager.AuthorizationStatus)
}
class AppDelegate: NSObject, UIApplicationDelegate, AppsFlyerLibDelegate {
    
    // @ObservedObject var eventsStorage = EventsStorageWarsVib.shared
    
    static var orientationLock = UIInterfaceOrientationMask.all
    @State private var token: String? = nil
    @State private var attributionResponse: String? = nil
    @State private var clickFromAsa: String? = nil
    @State private var playerID: String = ""
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NotificationCenter.default.addObserver(self, selector: #selector(handleTrackingAuthorizationNotification(_:)), name: .didReceiveTrackFurs, object: nil)
        // LclServWarsVib.shared.start()
        
        /*  ftchAtrrTkn { fetchedToken in
         if let fetchedToken = fetchedToken {
         self.token = fetchedToken
         
         for i in 1...2 {
         DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 5) {
         sendTokToLclServ(token: fetchedToken) { response in
         self.handleResponse(response)
         }
         }
         }
         }
         } */
        OneSignal.Debug.setLogLevel(.LL_VERBOSE)
        OneSignal.initialize("5cd3bc75-8af0-45d0-bbea-fa61822c41ec", withLaunchOptions: launchOptions)
        
        
        if let idfv = UIDevice.current.identifierForVendor?.uuidString {
            UserDefaults.standard.setValue(idfv, forKey: "idfv")
            AppsFlyerLib.shared().customerUserID = idfv
        }
        
        return true
    }
    
    @objc private func handleTrackingAuthorizationNotification(_ notification: Notification) {
        
        OneSignal.Notifications.requestPermission({ accepted in
            
            if accepted {
                
                UserDefaults.standard.set(true, forKey: "push_subscribe")
            } else {
                print("Notification permission denied.")
            }
            
            self.getPlayerID()
        }, fallbackToSettings: false)
        AppsFlyerLib.shared().appsFlyerDevKey = "BX5RmT4UeiWBs7XFeqzzDM"
        AppsFlyerLib.shared().appleAppID = "6742913664"
        AppsFlyerLib.shared().isDebug = false
        AppsFlyerLib.shared().delegate = self
        
        if let idfv = UIDevice.current.identifierForVendor?.uuidString {
            UserDefaults.standard.setValue(idfv, forKey: "idfv")
            AppsFlyerLib.shared().customerUserID = idfv
        }
        
        requestNotificationPermission()
        NotificationCenter.default.addObserver(self, selector: NSSelectorFromString("sendLaunch"), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                
                UserDefaults.standard.set(true, forKey: "push_subscribe")
            } else {
                print("Notification permission denied.")
            }
            
            self.getPlayerID()
        }
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
    
    @objc func sendLaunch() {
        AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
        AppsFlyerLib.shared().start()
        
        let appsFlyerUID = AppsFlyerLib.shared().getAppsFlyerUID()
        if UserDefaults.standard.object(forKey: "appsEntry") == nil {
            UserDefaults.standard.set(true, forKey: "appsEntry")
            UserDefaults.standard.setValue(appsFlyerUID, forKey: "appsUID")
        }
        
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if let customOSPayload = userInfo["custom"] as? NSDictionary {
            if let launchUrl = customOSPayload["u"] as? String, let url = URL(string: launchUrl) {
                UserDefaults.standard.set(true, forKey: "didOpenFromPush")
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //  EvServWarsVib.shared.sendEvent(eventName: "push_open_browser")
            } else {
                
                UserDefaults.standard.set(true, forKey: "didOpenFromPush")
                // EvServWarsVib.shared.sendEvent(eventName: "push_open_webview")
            }
        }
        
        let timeInterval = Int(NSDate().timeIntervalSince1970)
        completionHandler(.newData)
    }
    
    func getPlayerID() {
        if let onesignalId = OneSignal.User.onesignalId {
            playerID = onesignalId
        } else {
            playerID = "None"
        }
        
        UserDefaults.standard.setValue(playerID, forKey: "playerID")
    }
    
    func ftchAtrrTkn(completion: @escaping (String?) -> Void) {
        if #available(iOS 14.3, *) {
            do {
                let token = try AAAttribution.attributionToken()
                completion(token)
            } catch {
                
                completion(nil)
            }
        } else {
            
            completion(nil)
        }
    }
    func handleResponse(_ response: String?) {
        self.attributionResponse = response
        if let data = response?.data(using: .utf8) {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
               let dict = jsonObject as? [String: Any],
               let attribution = dict["attribution"] as? Bool {
                UserDefaults.standard.set(attribution, forKey: "isAttributedToAppleSearchAds")
                
            }
        }
    }
    
    
}
/*func sendTokToLclServ(token: String, completion: @escaping (String?) -> Void) {
 let url = URL(string: ConstWarsVib.tokLcl)!
 var request = URLRequest(url: url)
 request.httpMethod = "POST"
 request.setValue("application/json", forHTTPHeaderField: "Content-Type")
 let body: [String: Any] = ["token": token]
 request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
 
 URLSession.shared.dataTask(with: request) { data, response, error in
 if let error = error {
 
 completion(nil)
 return
 }
 if let data = data, let responseString = String(data: data, encoding: .utf8) {
 completion(responseString)
 } else {
 completion(nil)
 }
 }.resume()
 } */
extension AppDelegate {
    func onConversionDataSuccess(_ installData: [AnyHashable: Any]) {
        
        if let status = installData["af_status"] as? String {
            
            if (status == "Non-organic") {
                for (key, value) in installData {
                    if let keyString = key as? String, let valueString = value as? String {
                        
                        if keyString == "jid" {
                            UserDefaults.standard.set(valueString, forKey: "jid")
                            UserDefaults.standard.synchronize()
                            
                        }
                    }
                }
                if let sourceID = installData["media_source"],
                   let campaign = installData["campaign"] as? String {
                    let arr = campaign.components(separatedBy: "_")
                    var finalStr = ""
                    for i in 0..<arr.count {
                        
                        // finalStr.append("&\(ConstWarsVib.subName)\(i+1)=\(arr[i])")
                    }
                    
                    if UserDefaults.standard.object(forKey: "firstEntry") == nil {
                        UserDefaults.standard.set(true, forKey: "firstEntry")
                        UserDefaults.standard.setValue(finalStr, forKey: "savedSub")
                    }
                    
                }
            }
        }
    }
    
    func onConversionDataFail(_ error: Error) {
        print(error)
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        AppsFlyerLib.shared().handleOpen(url, options: options)
        return true
    }
    
    func onAppOpenAttribution(_ attributionData: [AnyHashable : Any]) {
        print("\(attributionData)")
        
    }
    
    func onAppOpenAttributionFailure(_ error: Error) {
        print(error)
    }
}
