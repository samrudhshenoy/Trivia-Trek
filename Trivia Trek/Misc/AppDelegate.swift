//
//  AppDelegate.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 12/22/18.
//  Copyright © 2018 Homestead FBLA. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import SCSDKLoginKit

@UIApplicationMain

// Main application delegate class which controls all subprocesses
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /// UIWindow from which the app is displayed from
    var window: UIWindow?
    
    func initSettings() {
        
        if !UserDefaults.standard.hasObject(forKey: "bestScore") {
            UserDefaults.standard.set(-1, forKey: "bestScore")
        }
        
        if !UserDefaults.standard.hasObject(forKey: "avatar") {
            UserDefaults.standard.set("cpupicmale", forKey: "avatar")
        }
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        self.initSettings()
        
        return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options) || SCSDKLoginClient.application(app, open: url, options: options)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.initSettings()
        
        let selectorFont = NSDictionary(object: UIFont(name: "AvenirNext-Regular", size: 11.0)!, forKey: NSAttributedString.Key.font as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(selectorFont as? [NSAttributedString.Key : Any] , for: .normal)
        
        let buttonFont = NSDictionary(object: UIFont(name: "AvenirNext-Regular", size: 16.0)!, forKey: NSAttributedString.Key.font as NSCopying)
        UIBarButtonItem.appearance().setTitleTextAttributes(buttonFont as? [NSAttributedString.Key : Any], for: .normal)
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

extension UserDefaults {
    
    func hasObject(forKey key: String) -> Bool {
        return self.object(forKey: key) != nil
    }
    
}
