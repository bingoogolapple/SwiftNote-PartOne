//
//  ViewController.swift
//  QQ聊天布局
//
//  Created by bingoogol on 14/9/27.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataList:NSArray!
    let CELL_ID = "MyCell"
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame)
        // 取消分割线
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.delegate = self
        tableView.dataSource = self
        // 注册可重用单元格
        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: CELL_ID)
        self.view.addSubview(tableView)
        
        // 初始化数据
        var path = NSBundle.mainBundle().pathForResource("messages", ofType: "plist")
        var array:NSArray = NSArray(contentsOfFile: path!)!
        var dataList = NSMutableArray(capacity: array.count)
        var msg:Message
        for dict in array {
            msg = Message.messageWithContent(dict["content"] as NSString, fromSelf: dict["fromSelf"] as Bool)
            dataList.addObject(msg)
        }
        self.dataList = dataList
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as ChatCell
        cell.setMessage(dataList[indexPath.row] as Message)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // 千万注意，在这里不能调用cell，否则会死循环
        // 需要根据文本实际内容从新计算表格行的高度
        var message = dataList[indexPath.row] as Message
        var size = ChatCell.getStringSize(message.content, fontSize: FONT_SIZE, width: BTN_CONTENT_WIDTH)
        var height = size.height + 2 * EDGE_SMALL + 2 * MARGIN
        var normalHeight = ICON_SIZE + 2 * EDGE_SMALL
        return height > normalHeight ? height : normalHeight
    }

}