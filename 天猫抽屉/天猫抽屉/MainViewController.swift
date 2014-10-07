//
//  ViewController.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let SHOP_TYPE_CELL_ID = "SHOP_TYPE_CELL_ID"
    weak var folderView:FolderView!
    
    var dataList:NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var folderView = FolderView(frame: UIScreen.mainScreen().applicationFrame, style: UITableViewStyle.Plain)!
        folderView.delegate = self
        folderView.dataSource = self
        folderView.registerClass(ShopTypeCell.self, forCellReuseIdentifier: SHOP_TYPE_CELL_ID)
        self.view.addSubview(folderView)
        self.folderView = folderView
        var path = NSBundle.mainBundle().pathForResource("shops", ofType: "plist")!
        var array = NSArray(contentsOfFile: path)!
        var dataListM = NSMutableArray(capacity: array.count)
        for dict in array {
            dataListM.addObject(ShopType.shopTypeWithDict(dict as NSDictionary))
        }
        dataList = dataListM
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(SHOP_TYPE_CELL_ID) as ShopTypeCell!
        var shopType = dataList[indexPath.row] as ShopType
        cell.textLabel?.text = shopType.name
        cell.imageView?.image = shopType.image
        cell.detailTextLabel?.text = shopType.detail
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var shopType = dataList[indexPath.row] as ShopType
        folderView.openFolderAtIndexPath(indexPath, shopList: shopType.subShops)
    }
    
}