//
//  MainViewController.swift
//  省份城市分组
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/*
在UITableViewController中，不用去刻意指定tableView的数据源和代理
*/
class MainViewController: UITableViewController {
    // dataDict由MainViewController管理
    var dataDict:NSDictionary!
    var provinceArray:NSArray!
    // provinceDict由dataDict管理，只要dataDict还在，那么provinceDict就还在。dataDict强引用了后，provinceDict就可以是弱引用
    weak var provinceDict:NSDictionary!
    // 右侧索引数组
    var indexArray:NSArray!
    
    /*
    在UITableViewController中，根视图self.view就是self.tableView
    在UITableViewController中要实例化视图，可以先实例化tableView
    */
    override func loadView() {
        self.tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame, style: UITableViewStyle.Plain)
//        NSLog("%p", self.view)
//        NSLog("%p", self.tableView)
    }
    
    override func viewDidLoad() {
        // 千万不要忘记执行父类的方法，以确保视图正确被加载
        super.viewDidLoad()
        // 初始化数据
        // 1)指定数据字典文件的路径
        var path = NSBundle.mainBundle().pathForResource("cities.plist", ofType: nil)
        // 2)加载数据字典
        self.dataDict = NSDictionary(contentsOfFile: path!)
        
        self.provinceDict = self.dataDict["cities"] as NSDictionary
        // 3)填充省份数组
        var pList = self.dataDict["provinces"] as NSArray
        var provinceArray = NSMutableArray(capacity: pList.count)
        for pName in pList {
            provinceArray.addObject(Province.provinceWithName(pName as NSString))
        }
        
        self.provinceArray =  provinceArray.sortedArrayUsingComparator { (p1, p2) -> NSComparisonResult in
            var pr1:Province = p1 as Province
            var pr2:Province = p2 as Province
            return pr1.pinyin.compare(pr2.pinyin)
        }
        
        // 生成省份首字母的数组
        initIndexArray2()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return provinceArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var province = self.provinceArray[section] as Province
        var cityArray = provinceDict[province.name] as NSArray
        return cityArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        var province = self.provinceArray[indexPath.section] as Province
        var cityArray = provinceDict[province.name] as NSArray
        
        
        cell?.textLabel?.text = cityArray[indexPath.row] as NSString
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (provinceArray[section] as Province).name
    }
    
    
    // 右侧的索引数组。注意：索引的数值可以与实际数据没有关系，是单独处理的
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return self.indexArray
    }
    
    // 以下方法是索引数组的数据与表格中数据衔接的桥梁
    // 如果实际开发中，出现索引数组的内容与表格数组的内容不一一对应，可以重写此方法来解决
    // 如果返回-1，表格不做任何响应。应用于显示所有字母时，只对有索引的做出响应
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int  {
        println("title = \(title)  index = \(index)")
        // 以下代码配合initIndexArray2一起使用。依次便利省份数组的首字母拼音，如果匹配，直接返回该项的索引数值
        var index:Int = 0
        for p in self.provinceArray {
            if (p as Province).pinyin.isEqualToString(title) {
                break
            }
            index++
        }
        return index
    }
    
    func initIndexArray2() {
        /*
        第二种方法：遇到重复的字母直接跳过
        */
        var indexArray = NSMutableArray(capacity: self.provinceArray.count)
        var pre = ""
        var current:NSString
        for province in provinceArray {
            current = (province as Province).pinyin
            if !current.isEqualToString(pre) {
                indexArray.addObject(current)
                pre = current
            }
        }
        self.indexArray = indexArray
        
    }
    
    func initIndexArray1() {
        /*
        第一种方法：如果有重复的字母，把后续重复的字母换成.
        */
        var indexArray = NSMutableArray(capacity: self.provinceArray.count)
        var pre = ""
        var current:NSString
        for province in provinceArray {
            current = (province as Province).pinyin
            if current.isEqualToString(pre) {
                indexArray.addObject(".")
            } else {
                indexArray.addObject(current)
                pre = current
            }
        }
        self.indexArray = indexArray
    }

}