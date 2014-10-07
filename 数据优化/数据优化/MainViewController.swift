//
//  MainViewController.swift
//  数据优化
//
//  Created by bingoogol on 14/9/23.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

let CELL_ID = "MYCELL"
let HEADER_ID = "MYHEADER"

class MainViewController: UITableViewController {
    override func loadView() {
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else if section == 1 {
            return 20
        } else {
            return 15
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CELL_ID)
            println("实例化单元格\(indexPath.section)组\(indexPath.row)行")
        }
        cell?.textLabel?.text = "\(indexPath.section)组\(indexPath.row)行"
        return cell!
    }
    
    // 如果是字符串形式，本身不需要进行优化，因为通常会有一个数据字典维护，需要显示字符串，直接通过section从数组中提取即可
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "第\(section)组"
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(HEADER_ID) as? UITableViewHeaderFooterView
        var button:UIButton
        if header == nil {
            header = UITableViewHeaderFooterView(reuseIdentifier: HEADER_ID)
            header?.frame = CGRectMake(0, 0, self.tableView.bounds.width, 44)
            // Setting the background color on UITableViewHeaderFooterView has been deprecated. Please use contentView.backgroundColor instead.
            button = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = header!.bounds
            header?.addSubview(button)
            println("实例化标题行")
        } else {
            button = header?.subviews[2] as UIButton
        }
        button.setTitle("组\(section)", forState: UIControlState.Normal)
        return header
    }

}