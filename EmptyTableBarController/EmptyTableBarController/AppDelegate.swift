//
//  AppDelegate.swift
//  EmptyTableBarController
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        let vc1:UIViewController = FirstViewController()
        let nav1 = UINavigationController(rootViewController:vc1)
        nav1.tabBarItem = UITabBarItem(title: "PPT", image: UIImage(named:"ppt.png"), tag: 1)
        
        let vc2:UIViewController = SecondViewController()
        let nav2 = UINavigationController(rootViewController:vc2)
        nav2.tabBarItem = UITabBarItem(title: "WORD", image: UIImage(named:"word.png"), tag: 2)
        
        let vc3:UIViewController = ThreeViewController()
        let nav3 = UINavigationController(rootViewController:vc3)
        nav3.tabBarItem = UITabBarItem(title: "EXCEL", image: UIImage(named:"excel.png"), tag: 3)
        
        let vcArr = [nav1,nav2,nav3]
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = vcArr
        
        self.window!.rootViewController = tabBarController
        
        
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


}

