//
//  ViewController.swift
//  表格拆分
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/**
1.在UITableViewController中，如果要实例化视图，直接实例化self.tableView即可
2.乳沟要使用默认的平板表格UITableViewStylePlain，可以不用重写loadView方法
*/
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let CELL_ID = "MyCell"
    let EMBEDVIEW_HEIGHT:CGFloat = 200
    let ROW_HEIGHT:CGFloat = 92
    
    var tableView:UITableView!
    var embedView:UIView!
    // 动画的表格行
    var animationRows:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: UIScreen.mainScreen().applicationFrame, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = ROW_HEIGHT
        tableView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(tableView)
        
        embedView = UIView(frame: CGRectMake(0, 0, tableView.bounds.width, EMBEDVIEW_HEIGHT))
        embedView.backgroundColor = UIColor.orangeColor()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as MyCell!
        if cell == nil {
            cell = MyCell(style: UITableViewCellStyle.Default, reuseIdentifier: CELL_ID)
            cell.contentView.backgroundColor = UIColor.whiteColor()
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        }
        cell.textLabel?.text = "cell-\(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 选中某一个表格行后，将下方的表格行向下方移动SUBVIEW_HEIGHT的高度
        
        // 未打开，做打开操作
        if animationRows == nil {
            // 新建一个数组，把所有可能有动画的表格行的indexPath全部记录下来，一遍之后还原
            animationRows = NSMutableArray(array: tableView.indexPathsForVisibleRows()!)
            // 表格的偏移。注意：表格是继承自UIScrollView，有偏移量
            var bottomY = tableView.contentOffset.y + tableView.frame.height
            // 计算准备插入子视图的y值
            var selectedCell = tableView.cellForRowAtIndexPath(indexPath)!
            var subViewY = selectedCell.frame.origin.y + ROW_HEIGHT
            // 准备加入子视图的最大y值
            var maxSubViewY = bottomY - EMBEDVIEW_HEIGHT
            // 判断空间是否够大
            if maxSubViewY  >= subViewY {
                embedView.frame.origin.y = subViewY
                // 空间够大。只要挪动选中行下方的表格行即可
                UIView.animateWithDuration(0.5, animations: {
                    for path in self.animationRows {
                        var cell:MyCell = tableView.cellForRowAtIndexPath(path as NSIndexPath) as MyCell!
                        var frame = cell.frame
                        // 记录初始y位置
                        cell.originY = frame.origin.y
                        
                        if path.row > indexPath.row {
                            frame.origin.y += self.EMBEDVIEW_HEIGHT
                            cell.frame = frame
                        }
                    }
                })
            } else {
                embedView.frame.origin.y = maxSubViewY
                // 空间不够。上面的要挪，下边也要挪
                UIView.animateWithDuration(0.5, animations: {
                    var delta = subViewY - maxSubViewY
                    for path in self.animationRows {
                        var cell:MyCell = tableView.cellForRowAtIndexPath(path as NSIndexPath) as MyCell!
                        var frame = cell.frame
                        // 记录初始y位置
                        cell.originY = frame.origin.y
                        
                        if path.row > indexPath.row {
                            frame.origin.y += (self.EMBEDVIEW_HEIGHT - delta)
                        } else {
                            frame.origin.y -= delta
                        }
                        cell.frame = frame
                    }
                })
            }
            tableView.insertSubview(embedView, atIndex: 0)
        } else {
            // 已打开，做复位操作
            UIView.animateWithDuration(0.5, animations: {
                for path in self.animationRows {
                    var cell:MyCell = tableView.cellForRowAtIndexPath(path as NSIndexPath) as MyCell!
                    var frame = cell.frame
                    
                    frame.origin.y = cell.originY
                    cell.frame = frame
                }
                }, completion: { (finished:Bool) in
                    self.embedView.removeFromSuperview()
                    self.animationRows = nil
                }
            )
        }
        
        
    }
    
}