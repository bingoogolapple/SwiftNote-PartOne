//
//  ViewController.swift
//  SwiftCallOC
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img = UIImage(named: "hehe.jpg")
        var iv = QFImageView(frame: CGRectMake(100, 100, 200, 200))
        iv.image = img
        iv.addTarget(self, withSelector: Selector("imageClick:"))
        self.view.addSubview(iv)
    }

    func imageClick(iv:QFImageView) {
        println("点击了图片")
        iv.test()
        
        var name:String = "你好"
        var c = iv.getLetter(name)
        println("首字母是：\(c)")
    }
}