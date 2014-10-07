//
//  ThirdViewController.swift
//  Tabbar-XIB
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "第三项"
        self.tabBarItem.badgeValue = "2"
        self.tabBarItem.image = UIImage(named: "tab3.png")
    }

}
