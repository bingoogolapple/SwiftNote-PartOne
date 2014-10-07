//
//  NewsViewController.swift
//  网易新闻侧栏
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var label = UILabel(frame: CGRectMake(100, 100, 100, 30))
        label.text = "新闻"
        self.view.addSubview(label)
    }

}
