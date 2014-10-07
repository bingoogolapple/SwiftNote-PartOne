//
//  ViewController.swift
//  Push-代码
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100,100,200, 100)
        button.setTitle("second", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("second"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        // 1.设置标题
        // self.navigationItem.title = "第一个"
        self.title = "第一个"
        
        // 2.返回按钮
        // target和action设置为空，系统会使用默认操作
        var backBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        // 返回按钮是懒加载的
        self.navigationItem.backBarButtonItem = backBarButtonItem
        // 3.左侧和右侧的按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "设置", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: nil, action: nil)
        // 4.跟踪子视图控制器
        println("Root-\(self.navigationController)   \(self.parentViewController)")
        println("Root-子视图数量：\(self.navigationController?.childViewControllers)")
    }
    
    func second() {
        // 用NavgationController push
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }

}