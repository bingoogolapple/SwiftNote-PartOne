//
//  MainTabViewController.swift
//  swift2048
//
//  Created by bingoogol on 14-6-18.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainTabViewController:UITabBarController {
    
    init() {
        super.init(nibName:nil,bundle:nil)
        var mainViewController = MainViewController()
        mainViewController.title = "2048"
        var settingViewController = SettingViewController()
        settingViewController.title = "设置"
        
        var mnc = UINavigationController(rootViewController:mainViewController)
        var snc = UINavigationController(rootViewController:settingViewController)
        self.viewControllers = [mnc,snc]
        self.selectedIndex = 0
    }
}
