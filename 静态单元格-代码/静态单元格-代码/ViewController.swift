//
//  ViewController.swift
//  静态单元格-代码
//
//  Created by bingoogol on 14/9/25.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func loadView() {
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame,style:UITableViewStyle.Grouped)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 针对静态单元格，不需要任何优化
        var cell:UITableViewCell
        // 需要根据indexPath来决定需要显示的内容
        if indexPath.section == 0 {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)!
            cell.textLabel?.text = "蓝牙"
            cell.detailTextLabel?.text = "关于"
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)!
            if indexPath.row == 0 {
                cell.textLabel?.text = "通用"
            } else {
                cell.textLabel?.text = "隐私"
            }
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
}