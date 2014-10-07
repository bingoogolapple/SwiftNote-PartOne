//
//  ViewController.swift
//  编辑模式-删除
//
//  Created by bingoogol on 14/9/27.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let TOOLBAR_HEIGHT:CGFloat = 44
    let APPLICATION_FRAME = UIScreen.mainScreen().applicationFrame
    var dataList:NSMutableArray!
    weak var tableView:UITableView!
    
    override func loadView() {
        // 1.视图
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        // 2.工具栏
        var toolbar = UIToolbar(frame: CGRectMake(0, APPLICATION_FRAME.origin.y, self.view.bounds.width, TOOLBAR_HEIGHT))
        self.view.addSubview(toolbar)
        // 1)按钮间距
        var spaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        // 2)删除按钮
        var trashItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: Selector("trash"))
        trashItem.style = UIBarButtonItemStyle.Bordered
        // 注意！！！用这种方式添加Item，而不是用toolbar.addSubview
        toolbar.setItems([spaceItem,trashItem], animated: false)
        
        // 3)添加标签
        var label = UILabel(frame: toolbar.bounds)
        label.backgroundColor = UIColor.clearColor()
        label.text = "商品列表"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(20)
        // 在storyboard中不能直接拖UILabel到toolbar中，但是用代码的方式可以直接用toolbar.addSubview添加
        toolbar.addSubview(label)
        // 3.表格
        var tableView = UITableView(frame: CGRectMake(0, APPLICATION_FRAME.origin.y + TOOLBAR_HEIGHT, APPLICATION_FRAME.width, APPLICATION_FRAME.height - TOOLBAR_HEIGHT))
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        // 初始化数据
        dataList = NSMutableArray(capacity: 30)
        for i in 0 ..< 30 {
            dataList.addObject(NSString(format: "商品-%03d", i))
        }
    }
    
    func trash() {
        tableView.setEditing(!tableView.editing, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)!
        cell.textLabel?.text = dataList[indexPath.row] as NSString
        return cell
    }
    
    // 提交编辑样式
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if UITableViewCellEditingStyle.Delete == editingStyle {
            /**
            注意：此处的方法顺序不能够颠倒
            
            界面上的内容显示是基于数组的，所有要显示之前，我们需要先把数据的内容搞定
            */
            // 1.删除数据
            dataList.removeObjectAtIndex(indexPath.row)
            // 2.刷新数据
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
            println(dataList)
        }
    }
    
}