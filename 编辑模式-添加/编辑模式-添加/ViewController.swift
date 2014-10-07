//
//  ViewController.swift
//  编辑模式-添加
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
        // 2)添加按钮
        var addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("add"))
        addItem.style = UIBarButtonItemStyle.Bordered
        // 注意！！！用这种方式添加Item，而不是用toolbar.addSubview
        toolbar.setItems([spaceItem,addItem], animated: false)
        
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
    
    func add() {
        // 如果要在同一个界面中实现添加和删除，可以通过tag来保存当前是删除还是添加状态
        //self.tableView.tag = UITableViewCellEditingStyle.Insert.rawValue
        //UITableViewCellEditingStyle(rawValue: <#Int#>)
        
        tableView.setEditing(!tableView.editing, animated: true)
    }
    
    // 通知表格应该变成什么样式，如果不写此方法，默认都是删除
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Insert
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
        if UITableViewCellEditingStyle.Insert == editingStyle {
            // 1.向数组中增加数据
            dataList.insertObject("new Product", atIndex: indexPath.row + 1)
            // 2.刷新数据
            // 参数indexPaths是“新增”数据行对应的indexPath的数组
            var newPath = NSIndexPath(forRow: indexPath.row + 1, inSection: 0)
            tableView.insertRowsAtIndexPaths([newPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }
    
}