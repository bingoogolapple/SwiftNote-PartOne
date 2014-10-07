//
//  SecondViewController.swift
//  EmptyNavigation
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol FontSizeChangeDelegate : NSObjectProtocol {
    func fontSizeDidChange(controller:SecondViewController,fontSize:Int)
}

class SecondViewController : UIViewController {
    var fontSize = 20
    var delegate:FontSizeChangeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        self.title = "第二页"
        
        let preButton = UIButton.buttonWithType(.System) as UIButton
        preButton.frame = CGRect(x:100,y:100,width:100,height:50)
        preButton.setTitle("返回上一页", forState:.Normal)
        preButton.addTarget(self,action:"prePage:",forControlEvents:.TouchUpInside)
        self.view.addSubview(preButton)
        
        let fontButton = UIButton.buttonWithType(.System) as UIButton
        fontButton.frame = CGRect(x:100,y:200,width:100,height:50)
        fontButton.setTitle("增大字体", forState:.Normal)
        fontButton.addTarget(self,action:"addFontSize",forControlEvents:.TouchUpInside)
        self.view.addSubview(fontButton)
    }
    
    func prePage(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func addFontSize() {
        fontSize++
        delegate!.fontSizeDidChange(self,fontSize:fontSize)
    }
}
