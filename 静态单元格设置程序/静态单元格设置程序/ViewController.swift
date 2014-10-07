//
//  ViewController.swift
//  静态单元格设置程序
//
//  Created by bingoogol on 14/9/25.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataList:NSArray!
    
    override func loadView() {
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame,style:UITableViewStyle.Grouped)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        var path = NSBundle.mainBundle().pathForResource("settings", ofType: "plist")
        self.dataList = NSArray(contentsOfFile: path!)
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataList.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var array = self.dataList[section] as NSArray
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        // 根据字典中是否定义了detail来决定表格样式
        var dict = self.dataList[indexPath.section][indexPath.row] as NSDictionary
        var detail = dict["detail"] as NSString?
        if detail == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)!
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)!
            cell.detailTextLabel?.text = detail
        }
        cell.textLabel?.text = dict["name"] as NSString
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if 0 == indexPath.section && 0 == indexPath.row {
            var cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.tag = cell?.tag == 0 ? 1 : 0
            cell?.detailTextLabel?.text = cell?.tag == 1 ? "打开" : "关闭"
        }
        var dict = self.dataList[indexPath.section][indexPath.row] as NSDictionary
        var id = dict["id"] as NSString
        println("id:\(id)")
        // 如果有后续的内容，可以通过获取到的id，加载对应的Plist文件即可
    }
}