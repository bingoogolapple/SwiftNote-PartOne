//
//  LeftViewController.swift
//  网易新闻侧栏
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol LeftViewControllerDelegate:NSObjectProtocol {
    func leftViewController(controller:LeftViewController?,className:NSString)
}

class LeftViewController: UITableViewController {
    
    var dataList:NSArray!
    var leftDelegate:LeftViewControllerDelegate?
    
    override func loadView() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, 130, 548), style: UITableViewStyle.Plain)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var path = NSBundle.mainBundle().pathForResource("navMenu", ofType: "plist")
        var array = NSArray(contentsOfFile: path!)!
        var dataListM = NSMutableArray(capacity: array.count)
        for dict in array {
            var leftMemu = LeftMenu.leftMenuWithDict(dict as NSDictionary)
            dataListM.addObject(leftMemu)
        }
        self.dataList = dataListM
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)!
        var menu = dataList[indexPath.row] as LeftMenu
        cell.imageView?.image = menu.image
        cell.detailTextLabel?.text = menu.title
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        leftDelegate?.leftViewController(self, className: (dataList[indexPath.row] as LeftMenu).className)
    }
}