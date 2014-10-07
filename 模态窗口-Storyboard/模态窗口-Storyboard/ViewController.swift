//
//  ViewController.swift
//  模态窗口-Storyboard
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/**
segue直接从Controller连接到Controller
*/
class ViewController: UIViewController,LoginViewControllerDelegate,UIActionSheetDelegate {
    @IBOutlet weak var loginBtn: UIBarButtonItem!
    @IBOutlet weak var messageLabel: UILabel!
    var isLogon:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(sender: UIBarButtonItem) {
        
        if self.isLogon {
            var sheet = UIActionSheet(title: "是否注销", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "注销")
            sheet.showInView(self.view)
        } else {
            // 因为在Storyboard中已经定义了login视图控制器，因此在此不能实例化新的LoginViewController
            // var controller = LoginViewController()
            // self.presentViewController(controller, animated: true, completion: nil)
            
            // segue直接从Controller连接到Controller
            self.performSegueWithIdentifier("LoginSegue", sender: nil)
        }

    }
    
    func loginViewLogonSuccessedWithUsername(username: NSString) {
        messageLabel.text = username
        loginBtn.title = "注销"
        isLogon = true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  ("LoginSegue" as NSString).isEqualToString(segue.identifier!) {
            var controller = segue.destinationViewController as LoginViewController
            controller.delegate = self
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        println("\(buttonIndex)")
        if buttonIndex == 0 {
            messageLabel.text = "用户未登陆"
            loginBtn.title = "登陆"
            isLogon = false
        }
    }

}