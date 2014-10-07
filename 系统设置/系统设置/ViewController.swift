//
//  ViewController.swift
//  系统设置
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataList:NSArray!
    
    override func loadView() {
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame, style: UITableViewStyle.Grouped)
        self.title = "设置"
        var array = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("settings", ofType: "plist")!)!
        var arrayM = NSMutableArray(capacity: array.count)
        for sectionArray in array {
            var sectionArrayM = NSMutableArray(capacity: sectionArray.count)
            for dict in sectionArray as NSArray {
                var item = SettingItem.settingItemWithDict(dict as NSDictionary)
                sectionArrayM.addObject(item)
            }
            arrayM.addObject(sectionArrayM)
        }
        self.dataList = arrayM
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataList.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataList[section] as NSArray).count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var settingItem = (dataList[indexPath.section] as NSArray)[indexPath.row] as SettingItem
        var cell:UITableViewCell!
        if settingItem.detail == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
            cell.detailTextLabel?.text = settingItem.detail
        }
        cell.textLabel?.text = settingItem.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        println("accessoryButtonTappedForRowWithIndexPath \(indexPath)")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var settingItem = (dataList[indexPath.section] as NSArray)[indexPath.row] as SettingItem
        println("didSelectRowAtIndexPath \(settingItem.name)")
        
        var detailViewController = DetailViewController.initWithBlock({(mySwitch:MySwitch) in
            if mySwitch.on {
                println("打开了 \(mySwitch.indexPath)")
            } else {
                println("关闭了 \(mySwitch.indexPath)")
            }
        })
        
        detailViewController.dataFilename = settingItem.identifier
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
    

}