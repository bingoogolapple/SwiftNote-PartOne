//
//  LoginViewController.swift
//  模态窗口-Storyboard
//
//  Created by bingoogol on 14/10/3.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate:NSObjectProtocol {
    func loginViewLogonSuccessedWithUsername(username:NSString)
}

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameText: UITextField!

    @IBOutlet weak var passwordText: UITextField!
    var delegate:LoginViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func goBack(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func login(sender: UIButton) {
        var pwd = passwordText.text as NSString
        if pwd.isEqualToString("123") {
            println("密码正确")
            self.dismissViewControllerAnimated(true, completion: nil)
            if self.delegate != nil {
                self.delegate.loginViewLogonSuccessedWithUsername(usernameText.text)
            }
        } else {
            var alert = UIAlertView(title: "提示", message: "密码错误", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
    }
    
}