//
//  AppDelegate.swift
//  UIApplication
//
//  Created by bingoogol on 14/9/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
1.应用程序成为激活状态后，才可以与用户进行交互
2.如果要做保存游戏状态之类操作，应该在注销激活方法（applicationWillResignActive）中处理，因为用户可能会双击home键打开任务栏，此时应用程序不会退出到后台
3.如果要做恢复游戏状态之类的操作，应该在成为激活状态方法（applicationDidBecomeActive）中处理，因为用户可能是从任务栏中返回的
4.如果程序运行过程中，内存或其他原因，程序会被系统强行退出时，会调用applicationWillTerminate方法，开发者可以在此记录应用程序被退出前的状态，以便改进系统
5.应用程序退出到后台后，未必会是休眠状态，有可能会继续运行，例如：微博、音乐播放器、qq等
6.在UIKit开发中，通常不用在delegate中写内存警告方法，直接在ViewController中进行处理即可。而在cocos2d的开发中，必须要在内存警告方法中进行处理，以免出现程序闪退的情况
*/
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    // 应用程序完成启动，第一个调用的代理方法
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        println("应用程序完成启动，第一个调用的代理方法")
        // Override point for customization after application launch.
        return true
    }

    // 注销激活状态
    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        println("注销激活")
    }

    // 进入后台时调用
    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        println("进入后台")
    }

    // 准备进入前台
    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        println("准备进入前台")
    }
    
    // 成为激活对象
    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        println("成为激活对象")
    }

    // 将被终止。这个方法是由系统调用的，一般情况下无法测出来
    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        println("将被终止")
    }
    
    // 接收内存警告
    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        // 会去通知UIViewController执行相应地内存警告方法，以释放一部分资源，保证应用程序的正常运行
        // 做应用开发通常不用写该方法，cocos2d开发才需要
    }


}

