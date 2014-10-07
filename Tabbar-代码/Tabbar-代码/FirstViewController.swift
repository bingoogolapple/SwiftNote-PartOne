//
//  MainViewController.swift
//  Tabbar-代码
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 200, 100)
        button.setTitle("Model", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("model"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func model() {
        println("model")
        var modelViewController = ModelViewController()
        // 模态弹出视图控制器
        self.presentViewController(modelViewController, animated: true, completion: nil)
    }
}
