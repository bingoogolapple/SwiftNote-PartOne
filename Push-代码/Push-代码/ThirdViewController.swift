//
//  ThirdViewController.swift
//  Push-代码
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        
        
        println("Third-\(self.navigationController)   \(self.parentViewController)")
        println("Third-子视图数量：\(self.navigationController?.childViewControllers)")
    }

}
