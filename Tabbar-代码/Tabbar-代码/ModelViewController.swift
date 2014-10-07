//
//  ModelViewController.swift
//  Tabbar-代码
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 200, 100)
        button.setTitle("登陆", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        // 模态窗口是独立存在的，没有父Controller
        println("\(self.parentViewController)")
    }
    
    func login() {
        // 假设点击次按钮登陆成功，关闭当前的模态窗口
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
