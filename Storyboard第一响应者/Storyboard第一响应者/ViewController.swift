//
//  ViewController.swift
//  Storyboard第一响应者
//
//  Created by bingoogol on 14/9/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 剪贴板
        // 1.获取通用的剪贴板对象
        var pasteBoard = UIPasteboard.generalPasteboard()
        // 2.定义一个字符换
        var copyString = "Hello PasteBoard"
        // 3.将字符串添加到剪贴板中
        pasteBoard.string = copyString
    }

}

