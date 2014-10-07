//
//  ViewController.swift
//  swift2048
//
//  Created by bingoogol on 14-6-18.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startGame(sender:UIButton) {
        let alertView = UIAlertView()
        alertView.title = "开始"
        alertView.message = "游戏就要开始，你准备好了吗？"
        alertView.addButtonWithTitle("Ready Go!")
        alertView.show()
        alertView.delegate = self
    }

    func alertView(alertView:UIAlertView,clickedButtonAtIndex buttonIndex:Int) {
        self.presentViewController(MainTabViewController(),animated:true,completion:nil)
    }
}

