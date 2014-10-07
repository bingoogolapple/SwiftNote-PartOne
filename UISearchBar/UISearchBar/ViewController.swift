//
//  ViewController.swift
//  UISearchBar
//
//  Created by bingoogol on 14/9/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

// 表格行的可重用标示符
let TableID = "myCell"

class ViewController: UITableViewController,UISearchDisplayDelegate {
    
    // 表格本身显示的数据
    var dataList:NSMutableArray!
    // 搜索结果数据
    var resultList:NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataList = NSMutableArray(capacity: 30)
        //初始化数据
        for index in 0 ..< 30 {
            dataList.addObject("bingoogol\(arc4random_uniform(10000))")
        }
        
        
        // 为搜索栏中的TableView注册可重用单元格
        self.searchDisplayController.searchResultsTableView.registerClass(MyCell.classForCoder(), forCellReuseIdentifier: TableID)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 如果使用搜索栏搜索数据，在处理数据源方法时，需要对传入的表格进行对比
        if self.searchDisplayController.searchResultsTableView == tableView {
            return resultList == nil ? 0 : resultList.count
        } else {
            return dataList.count
        }
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(TableID) as? UITableViewCell
        // 注意：在storyboard中的设定，只能将原型单元格注册到tableView，而不会注册到SearchBar的TableView
        // 因此，在此需要对cell是否初始化做进一步处理
        //上面已经注册过了，所以次错不用再实例化
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: ID)
//        }
        
        
        // 如果使用搜索栏搜索数据，在处理数据源方法时，需要对传入的表格进行对比
        if self.searchDisplayController.searchResultsTableView == tableView {
            cell?.textLabel.text = resultList.objectAtIndex(indexPath.row) as NSString
        } else {
           cell?.textLabel.text = dataList.objectAtIndex(indexPath.row) as NSString
        }
        return cell
    }
    
    //搜索栏代理方法
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        // 根据用户输入的内容，对现有表格内容进行匹配
        var predicate:NSPredicate = NSPredicate(format: "self CONTAINS[C] '\(searchString)'")
        // 在查询之前需要清理或者初始化数组：懒加载
        if resultList != nil {
            resultList.removeAllObjects()
        }
        resultList = NSMutableArray(array: dataList.filteredArrayUsingPredicate(predicate))
        
        // 返回true，刷新表格
        return true
    }
}