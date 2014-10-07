//
//  SecondViewController.swift
//  Tabbar-XIB
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "第二项"
        self.tabBarItem.badgeValue = "5"
        self.tabBarItem.image = UIImage(named: "tab2.png")
    }

}
