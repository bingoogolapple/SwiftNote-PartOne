//
//  ViewController.swift
//  偏好设置
//
//  Created by bingoogol on 14/8/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/*
需求：
1.在屏幕上创建一个按钮，点击按钮保存以下数据到系统偏好
用户名（NSString）/自动登录(Bool)
2.在系统启动时，从系统偏好读取用户名和自动登录，并打印输出
*/
class ViewController: UIViewController {
    let documentPath: NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
        println(documentPath)
        
        // 读取系统偏好中的内容
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var username:NSString = defaults.objectForKey("username") as NSString
        var autoLogin:Bool = defaults.boolForKey("autoLogin")
        println("\(username)  \(autoLogin)")
    }
    
    
    // 创建UI布局
    func createLayout() {
        var saveBtn:UIButton = UIButton.buttonWithType(UIButtonType.System)
         as UIButton
        saveBtn.frame = CGRect(x: 110, y: 210, width: 100, height: 40)
        saveBtn.setTitle("保存", forState: UIControlState.Normal)
        saveBtn.addTarget(self, action: Selector("saveData"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(saveBtn)
    }
    
    func saveData() {
        var username:NSString = "王老五"
        var autoLogin:Bool = false
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        // 通常系统偏好中保存的数据，并不是实时保存的，具体保存时间，由系统调度
        defaults.setObject(username, forKey: "username")
        defaults.setBool(autoLogin, forKey: "autoLogin")
        // 如果对于某些需要保存在偏好设置中的数据，要求实时的响应，需要在保存系统偏好设置时，调用一个同步方法
        defaults.synchronize()
        println("保存数据成功")
    }

}