//
//  RootViewController.swift
//  EmptyNavigation
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class RootViewController : UIViewController,FontSizeChangeDelegate {
    var myLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        let nextButton = UIBarButtonItem(title:"下一页", style: .Plain, target: self, action: "nextPage")
        self.navigationItem.rightBarButtonItem = nextButton
        
        myLabel = UILabel(frame:CGRect(x:100,y:100,width:100,height:50))
        myLabel!.text = "字体"
        self.view.addSubview(myLabel)
    }
    
    func nextPage() {
        let svc = SecondViewController()
        svc.delegate = self
        self.navigationController?.pushViewController(svc,animated:true)
    }
    
    func fontSizeDidChange(controller:SecondViewController,fontSize:Int) {
        println("fontSize:\(fontSize)")
        myLabel!.font = UIFont.systemFontOfSize(CGFloat(fontSize))
    }
}
