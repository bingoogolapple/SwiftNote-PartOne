//
//  ViewController.swift
//  TableView1
//
//  Created by bingoogol on 14-6-15.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    var bj:NSArray!
    var gd:NSArray!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        bj = ["东城","西城","宣武","崇文"]
        gd = ["广州","佛山","深圳"]
    }

    // 分组，Section表示表格的组数
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 2
    }

    // 每个分组中显示的数据量
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return bj.count
        } else {
            return gd.count
        }
    }
    
    // 每个分组中显示的数据内容
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: nil)
        if indexPath.section == 0 {
            cell.textLabel.text = bj[indexPath.row] as String
        } else {
            cell.textLabel.text = gd[indexPath.row] as String
        }
        return cell
    }
    
    // 分组的标题
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        return section == 0 ? "北京":"广东"
    }
    
    //
    func tableView(tableView: UITableView!, titleForFooterInSection section: Int) -> String! {
        return section == 0 ? "北京有烤鸭":"广东有黄飞鸿"
    }
}

