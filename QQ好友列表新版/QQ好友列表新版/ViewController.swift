//
//  ViewController.swift
//  QQ好友列表新版
//
//  Created by bingoogol on 14/9/28.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

// 标题行比较少，并且需要处理展开折叠，则我们自己缓存标题行
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,MyHeaderDelegate {
    let CELL_ID = "MyCell"
    let ROW_HEIGHT:CGFloat = 50
    let HEADER_HEIGHT:CGFloat = 44
    var dataList:NSArray!
    var sectionDict:NSMutableDictionary!
    
    weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
        tableView.dataSource = self
        tableView.delegate = self
        // 通常在开发中标题行高和表格行高都是固定的（除了新浪微博这种的），所以最好不要用代理方法来设置标题和表格行高(写了代理方法后每次执行都会调用代理方法)
        tableView.sectionHeaderHeight = HEADER_HEIGHT
        tableView.rowHeight = ROW_HEIGHT
        view.addSubview(tableView)
        self.tableView = tableView
        // 初始化数据
        var path = NSBundle.mainBundle().pathForResource("friends", ofType: "plist")
        dataList = NSArray(contentsOfFile: path!)
        sectionDict = NSMutableDictionary(capacity: dataList.count)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var isOpen = sectionStatuss["\(section)"] as Bool
        var header = sectionDict["\(section)"] as MyHeader?
        
        if header == nil || !header!.isOpen {
            return 0
        } else {
            return getFriendsWithSection(section).count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as UITableViewCell?
        // 由于没有用storyboard、xib或者注册自定义单元格，所以要自己判断可重用单元格
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CELL_ID)
        }
        var array = getFriendsWithSection(indexPath.section)
        cell?.textLabel?.text = array[indexPath.row] as NSString
        return cell!
    }
    
    func getFriendsWithSection(section:Int) -> NSArray {
        var dict = dataList[section] as NSDictionary
        return dict["friends"] as NSArray
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = sectionDict["\(section)"] as MyHeader?
        if header == nil {
            header = MyHeader(frame: CGRectMake(0, 0, self.view.bounds.width, HEADER_HEIGHT))
            sectionDict.setObject(header!, forKey: "\(section)")
        }
        
        var dict = dataList[section] as NSDictionary
        header?.setTitleContent(dict["group"] as NSString)
        header?.delegate = self
        header?.section = section
        return header
    }
    
    func myHeaderDidSelectedHeader(header: MyHeader,section:Int) {
        var header = sectionDict["\(section)"] as MyHeader?
        var isOpen = !header!.isOpen
        header?.toggle(isOpen)
        
        // 刷新全部数据，在tableview的开发中，如果可能，应该尽量避免去刷新全部数据
        // tableView.reloadData()
        
        // 本应用中可以刷新指定分组
        // 注意：一旦刷新报个数据，表格的标题行会重新被实例化
        self.tableView.reloadSections(NSIndexSet(index: section), withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
}