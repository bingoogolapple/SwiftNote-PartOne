//
//  ViewController.swift
//  分组表格
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
UITableViewDataSource协议负责给表格提供数据
UITableViewDelegate协议负责处理表格事件
*/
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    ///////////////////////////数据源方法/////////////////////////////
    // 分组数量（如果没有分组，可以不用事先此方法）
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    // 每一组的行数，如果不分组，就是当前表格显示所有数据的行数。此方法必须要实现
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 10 : 15
    }
    
    // 表格内容。这个方法必须要实现
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 1.实例化表格单元格
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        // 2.设置数据
        var str = "第\(indexPath.section)组，第\(indexPath.row)行"
        cell?.textLabel?.text = str
        // 3.返回单元格
        return cell!
    }
    
    // 标题内容
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        println("标题行字符串")
        return "第\(section)组"
    }
    
    // 自定义标题视图。
    /*
    在表格中，默认情况下，标题是不能接受用户点击的。
    目前而言，如果让标题能够接受用户的点击，需要自己添加一个按钮。如果要监听标题或页脚中的电机时间，注意给按钮添加tag属性加以区分
    注意：如果同时重写了标题的字符串方法和自定义视图方法，则自定义视图方法优先级高，字符串方法将不执行
    */
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        println("标题行自定义视图")
        // 1.实例化标题视图。标题的自定义视图宽度最好不要写死
        var view = UIView(frame: CGRectMake(0, 0, tableView.bounds.width, 44))
        // 2.在标题视图中添加一个按钮
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.setTitle("第\(section)组", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        button.frame = view.bounds
        // 添加标题按钮的监听方法
        button.tag = section
        button.addTarget(self, action: Selector("clickHeader:"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        return view
    }
    
    func clickHeader(button:UIButton) {
        println("点击了第\(button.tag)组")
    }
    
    // 页脚描述信息
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        println("页脚字符串")
        return "第\(section)组明细"
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        println("页脚自定义视图")
        // 1.实例化标题视图。标题的自定义视图宽度最好不要写死
        var view = UIView(frame: CGRectMake(0, 0, tableView.bounds.width, 44))
        // 2.在标题视图中添加一个按钮
        var button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        // 设置button内容的位置
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.setTitle("第\(section)组明细", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        button.frame = view.bounds
        // 设置按钮标签的背景颜色
        button.titleLabel?.backgroundColor = UIColor.yellowColor()
        // 设置按钮标签的位置，通过设置边距可以调整按钮的位置
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20)
        view.addSubview(button)
        return view
    }
    
    
    //////////////////////////表格代理方法/////////////////////////////
    // 标题的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // 页脚的高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
    
}