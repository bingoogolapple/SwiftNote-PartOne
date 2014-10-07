//
//  ViewController.swift
//  九宫格新
//
//  Created by bingoogol on 14/9/30.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/**
把素材放在bundle，可以允许在不同的bundle中中图片可以重名，实例化图片是需要指定bundle的名字

*/
let COL_COUNT = 5
let ROW_HEIGHT:CGFloat = 100

class ViewController: UIViewController,UITableViewDataSource,ProductCellDelegate {
    
    let CELL_ID = "MyCell"
    let PRODUCT_COUNT = 23
    
    
    weak var tableView:UITableView!
    var dataList:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 如果成员变量是weak的，则需要重新定义一个变量，然后赋值给成员变量
        var tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
        tableView.dataSource = self
        // 表格的代理方法要少用
        tableView.rowHeight = ROW_HEIGHT
        // 取消分割线
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        // 初始化数据
        var array = NSMutableArray(capacity: PRODUCT_COUNT)
        var product:Product
        for i in 0 ..< PRODUCT_COUNT {
            product = Product.productWithName(NSString(format: "商品-%03d", i))
            array.addObject(product)
        }
        self.dataList = array
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
        (1 - 1)/3 + 1 = 1
        (2 - 1)/3 + 1 = 1
        (3 - 1)/3 + 1 = 1
        (4 - 1)/3 + 1 = 2
        (5 - 1)/3 + 1 = 2
        (6 - 1)/3 + 1 = 2
        */
        return (self.dataList.count - 1) / COL_COUNT + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as ProductCell?

        if cell == nil {
            cell = ProductCell(style: UITableViewCellStyle.Default, reuseIdentifier: CELL_ID)
            cell?.delegate = self
        }
        var loc = indexPath.row * COL_COUNT
        var avaliableLen = dataList.count - loc
        var len = avaliableLen < COL_COUNT ? avaliableLen : COL_COUNT
        var range = NSMakeRange(loc, len)
        println("\(loc)   \(avaliableLen)   \(len)")
        var array = self.dataList.subarrayWithRange(range)
        cell?.cellRow = indexPath.row
        cell?.resetButtonWithArray(array)
        return cell!
    }
    
    func productCell(productCell: ProductCell, didSelectedAtIndex index: Int) {
        var product = dataList[index] as Product
        println("click \(product.name)")
    }
}