//
//  ViewController.swift
//  Static表格
//
//  Created by bingoogol on 14/8/26.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // 在静态表格中，可以等同于UIViewController使用，在静态表格中，程序员几乎不需要考虑键盘的问题
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet var password: UITextField!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(patternImage:UIImage(named: "bg.jpg"))
        
    }

    
    @IBAction func saveUserData(sender: UIButton) {
        println("保存用户信息")
    }
    
}