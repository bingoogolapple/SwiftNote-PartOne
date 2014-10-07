//
//  DetailViewController.swift
//  系统设置
//
//  Created by bingoogol on 14/10/7.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

typealias SwitchValueChangedBlock = (MySwitch) -> Void

class DetailViewController: UITableViewController {
    var dataFilename:NSString!
    var dataList:NSArray!
    var switchValueChangedBlock:SwitchValueChangedBlock!
    
    class func initWithBlock(block:SwitchValueChangedBlock) -> DetailViewController {
        var instance = DetailViewController()
        instance.switchValueChangedBlock = block
        return instance
    }
    
    override func loadView() {
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame, style: UITableViewStyle.Grouped)
        self.title = "明细"
        var array = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource(dataFilename, ofType: "plist")!)!
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
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)!
        
        if settingItem.hasSwitch? == true {
            // 通过自定义视图解决参数传递问题
            var mySwitch = MySwitch()
            mySwitch.indexPath = indexPath
            if settingItem.switchValue? == true {
                mySwitch.on = true
            } else {
                mySwitch.on = false
            }
            mySwitch.addTarget(self, action: Selector("switchValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
            cell.accessoryView = mySwitch
        }
        cell.textLabel?.text = settingItem.name
        
        return cell
    }
    
    func switchValueChanged(mySwitch:MySwitch) {
        self.switchValueChangedBlock(mySwitch)
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        println("accessoryButtonTappedForRowWithIndexPath \(indexPath)")
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var settingItem = (dataList[indexPath.section] as NSArray)[indexPath.row] as SettingItem
        println("didSelectRowAtIndexPath \(settingItem.name)")
    }
}