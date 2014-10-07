//
//  ViewController.swift
//  StoryboardUnwind
//
//  Created by bingoogol on 14/9/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit


/*
要使用storyboard中的Exit Unwind(解除->Segue的逆向操作)
1.要在返回到的视图控制器中定义一个方法
@IBAction func xxx(segue:UIStoryboardSegue)
1)方法名任意
2)参数一定是UIStoryboardSegue
3)返回值一定是IBAction
2.昨晚上述操作后即可在storyboard中关闭当前视图控制器

*/
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("blue viewDidLoad:\n\(self.navigationController?.childViewControllers)")
        
    }
    
    @IBAction func xxx(segue:UIStoryboardSegue) {
        println("blue xxx:\n\(self.navigationController?.childViewControllers)")
    }
}

