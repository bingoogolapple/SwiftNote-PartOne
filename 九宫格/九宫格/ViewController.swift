//
//  ViewController.swift
//  九宫格
//
//  Created by bingoogol on 14/8/31.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/*
目标：建立九宫格应用
每排显示3个图标和名称

创建按钮需要解决几个问题
1.行数需要变化
2.假设总共显示50个按钮
*/
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView:UITableView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(NSHomeDirectory())
        
        //        var image:UIImage = UIImage(named: "images.bundle/tmall_icon_cat_outing_1.png")
        //        self.view.addSubview(UIImageView(image: image))
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return (BUTTONCOUNT - 1) / BUTTONCOUNT_ROW + 1
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let ID = "CELL"
        var cell:TaobaoTVC? = tableView.dequeueReusableCellWithIdentifier(ID) as? TaobaoTVC
        if(cell == nil) {
            cell = TaobaoTVC(style: UITableViewCellStyle.Default, reuseIdentifier: ID)
        }
        
        for index in 0 ..< BUTTONCOUNT_ROW {
            // 如果单元行是从缓存池中提取的，那么如果接近末尾时，最后的按钮会被显示出来。针对这一情况，需要把超出的按钮隐藏起来
            //var button:UIButton = cell?.contentView.subviews[index] as UIButton
            var button:UIButton = cell?.contentView.viewWithTag(index + START_TAG) as UIButton
            if(BUTTONCOUNT_ROW * indexPath.row + index < BUTTONCOUNT) {
                button.hidden = false
                var image = UIImage(named: "images.bundle/tmall_icon_cat_outing_\(arc4random_uniform(12) + 1).png")
                button.setImage(image, forState: UIControlState.Normal)
            } else {
                button.hidden = true
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 100
    }
}

