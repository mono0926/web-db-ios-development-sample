//
//  AppDelegate.swift
//  web-db-sample
//
//  Created by mono on 11/3/15.
//  Copyright © 2015 mono. All rights reserved.
//

import UIKit
import SVProgressHUD
import CoreSpotlight

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let shortcut1 = UIMutableApplicationShortcutItem(type: "someType1", localizedTitle: "ダイナミック・再生", localizedSubtitle: "サブタイトル3", icon: UIApplicationShortcutIcon(type: .Play), userInfo: nil)
        let shortcut2 = UIMutableApplicationShortcutItem(type: "someType2", localizedTitle: "ダイナミック・ポーズ", localizedSubtitle: "サブタイトル4", icon: UIApplicationShortcutIcon(type: .Pause), userInfo: nil)
        let shortcut3 = UIMutableApplicationShortcutItem(type: "someType3", localizedTitle: "ダイナミック・追加", localizedSubtitle: "サブタイトル5", icon: UIApplicationShortcutIcon(type: .Add), userInfo: nil)
        // スタティック2個 + ダイナミック3個で、上限4個を超えるので、ダイナミックは1つ弾かれる
        UIApplication.sharedApplication().shortcutItems = [shortcut1, shortcut2, shortcut3]
        
        // プッシュ通知許可を問い合わせ
        let textAction = UIMutableUserNotificationAction()
        textAction.identifier = "text-identifier"
        textAction.title = "返信"
        textAction.activationMode = .Background
        textAction.authenticationRequired = false
        textAction.destructive = false
        textAction.behavior = .TextInput
        let category = UIMutableUserNotificationCategory()
        category.identifier = "category-identifier"
        category.setActions([textAction], forContext: .Default)
        category.setActions([textAction], forContext: .Minimal)
        let categories = NSSet(object: category) as! Set<UIUserNotificationCategory>
        let settings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: categories)
        application.registerUserNotificationSettings(settings);
        
        // HTTPアクセスをして、`App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. `を誘発
        NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration()).dataTaskWithURL(NSURL(string: "http://gihyo.jp/book")!).resume()
        
        return true
    }
    
    // A: プッシュ通知許可で「OK」・「許可しない」のいずれかが選択された時に呼ばれる
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        application.registerForRemoteNotifications()
    }
    // B: デバイストークン取得成功後に呼ばれる
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("deviceToken: \(deviceToken)")
    }
    // C: デバイストークン取得失敗後に呼ばれる
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("errpr: \(error)")
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        let resopnse = responseInfo[UIUserNotificationActionResponseTypedTextKey]
        print("resopnse: \(resopnse)")
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        
    }
    
    @available(iOS 9.0, *)
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        print("shortcutItem: \(shortcutItem)")
        SVProgressHUD.showSuccessWithStatus(shortcutItem.localizedTitle)
    }
    
    func application(application: UIApplication, continueUserActivity userActivity: NSUserActivity, restorationHandler: ([AnyObject]?) -> Void) -> Bool {
        if let identifier = userActivity.userInfo![CSSearchableItemActivityIdentifier] as? String {
            print("identifier: \(identifier)")
        }
        return true
    }
}

