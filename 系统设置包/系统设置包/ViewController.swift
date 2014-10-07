//
//  ViewController.swift
//  系统设置包
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        1.观察者：NSNotificationCenter
        2.通知对象：self
        3.执行方法：valueChanged
        4.观察对象：NSUserDefaults（系统偏好）数值变化
        */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("valueChanged"), name: NSUserDefaultsDidChangeNotification, object: nil)
    }
    
    // 在多视图控制器之间来回切换，出现屏幕上时才会执行，通常很少重写此方法
    // 如果应用程序已经运行，用户点击图标进入系统，此方法不会执行
    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear")
    }
    
    func valueChanged() {
        println("valueChanged")
        // 显示用户在设置中输入的文本
        // 1>读取【系统偏好】设置中的内容，方法和系统偏好一致
        var defaults = NSUserDefaults.standardUserDefaults()
        // 2>键值对应的字符串就是Root.plist中的identifier
        var str = defaults.stringForKey("name_preference")
        nameTf.text = str
    }

}