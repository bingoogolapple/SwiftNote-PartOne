//
//  ViewController.swift
//  CustomTableViewCellCode
//
//  Created by bingoogol on 14/8/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 460), style: UITableViewStyle.Plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        // 步骤a：为表格注册自定义单元格的类，并指定单元格的可重用标示符
        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // 1.创建一个静态表格标示字符串，定义静态变量时，变量首字母要大写
        let CellInentifier = "Cell"
        // 2.从缓存池查找是否有可重用的表格行对象
        /*
        如果使用自定义单元格，并且在viewDidLoad注册单元格的类，那么
        dequeueReusableCellWithIdentifier
        dequeueReusableCellWithIdentifier:forIndexPath(此方法的indexpath本身没有任何用处，加上这个参数的目的是提醒程序员必须在viewDidLoad方法中注册class)
        是等效的
        */
        var cell:ChatCell? = tableView.dequeueReusableCellWithIdentifier(CellInentifier) as? ChatCell
        // 3.如果没有找到可重用单元格对象，实例化新的单元格。如果有在viewDidLoad注册单元格的类，则这一步不用做，苹果已经帮我们做了
//        if cell == nil {
//            println("新建cell\(indexPath.row)")
//            cell = ChatCell(style: .Default, reuseIdentifier: CellInentifier)
//        }
        // 4.设置单元格内容
        // TODO:设置单元格内容
        cell!.msgBtn.setTitle("什么都弱爆了", forState: UIControlState.Normal)
        return cell
    }

    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 80.0
    }

}