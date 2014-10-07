//
//  ViewController.swift
//  DataAndTable
//
//  Created by bingoogol on 14/9/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/*
调用查看视图控制器时，几个方法执行的顺序，以及各自负责的工作
1.prepareForSegue方法，可以获取到目标视图控制器，用成员变量保存住，以备
   单元格选中时，为目标视图控制器赋值(属性有，控件还没有加载)
2.执行表格单元的选中事件didSelectRowAtIndexPath
3.查看视图控制器控件加载完成之后，调用该控制器的viewDidLoad方法
*/

class ViewController: UITableViewController,EditPersonViewControllerDelegate,ViewPersonViewControllerDelegate,UISearchDisplayDelegate {
    
    var viewPersonViewController:ViewPersonViewController?
    
    let ID = "PersonCell"
    let documentPath: NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString
    var personList:NSMutableArray!
    var resultList:NSMutableArray!
    var dataPath:NSString!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.初始化用户数据列表
        // 1.1从沙河中读取已经保存的用户信息
        dataPath = "\(documentPath)/dict.plist"
        // 注意：personList数组中保存的是自定义对象，因此在实例化时，不能使用
        // 数组的实例化方法，而要使用NSKeyedUnarchiver方法
        personList = NSKeyedUnarchiver.unarchiveObjectWithFile(dataPath) as? NSMutableArray
        // 2.如果是第一次运行，或者用户没有新建任何记录
        // 如果出现这种情况，在保存数据时，不要忘记初始化数组
        println(personList)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var identifier:NSString = segue.identifier!
        if identifier.isEqualToString("newPersonInfo") {
            var controller:EditPersonViewController = segue.destinationViewController as EditPersonViewController
            controller.editDelegate = self
        } else {
            println("ViewController-prepareForSegue")
            // 注意：在prepareForSegue时，目标视图控制器中的控件还没有被加载完成
            // 因此，不能在此方法中给目标视图控制器的界面元素赋值
            viewPersonViewController = segue.destinationViewController as? ViewPersonViewController
            viewPersonViewController?.viewDelegate = self
        }
        
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        //1.定义一个谓词
        var predicate:NSPredicate = NSPredicate(format: "username CONTAINS[c] '\(searchString)'")!
        //2.清空搜索结果数据
        if (resultList != nil) {
            resultList.removeAllObjects()
        }
        //3.使用谓词匹配个人信息列表
        // 在非ARC开发中，一般用类方法，实例化的对象都是autorelease的
        resultList = NSMutableArray(array: personList.filteredArrayUsingPredicate(predicate))
        // 返回true，可以通知表格刷新数据
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 如果点击时间来源于搜索的表格，直接返回
        if(self.searchDisplayController?.searchResultsTableView == tableView) {
            return
        }
        println("ViewController-didSelectRowAtIndexPath")
        var person:Person = personList.objectAtIndex(indexPath.row) as Person
        viewPersonViewController?.personData = person
        
        // 使用表格的tag记录用户选中的行
        self.tableView.tag = indexPath.row
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.searchDisplayController?.searchResultsTableView == tableView) {
            return resultList == nil ? 0 : resultList.count
        } else {
            return personList == nil ? 0 : personList.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(ID) as? UITableViewCell
        // 因为没有为搜索栏表格注册可重用单元格，因此要判断单元格是否存在
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: ID)
        }
        
        var person:Person!
        if(self.searchDisplayController?.searchResultsTableView == tableView) {
            person = resultList.objectAtIndex(indexPath.row) as Person
        } else {
            person = personList.objectAtIndex(indexPath.row) as Person
            
        }
        cell?.textLabel?.text = person.username
        cell?.detailTextLabel?.text = person.phoneNo
        cell?.imageView?.image = person.iconImage
        return cell!
    }
    
    func editPersonShouldSavePersonData(controller: EditPersonViewController) {
        // 如果是第一次运行，personList并不会在viewDidLoad中被实例化
        // 可以在此用懒加载的方式
        if personList == nil {
            personList = NSMutableArray()
        }
        // 来自新建视图控制器的用户信息
        personList.addObject(controller.person!)
        //保存归档数据
        NSKeyedArchiver.archiveRootObject(personList, toFile: dataPath)
        
        // 刷新表格显示数据
        tableView.reloadData()
    }

    func viewPersonShouldSavePersonData(controller: ViewPersonViewController) {
        // 从查看视图控制器中得到对应的personData，并且更新对应的行
        // 在进入查看视图控制器时，需要记录住当前用户选中的行
        // 以便此代理方法被调用时，能够更新对应的用户数据
        personList.replaceObjectAtIndex(self.tableView.tag, withObject: controller.personData!)
        //保存归档数据
        NSKeyedArchiver.archiveRootObject(personList, toFile: dataPath)
        
        // 刷新表格显示数据
        tableView.reloadData()
    }
    
}