//
//  AppDelegate.swift
//  AllFunc
//
//  Created by lanet on 09/02/18.
//  Copyright © 2018 lanet. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nav1 : UINavigationController!
    var navApperiance = UINavigationBar.appearance()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //MARK:- UINavigationController without view
        nav1 = UINavigationController()
        self.window?.rootViewController = nav1
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        nav1.pushViewController(vc, animated: true)
        
        //MARK:- Navigation Bar
        navApperiance.tintColor = UIColor.black
        navApperiance.barTintColor = UIColor.white
        navApperiance.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        
        
//        //create a new window for the window property that
//        //comes standerd on the AppDelegate class.
//        //The UIWindow is where all view controller and views appers.
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        //create a new instance of view controller
//        let mainViewController = ViewController()
//
//        //set the intial view controller to the main view controller
//        window?.rootViewController = mainViewController
//
//        //present the window
//        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        
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
        // Saves changes in the application's managed object context before the application terminates.
    }
}

