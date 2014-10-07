//
//  RootViewController.swift
//  EmptyTableView
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class RootViewController : UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataArr = NSMutableArray()
    var _tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 1 ... 50 {
            dataArr.addObject("row \(index)")
        }
        
        _tableView = UITableView(frame:CGRect(x:10,y:10,width:200,height:400))
        _tableView!.delegate = self
        _tableView!.dataSource = self
        
        self.view.addSubview(_tableView)
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cellid = "my cell id"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellid) as? UITableViewCell
        if cell != nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellid)
        }
        var data = dataArr.objectAtIndex(indexPath.row) as? String
        cell!.textLabel.text = data
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("点击了\(indexPath.row)")
    }
}
