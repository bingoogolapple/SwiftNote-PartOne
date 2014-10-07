//
//  ViewController.swift
//  TableViewEdit
//
//  Created by bingoogol on 14/8/19.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataList:NSMutableArray!
    var editingStyle:UITableViewCellEditingStyle! = UITableViewCellEditingStyle.None

    @IBOutlet var tableView : UITableView
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        dataList = NSMutableArray(capacity: 30)
        for index in 0 ... 30 {
            var string = NSString.localizedStringWithFormat("数据-%03d",index)
            dataList.addObject(string)
        }
        
     }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // 1.创建一个静态表格标示字符串，定义静态变量时，变量首字母要大写
        let CellInentifier = "Cell"
        // 2.从缓存池查找是否有可重用的表格行对象
        var cell = tableView.dequeueReusableCellWithIdentifier(CellInentifier) as? UITableViewCell
        // 3.如果没有找到可重用单元格对象，实例化新的单元格
        if !cell {
            cell = UITableViewCell(style: .Value1, reuseIdentifier: CellInentifier)
        }
        var data = dataList.objectAtIndex(indexPath.row) as? String
        cell!.textLabel.text = data
        cell!.detailTextLabel.text = "详细信息"
        
        return cell
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        // 判断表格是否需要删除数据
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // 1.删除dataList中的数据
            dataList.removeObjectAtIndex(indexPath.row)
            // 2.更新表格显示
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        } else {
            // 1.删除dataList中的数据
            dataList.insertObject("新增数据",atIndex:(indexPath.row + 1))
            // 2.更新表格显示
            var newIndexPath:NSIndexPath = NSIndexPath(forRow:indexPath.row + 1,inSection:indexPath.section)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: UITableViewRowAnimation.Top)

        }
        println("4")
    }
    
    // 返回表格的编辑样式：删除或者新增，如果不override该方法，则默认返回删除样式
    func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle {
        println("2")
        return editingStyle
    }
    
    
    func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
        var data = dataList.objectAtIndex(sourceIndexPath.row) as String
        dataList.removeObject(data)
        dataList.insertObject(data,atIndex:destinationIndexPath.row)
    }

   
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("点击了\(indexPath.row)")
    }
    
    
    @IBAction func remove(sender : UIBarButtonItem) {
        // setEditing --> editingStyleForRowAtIndexPath --> commitEditingStyle
        
        editingStyle = UITableViewCellEditingStyle.Delete
        tableView.setEditing(!tableView.editing,animated: true)
        
    }
    
    @IBAction func add(sender : UIBarButtonItem) {
        editingStyle = UITableViewCellEditingStyle.Insert
        println("1")
        tableView.setEditing(!tableView.editing,animated: true)
        println("3")
    }

}

