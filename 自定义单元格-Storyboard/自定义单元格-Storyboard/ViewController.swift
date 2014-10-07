//
//  ViewController.swift
//  自定义单元格-Storyboard
//
//  Created by bingoogol on 14/9/25.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let CELL_ID = "MyCell"
    // 在storyboard中指定的
    let NAME_TAG = 100
    let IMAGE_TAG = 101
    let DATE_TAG = 102

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func purchase(sender: UIButton) {
        // 用户点击的行
        // 1)需要知道按钮在哪个单元格中
        // 注意：UITableViewCell中可能有多个孩子，往TableViewCell中加内容实际上是加到contentView中的，contentView的大小可能会变。
        var cell = sender.superview?.superview as UITableViewCell
        var indexPath = self.tableView.indexPathForCell(cell)
        // 2)获取单元格所在的indexPath
        
        println("purchase\(indexPath?.row)")
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 如果在storyboard中定义有单元格，系统会自动注册，可以不用再判断cell是否被实例化
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as UITableViewCell
        /*
        可以通过控件的tag获取到单元格中的内容
        但是tableViewCell的contentView中默认包含有textLabel、detailTextLabel、imageView
        如果要使用tag，不能从0开始
        */
        // 商品名称标签
        // 注意：通过tag找view的效率会比连线的执行效率差
        var name = cell.viewWithTag(NAME_TAG) as UILabel
        name.text = "\(indexPath.row)"
        // 商品的图片
        var imageView = cell.viewWithTag(IMAGE_TAG) as UIImageView
        var imageName = NSString(format: "%03d.png", arc4random_uniform(9) + UInt32(1))
        
        // 商品日期标签
        var date = cell.viewWithTag(DATE_TAG) as UILabel
        date.text = NSString(format: "2013-09-%02d", arc4random_uniform(10) + UInt32(1))
        return cell
    }

}