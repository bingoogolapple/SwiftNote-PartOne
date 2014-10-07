//
//  ViewController.swift
//  CustomTableViewCellStoryboard
//
//  Created by bingoogol on 14/8/20.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    var dataList:NSMutableArray!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        dataList = NSMutableArray(capacity: 30)
        for index in 0 ... 30 {
            var book = Book()
            book.bookName = NSString.localizedStringWithFormat("IOS开发系列（%d）",index)
            book.price = 59.98
            dataList.addObject(book)
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // 1.创建一个静态表格标示字符串，定义静态变量时，变量首字母要大写
        let CellInentifier = "bookCell"
        // 2.从缓存池查找是否有可重用的表格行对象 //其实加上forIndexPath的方法内部已经实现了第3步
        /*
        如果使用storyboard，并且在storyboard中指定了单元格的可重用标示符，那么
        dequeueReusableCellWithIdentifier
        dequeueReusableCellWithIdentifier:forIndexPath(此方法的indexpath本身没有任何用处，加上这个参数的目的是提醒程序员必须在storyboard中指定单元格的可重用标示符，一旦注册，两个查找可重用单元格的方法等效)
        是等效的
        */
        // var bookCell:BookCell! = tableView.dequeueReusableCellWithIdentifier(CellInentifier,forIndexPath:indexPath) as BookCell
        
        var bookCell:BookCell! = tableView.dequeueReusableCellWithIdentifier(CellInentifier) as BookCell
        // 注意：在ios6及以上版本系统才接管重用单元格优化
        // 3.如果没有找到可重用单元格对象，实例化新的单元格
        // if bookCell == nil {
        //            println("新创建单元格")
        //            bookCell = BookCell(style: .Default, reuseIdentifier: CellInentifier)
        //        }
        // 4.设置单元格内容
        // TODO:设置单元格内容
        var book:Book! = dataList.objectAtIndex(indexPath.row) as Book
        bookCell.bookNameLabel.text = book.bookName
        bookCell.bookPriceLabel.text = NSString.localizedStringWithFormat("%.2f",book.price)
        return bookCell
    }


}