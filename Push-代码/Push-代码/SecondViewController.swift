//
//  NextViewController.swift
//  Push-代码
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Third", style: UIBarButtonItemStyle.Done, target: self, action: Selector("third"))
        
        println("Second-\(self.navigationController)   \(self.parentViewController)")
        println("Second-子视图数量：\(self.navigationController?.childViewControllers)")
    }
    
    func third() {
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }

}
