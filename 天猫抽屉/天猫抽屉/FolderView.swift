//
//  FolderView.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class FolderView: UITableView {
    let ROW_HEIGHT:CGFloat = 80
    let EMBEDVIEW_HEIGHT:CGFloat = 200
    // 动画的表格行
    var animationRows:NSMutableArray!
    var shopListViewController:ShopListViewController!
        
    override init?(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        // 设置背景图片
        var image = UIImage(named: "tmall_bg_furley.png")!
        self.backgroundColor = UIColor(patternImage: image)
        self.rowHeight = ROW_HEIGHT
        self.showsVerticalScrollIndicator = false
        shopListViewController = ShopListViewController()
        shopListViewController.view.frame.size.height = EMBEDVIEW_HEIGHT
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        println("init coder")
    }
    
//    func openFolderAtIndexPath(indexPath:NSIndexPath, shopList:NSArray) {
//        if animationRows == nil {
//            shopListViewController.shopList = shopList
//            shopListViewController.tableView.reloadData()
//            // 新建一个数组，把所有可能有动画的表格行的indexPath全部记录下来，一遍之后还原
//            animationRows = NSMutableArray(array: self.indexPathsForVisibleRows()!)
//            // 表格的偏移。注意：表格是继承自UIScrollView，有偏移量
//            var bottomY = self.contentOffset.y + self.frame.height
//            // 计算准备插入子视图的y值
//            var selectedCell = self.cellForRowAtIndexPath(indexPath)!
//            var subViewY = selectedCell.frame.origin.y + ROW_HEIGHT
//            // 准备加入子视图的最大y值
//            var maxSubViewY = bottomY - EMBEDVIEW_HEIGHT
//            // 判断空间是否够大
//            if maxSubViewY  >= subViewY {
//                shopListViewController.tableView.frame.origin.y = subViewY
//                // 空间够大。只要挪动选中行下方的表格行即可
//                UIView.animateWithDuration(0.5, animations: {
//                    for path in self.animationRows {
//                        var cell:ShopTypeCell = self.cellForRowAtIndexPath(path as NSIndexPath) as ShopTypeCell!
//                        cell.saveOriginY()
//                        var newFrame = cell.frame
//                        
//                        if path.row > indexPath.row {
//                            newFrame.origin.y += self.shopListViewController.tableView.frame.height
//                        }
//                        
//                        cell.frame = newFrame
//                    }
//                })
//            } else {
//                shopListViewController.tableView.frame.origin.y = maxSubViewY
//                var up =  maxSubViewY - subViewY
//                var down = self.shopListViewController.tableView.frame.height + up
//                // 空间不够。上面的要挪，下边也要挪
//                UIView.animateWithDuration(0.5, animations: {
//                    
//                    for path in self.animationRows {
//                        var cell:ShopTypeCell = self.cellForRowAtIndexPath(path as NSIndexPath) as ShopTypeCell!
//                        cell.saveOriginY()
//                        var newFrame = cell.frame
//                        
//                        if path.row > indexPath.row {
//                            newFrame.origin.y += down
//                        } else {
//                            newFrame.origin.y += up
//                        }
//                        
//                        cell.frame = newFrame
//                    }
//                })
//            }
//            self.insertSubview(shopListViewController.tableView, atIndex: 0)
//        } else {
//            self.closeFolder()
//        }
//    }
    
    func openFolderAtIndexPath(indexPath:NSIndexPath, shopList:NSArray) {
        self.scrollEnabled = false
        if animationRows == nil {
            shopListViewController.shopList = shopList
            shopListViewController.tableView.reloadData()
            // 新建一个数组，把所有可能有动画的表格行的indexPath全部记录下来，一遍之后还原
            animationRows = NSMutableArray(array: self.indexPathsForVisibleRows()!)
            // 表格的偏移。注意：表格是继承自UIScrollView，有偏移量
            var bottomY = self.contentOffset.y + self.frame.height
            // 计算准备插入子视图的y值
            var selectedCell = self.cellForRowAtIndexPath(indexPath)!
            var subViewY = selectedCell.frame.origin.y + ROW_HEIGHT
            // 准备加入子视图的最大y值
            var maxSubViewY = bottomY - EMBEDVIEW_HEIGHT
            // 判断空间是否够大
            if maxSubViewY  >= subViewY {
                shopListViewController.tableView.frame.origin.y = subViewY
                self.openFolderFromIndexPath(indexPath, up: 0, down: self.shopListViewController.tableView.frame.height, newFrame: { (up, down, path, cell) -> CGRect in
                    var newFrame:CGRect = cell.frame
                    if path.row > indexPath.row {
                        newFrame.origin.y += down
                    }
                    return newFrame
                })
            } else {
                shopListViewController.tableView.frame.origin.y = maxSubViewY
                // 空间不够。上面的要挪，下边也要挪
                var up =  maxSubViewY - subViewY
                var down = self.shopListViewController.tableView.frame.height + up
                self.openFolderFromIndexPath(indexPath, up: up, down: down, newFrame: { (up, down, path, cell) -> CGRect in
                    var newFrame = cell.frame
                    if path.row > indexPath.row {
                        newFrame.origin.y += down
                    } else {
                        newFrame.origin.y += up
                    }
                    return newFrame
                })
            }
            self.insertSubview(shopListViewController.tableView, atIndex: 0)
        } else {
            self.closeFolder()
        }
    }
    
    func openFolderFromIndexPath(indexPath:NSIndexPath,up:CGFloat,down:CGFloat,newFrame:(up:CGFloat,down:CGFloat,path:NSIndexPath,cell:ShopTypeCell) -> CGRect) {
        // 空间够大。只要挪动选中行下方的表格行即可
        UIView.animateWithDuration(0.3, animations: {
            for path in self.animationRows {
                var cell:ShopTypeCell = self.cellForRowAtIndexPath(path as NSIndexPath) as ShopTypeCell!
                cell.saveOriginY()
                cell.frame = newFrame(up: up, down: down, path: path as NSIndexPath,cell:cell)
            }
        })
    }
    
    func closeFolder() {
        UIView.animateWithDuration(0.3, animations: {
                for path in self.animationRows {
                    var cell:ShopTypeCell = self.cellForRowAtIndexPath(path as NSIndexPath) as ShopTypeCell!
                    cell.restoreOriginY()
                }
            }, completion: { (finished:Bool) in
                self.shopListViewController.tableView.removeFromSuperview()
                self.animationRows = nil
                self.scrollEnabled = true
            }
        )
    }

}