//
//  AppDelegate.swift
//  Empty
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        println(UIScreen.mainScreen().bounds)
        println(UIScreen.mainScreen().applicationFrame)
        // 对于每一个应用程序而言，都有一个状态栏
        // 4s  (0.0,0.0,320.0,480.0)   (0.0,20.0,320.0,460.0)空出了20得状态栏高度
        // 5   (0.0,0.0,320.0,568.0)
        // 5s  (0.0,0.0,320.0,568.0)
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        // 设置窗口的背景颜色
        self.window!.backgroundColor = UIColor.whiteColor()
        
        // rootViewController是可以让window与控制器联动，从而可以根据设备方向进行界面的旋转
        // UIView本身并不能处理旋转事件，设备的旋转是由viewController来控制的
        // 将视图控制器设置为window的根视图控制器
        self.window!.rootViewController = RootViewController()
        
        // 让窗口成为关键窗口并可见
        self.window!.makeKeyAndVisible()
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

