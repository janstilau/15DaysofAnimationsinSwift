//
//  AppDelegate.swift
//  NavigationBarAnimation
//
//  Created by Larry Natalicio on 4/15/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        configureNavigationBar()
        configureStatusBar()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Convenience
    
    let gray = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    
    
    
    

    func configureNavigationBar() {
        UINavigationBar.appearance().translucent = false// 这个属性,控制navigationbar的透视效果
        UINavigationBar.appearance().opaque = true // 这个是渲染性能的属性,可以不设置,一般也不设置
        UINavigationBar.appearance().barTintColor = gray //apply to the navigation bar background.
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()] // 设置字体颜色
    }
    
    func configureStatusBar() {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        setStatusBarBackgroundColor(gray)
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        
        guard let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
            return
        }
        

        statusBar.backgroundColor = color
        
        
        //
        //        guard let statusbars = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
        //            return
        //        }
        //        statusbars.backgroundColor = nil
    }

}
