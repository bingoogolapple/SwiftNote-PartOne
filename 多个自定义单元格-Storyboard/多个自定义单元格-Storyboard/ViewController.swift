//
//  ViewController.swift
//  多个自定义单元格-Storyboard
//
//  Created by bingoogol on 14/9/27.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataList:NSArray!
    
    let MY_CELL_ID = "MyCell"
    let HER_CELL_ID = "HerCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        var path = NSBundle.mainBundle().pathForResource("messages", ofType: "plist")
        dataList = NSArray(contentsOfFile: path!)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var dict = dataList[indexPath.row] as NSDictionary
        var fromSelf = dict["fromSelf"]!.boolValue as Bool
        var cell:UITableViewCell
        var button:UIButton
        if fromSelf {
            cell = tableView.dequeueReusableCellWithIdentifier(MY_CELL_ID) as UITableViewCell
            button = cell.viewWithTag(100) as UIButton
            button.setBackgroundImage(UIImage(named: "chatto_bg_normal.png"), forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage(named: "chatto_bg_focused.png"), forState: UIControlState.Highlighted)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(HER_CELL_ID) as UITableViewCell
            button = cell.viewWithTag(100) as UIButton
            button.setBackgroundImage(UIImage(named: "chatfrom_bg_normal.png"), forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage(named: "chatfrom_bg_focused.png"), forState: UIControlState.Highlighted)
            
        }
        button.titleLabel?.text = dict["content"] as NSString
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}