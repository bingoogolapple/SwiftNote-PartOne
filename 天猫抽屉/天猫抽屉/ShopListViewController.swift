//
//  ShopListViewController.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ShopListViewController: UITableViewController {
    var shopList:NSArray!
    let CELL_ID = "SHOP_CELL_ID"
    
    override func loadView() {
        self.tableView = UITableView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200), style: UITableViewStyle.Plain)
        // 注意：视图是懒加载的，在用到时才会被实例化
        println("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CELL_ID)
        }
        var shop = shopList[indexPath.row] as Shop
        cell.textLabel?.text = shop.name
        cell.imageView?.image = shop.image
        return cell
    }

}