//
//  AppDelegate.swift
//  NAVBarAniSelf
//
//  Created by jansti on 16/10/25.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        configureNavigationBar()
        configureStatusBar()
        
        return true
    }
    
    
    // MARK: - Convenience
    
    let gray = UIColor.init(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.0)
    
    func configureNavigationBar() {
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().opaque = true
        UINavigationBar.appearance().barTintColor = UIColor.blueColor()
        UINavigationBar.appearance().tintColor = UIColor.yellowColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }

    func configureStatusBar() {
        UIApplication.sharedApplication().statusBarStyle  = .LightContent
        setStatusBarBackgroundColor(gray)
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        
        guard let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
            return
        }
        
        statusBar.backgroundColor = color
    }

}

