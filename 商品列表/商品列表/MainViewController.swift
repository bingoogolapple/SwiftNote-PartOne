//
//  ViewController.swift
//  商品列表
//
//  Created by bingoogol on 14/9/22.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController,UIAlertViewDelegate {
    var productList:NSArray!
    let kProductCount = 50
    
    override func loadView() {
        // 在UITableViewController中，根视图self.view就是self.tableView
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var array = NSMutableArray(capacity: kProductCount)
        for index in 0 ..< kProductCount {
            array.addObject(Product.productWithName(NSString(format: "商品-%03d",index)))
        }
        self.productList = array
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        var product = self.productList[indexPath.row] as Product
        cell?.textLabel?.text = product.name
        cell?.detailTextLabel?.text = product.detail
        cell?.imageView?.image = product.image
        // 设置右边的箭头
        cell?.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        return cell!
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        println("点击箭头\(indexPath.row)")
        self.selectedRowWithIndexPath(indexPath)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("选中行\(indexPath.row)")
        self.selectedRowWithIndexPath(indexPath)
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("取消选中行\(indexPath.row)")
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        println("\(buttonIndex)")
        if buttonIndex == 1 {
            var name = alertView.textFieldAtIndex(0)?.text
            println("\(name)")
            var indexPath = self.tableView.indexPathForSelectedRow()
            var product = productList[indexPath!.row] as Product
            product.name = name
            // self.tableView.reloadData()
            
//            var array = [indexPath!]
            var array = self.tableView.indexPathsForSelectedRows()
            self.tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }
    
    func selectedRowWithIndexPath(indexPath:NSIndexPath) {
        // 用代码的方式选中行
        tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Middle)
        
        var product = productList[indexPath.row] as Product
        // 如果一共只有一个按钮，将取消按钮的文字设置成“确定”
        // 如果一共只有连个按钮，将otherButton的第一个按钮设置成“确定”
        // 如果超过了三个按钮，会纵向排列
        var alertView = UIAlertView(title: "商品信息", message: "商品", delegate: self, cancelButtonTitle: "取消",otherButtonTitles:"确定")
        // alertView.tag = indexPath.row
        alertView.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alertView.textFieldAtIndex(0)?.text = product.name
        alertView.show()
    }
}