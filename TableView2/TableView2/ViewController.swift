//
//  ViewController.swift
//  TableView2
//
//  Created by bingoogol on 14-6-15.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var _cities:NSDictionary!
    var _provinces:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = NSBundle.mainBundle()
        let provincesPath = bundle.pathForResource("provinces", ofType: "plist")
        let citiesPath = bundle.pathForResource("cities", ofType: "plist")
        _provinces = NSArray(contentsOfFile: provincesPath)
        _cities = NSDictionary(contentsOfFile: citiesPath)
        
    }
    
    // 省份的数量
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return _provinces.count
    }

    // 每个省对应的城市的数量
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        let provinceName = _provinces[section] as String
        let cities = _cities[provinceName] as NSArray
        return cities.count
    }
    
    // 表格单元显示的内容
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let provinceName = _provinces[indexPath.section] as String
        let cities = _cities[provinceName] as NSArray
        cell.textLabel.text = cities[indexPath.row] as String
        
        return cell
    }
    
    // 设置组标题
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        return _provinces[section] as String
    }
    
    // 选择某一行
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let provinceName = _provinces[indexPath.section] as String
        let cities = _cities[provinceName] as NSArray
        let cityName = cities[indexPath.row] as String
        println("\(provinceName),\(cityName)")
    }
    
    // 右侧的索引
    func sectionIndexTitlesForTableView(tableView: UITableView!) -> AnyObject[]! {
        return _provinces
    }

}

