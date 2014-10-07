//
//  SecondViewController.swift
//  嵌入视图控制器管理多个表格
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    let CELL_ID = "MyCell1"
    
    // 实例化视图，因为要把本试图可能告知其的view添加到ViewController的self.subView中，大小要调整
    override func loadView() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, 320, 200), style: UITableViewStyle.Plain)
        self.tableView.backgroundColor = UIColor.lightGrayColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CELL_ID) as UITableViewCell!
        }
        cell.textLabel?.text = "title"
        return cell
    }
}