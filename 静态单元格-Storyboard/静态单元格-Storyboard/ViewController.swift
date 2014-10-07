//
//  ViewController.swift
//  静态单元格-Storyboard
//
//  Created by bingoogol on 14/9/25.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var detail1: UILabel!
    
    @IBOutlet weak var title2: UILabel!

    @IBOutlet weak var title3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title1.text = "蓝牙"
        self.title2.text = "通用"
        self.title3.text = "隐私"
        self.detail1.text = "关于"
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            // 1.取出用户点击的表格行
            var cell = tableView.cellForRowAtIndexPath(indexPath)
            // 2.利用表格行的tag表示打开和关闭状态
            cell?.tag = cell?.tag == 0 ? 1 : 0
            var str = cell?.tag == 1 ? "打开" : "关闭"
            // 3.根据状态设置单元格的内容
            self.detail1.text = str
        }
    }

}