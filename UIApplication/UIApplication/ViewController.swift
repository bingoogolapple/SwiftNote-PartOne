//
//  ViewController.swift
//  UIApplication
//
//  Created by bingoogol on 14/9/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
    }

    @IBAction func clickMe() {
        // 一般来讲，所有shared开头创建的对象，都是单例
        var app = UIApplication.sharedApplication()
        // 设置图标右上角显示的数字
        // 提醒：在设置数字时，要谨慎，对于强迫症患者
        //app.applicationIconBadgeNumber = 10
        
        // 显示联网状态的提示，一般有网络请求，会自动显示
        //app.networkActivityIndicatorVisible = true
        
        //在iOS中，很多东西都可以通过URL来访问，例如：电话、短信、电子邮件等
        //var url = NSURL(string: "http://www.baidu.com")
        // 电话会直接呼出
        //var url = NSURL(string: "tel://10086")
        // 会跳出短信发送界面，等待用户编辑并发送短信
        //var url = NSURL(string: "sms://10086")
        //app.openURL(url)
        
        // 阻止屏幕变暗，慎重使用，缺省为false
        app.idleTimerDisabled = true
        
    }
    
    // 当应用程序出现内存警告时，控制器可以在此方法中释放自己的资源
    override func didReceiveMemoryWarning() {
        
    }
}