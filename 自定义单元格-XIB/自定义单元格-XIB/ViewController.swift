//
//  ViewController.swift
//  自定义单元格-XIB
//
//  Created by bingoogol on 14/9/26.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/*
实例化视图
BUT在单组的tableView中，不需要实例化视图
UITableViewController中，已经帮我们做了self.view = self.tableView
在默认的loadView中会替我们完成
*/
class ViewController: UITableViewController {
    let CELL_ID = "MyCell"
    let NAME_TAG = 100
    let IMAGE_TAG = 101
    let DATE_TAG = 102
    let BUTTON_TAG = 103
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 重点
    func buy(sender: AnyObject, forEvent event: UIEvent) {
        // 取出所有手指的触摸
        var set = event.allTouches()
        // 取出任意手指的触摸
        var touch = set?.anyObject() as UITouch
        // 根据手指的触摸找到触摸位置
        var point = touch.locationInView(self.tableView)
        // 根据用户手指触摸位置找到对应的单元格
        var indexPath = self.tableView.indexPathForRowAtPoint(point)
        println("购买了\(indexPath?.row)")
    }
    
    
    // 在使用XIB时，不能使用该方法
    // 此方法要求contentView和按钮的层次结构固定，一旦变化，会比较麻烦
//    @IBAction func purchase(sender: UIButton) {
//        var cell = sender.superview?.superview as UITableViewCell
//        var indexPath = self.tableView.indexPathForCell(cell)
//        // 2)获取单元格所在的indexPath
//        
//        println("purchase\(indexPath?.row)")
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as UITableViewCell?
        // 如果没有在缓冲池找到cell，实例化(注意：其实这里没有注册可重用，所以每次都会实例化)
        if cell == nil {
            // MyCell XIB文件中定义的Objects数组
            var array = NSBundle.mainBundle().loadNibNamed("MyCell", owner: nil, options: nil)
            // 此处的Objects数组长度为1，直接去最后一个
            cell = array.last as? UITableViewCell
            
            var button = cell?.viewWithTag(BUTTON_TAG) as UIButton
//            button.addTarget(self, action: Selector("purchase:"), forControlEvents: UIControlEvents.TouchUpInside)
            button.addTarget(self, action: Selector("buy:forEvent:"), forControlEvents: UIControlEvents.TouchUpInside)
        }
        var name = cell?.viewWithTag(NAME_TAG) as UILabel
        name.text = NSString(format: "商品-%02d", indexPath.row)
        var imageView = cell?.viewWithTag(IMAGE_TAG)
        
        var date = cell?.viewWithTag(DATE_TAG)
        
        
        
        return cell!
    }
    
    // 通过Storyboard的方式时，已经在Storyboard中指定了行高。此时是使用XIB实现的，需要通过代码的方式指定行高
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}