//
//  ViewController.swift
//  QQ好友列表
//
//  Created by bingoogol on 14/8/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
需求：QQ好友列表
1.准备数据和素材
2.创建界面
    1）初始化数据
    2）填充表格(有分组)
*/
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var friendGroups:NSArray!
    var tableView:UITableView!
    // 表格展开情况记录字典。如果是展开，记录true；如果是折叠，记录false
    var sectionInfo:NSMutableDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化数据
        let friendsPlistPath:NSString = NSBundle.mainBundle().pathForResource("friends", ofType: "plist")!
        friendGroups = NSArray(contentsOfFile: friendsPlistPath)
        
        // 初始化折叠情况记录字典，默认全部折叠
        sectionInfo = NSMutableDictionary(capacity: friendGroups.count)
        for index in 0 ... friendGroups.count - 1 {
            let friendGroup:NSDictionary = friendGroups[index] as NSDictionary
            sectionInfo.setValue(false, forKey: friendGroup["group"] as NSString)
        }
        
        // 实例化表格
        var frame = CGRect(x: 0, y: 22, width: self.view.bounds.size.width, height: self.view.bounds.size.height - 22)
        tableView = UITableView(frame:frame ,style:UITableViewStyle.Plain)
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    // 分组的数量(好友分组的数量)
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println("分组数量\(friendGroups.count)")
        return friendGroups.count
    }

    
    // 每一组对应的数据数量（每一组中的好友数量）
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("刷新表格行数")
        // 根据indexPath中的section属性，取出对应的friends数组，并且返回该数组的长度
        // 该数组中就是section分组对应的好友列表
        let friendGroup:NSDictionary = friendGroups[section] as NSDictionary
        
        // 如果是展开，记录true；如果是折叠，记录false
        if  sectionInfo[friendGroup["group"] as NSString] as Bool  {
            let friends:NSArray = friendGroup["friends"] as NSArray
            return friends.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CELL_ID = "CELLID"
        // 不能用!，必须用两个?
        // var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(ID) as UITableViewCell
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as? UITableViewCell
        // 此时既没有storyboard,也没有自定义单元格，所以需要自己手动优化重用单元格
        if cell == nil {
            println("新建单元格")
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: CELL_ID)
        }
        // 设置单元格属性
        let friendGroup:NSDictionary = friendGroups[indexPath.section] as NSDictionary
        let friends:NSArray = friendGroup["friends"] as NSArray
        // 1.好友姓名
        cell?.textLabel?.text = friends[indexPath.row] as NSString
        // 2.好友头像
        let imageFilename = "head\(arc4random_uniform(8) + 1).png"
        cell?.imageView?.image = UIImage(named: imageFilename)
        // 3.好友信息
        cell?.detailTextLabel?.text = "小苹果"
        return cell!
    }
    
    // 两种返回的方式：1）字符串，2）自定义UIView
    func tableView(tableView: UITableView!, viewForHeaderInSection section: Int) -> UIView! {
        let friendGroup:NSDictionary = friendGroups[section] as NSDictionary
        let groupName:NSString = friendGroup["group"] as NSString
        let HEADER_ID = "HEADERID"
        // 分组头也需要做优化
        
        var headerView:UITableViewHeaderFooterView? = tableView.dequeueReusableHeaderFooterViewWithIdentifier(HEADER_ID) as? UITableViewHeaderFooterView
        if headerView == nil {
            println("new headerView")
            headerView = UITableViewHeaderFooterView(reuseIdentifier: HEADER_ID)
            headerView!.contentView.backgroundColor = UIColor.orangeColor()
            
            let image:UIImage = UIImage(named: "disclosure.png")!
            let imageIv:UIImageView = UIImageView(image: image)
            imageIv.frame = CGRect(x: 10, y: 9, width: 32, height: 32)
            headerView!.contentView.addSubview(imageIv)

            let button:UIButton = UIButton.buttonWithType(UIButtonType.Custom)
                as UIButton
            button.frame = CGRect(x: 0, y: 0, width: 320, height: 50)
            // button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            
            button.addTarget(self, action: Selector("clickHeader:"), forControlEvents: UIControlEvents.TouchUpInside)
            headerView!.contentView.addSubview(button)

        }
        let imageIv:UIImageView = headerView!.contentView.subviews[0] as UIImageView
        let isShow:Bool = sectionInfo[groupName] as Bool
        UIView.animateWithDuration(0.5, animations: {
            if isShow {
                imageIv.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
            } else {
                imageIv.transform = CGAffineTransformMakeRotation(0)
            }
        
        })
        
        let button:UIButton = headerView!.contentView.subviews[1] as UIButton
        // 用button的tag属性记录section数值
        button.tag = section
        button.setTitle(groupName, forState: UIControlState.Normal)
        return headerView
    }
    
    //    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
    //        let friendGroup:NSDictionary = friendGroups[section] as NSDictionary
    //        return friendGroup["group"] as NSString
    //    }
    
    func tableView(tableView: UITableView!, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func clickHeader(button:UIButton) {
        // 1.知道点击的section,根据sectionInfo中的数值求反
        // 2.收起列表->通过设置行数=0
        // 3.要重新设置行数->刷新表格
        // 在刷新表格之前需要记录表格当前是展开的还是折叠的
        // 使用一个成员变量的“字典”，来记录表格的展开折叠情况。因为我们的分组是多个的，应用程序应该允许用户同时展开或折叠多个表格项
        let friendGroup:NSDictionary = friendGroups[button.tag] as NSDictionary
        let groupName:NSString = friendGroup["group"] as NSString
        let isShow:Bool = sectionInfo[groupName] as Bool
        sectionInfo.setValue(!isShow, forKey: groupName)
        
        // 局部刷新，刷新指定section中的所有行
//        let friends:NSArray = friendGroup["friends"] as NSArray
//        var indexPaths:NSMutableArray = NSMutableArray(capacity: friends.count)
//        for index in 0 ... friends.count - 1 {
//            let indexPath = NSIndexPath(forRow: index, inSection: button.tag)
//            indexPaths.addObject(indexPath)
//        }
//        
//        tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Fade)
        
        // 刷新所有数据
         tableView.reloadData()
    }
    
}