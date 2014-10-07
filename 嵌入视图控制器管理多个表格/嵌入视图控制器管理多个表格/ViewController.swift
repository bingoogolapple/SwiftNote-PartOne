//
//  ViewController.swift
//  嵌入视图控制器管理多个表格
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let CELL_ID = "MyCell"
    
    @IBOutlet weak var tableView1: UITableView!

    @IBOutlet weak var subView: UIView!
    var secondViewController:SecondViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondViewController = SecondViewController()
        self.subView.addSubview(secondViewController.view)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CELL_ID) as UITableViewCell!
        }
        cell.textLabel?.text = "title"
        cell.detailTextLabel?.text = "detail"
        return cell
    }
}