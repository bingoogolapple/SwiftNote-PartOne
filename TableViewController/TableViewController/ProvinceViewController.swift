//
//  MainTableViewController.swift
//  TableViewController
//
//  Created by bingoogol on 14-6-21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ProvinceViewController:UITableViewController {
    var provinces:NSArray!
    var cities:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = NSBundle.mainBundle()
        provinces = NSArray(contentsOfFile:bundle.pathForResource("provinces", ofType:"plist")!)
        cities = NSDictionary(contentsOfFile:bundle.pathForResource("cities",ofType:"plist")!)
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return provinces.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cellIdentifier = "myProvince"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier:cellIdentifier)
        }
        cell?.textLabel.text = provinces[indexPath.row] as String
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let cityController = segue.destinationViewController as CityViewController
        let index = self.tableView.indexPathForSelectedRow().row
        let provinceName = provinces[index] as String
        cityController.cities = cities[provinceName] as NSArray
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
}