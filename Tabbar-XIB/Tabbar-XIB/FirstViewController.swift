//
//  FirstViewController.swift
//  Tabbar-XIB
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/**
1.经常使用的属性：
1》viewControllers：所有的子视图
2》title：子项目的标题
3》badgeValue：字符串类型的数字，显示在右上角
4》image：需要打开alpha通道，可以找美工帮忙，小雨32*32，png格式
2.如果使用代码方式设置tabbar中的内容，需要在第一个视图控制器中遍历所偶的子视图控制器
遍历方法使用isKindOf，判断对应的视图控制器是否是我们需要的
提示：isKindOf方法在iOS开发的子视图遍历中使用的非常频繁
*/
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 在选项卡应用中 self.parentViewController = self.tabBarController
        // 可以根据self.tabBarItem设置其中的属性
        println("\(self.parentViewController)  \(self.tabBarController)")
        println("\(self.tabBarController?.viewControllers)")
        
        self.tabBarItem.title = "第一项"
        self.tabBarItem.badgeValue = "10"
        self.tabBarItem.image = UIImage(named: "tab1.png")
        
        for controller in self.tabBarController!.viewControllers! {
            if controller.isKindOfClass(SecondViewController) {
                (controller as SecondViewController).view.backgroundColor = UIColor.greenColor()
                println("第二个")
            } else if controller.isKindOfClass(ThirdViewController) {
                (controller as ThirdViewController).view.backgroundColor = UIColor.blueColor()
                println("第三个")
            }
        }
    }

}
