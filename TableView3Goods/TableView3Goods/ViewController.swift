//
//  ViewController.swift
//  TableView3Goods
//
//  Created by bingoogol on 14-6-15.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate {
    
    @IBOutlet var tableView : UITableView
    var productList:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productList = NSMutableArray(capacity:50)
        for index in 0 .. 50 {
            let product = Product()
            product.productName = NSString.localizedStringWithFormat("商品名称%03d",index)
            product.desc = "居家旅行必备之品"
            product.imageName = NSString.localizedStringWithFormat("%03d",arc4random_uniform(9) + 1)
            productList[index] = product
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let _identifier = "myCell"
        let product = productList[indexPath.row] as Product
        
        var cell = tableView.dequeueReusableCellWithIdentifier(_identifier) as UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: _identifier)
        }
        
        // 1.设置商品名称
        cell.textLabel.text = product.productName
        // 2.设置商品图像
        cell.imageView.image = UIImage(named:product.imageName)
        // 3.设置商品的描述信息
        //cell.detailTextLabel.text = product.desc
        // 4.设置右侧的箭头
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let product = productList[indexPath.row] as Product
        println("\(product.productName)")
        let alertView = UIAlertView()
        alertView.title = "商品信息"
        alertView.message = nil
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("确定")
        alertView.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alertView.textFieldAtIndex(0).text = product.productName
        alertView.textFieldAtIndex(0).placeholder = "请输入商品名称"
        alertView.delegate = self
        alertView.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        println("buttonIndex:\(buttonIndex)")
        if(buttonIndex == 1) {
            // 更新模型数据
            
            var product = productList[tableView.indexPathForSelectedRow().row] as Product
            product.productName = alertView.textFieldAtIndex(0).text
            // 更新表格数据
            //tableView.reloadData()
            let indexPaths = tableView.indexPathsForSelectedRows()
            tableView.reloadRowsAtIndexPaths(indexPaths , withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }

}

