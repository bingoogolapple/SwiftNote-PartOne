//
//  ViewController.swift
//  Hello
//
//  Created by bingoogol on 14-6-4.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var qqTextField : UITextField?
    @IBOutlet var pwdTextField : UITextField?
    
    
    @IBOutlet var number1 : UITextField?
    @IBOutlet var number2 : UITextField?
    
    @IBOutlet var result : UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
    }
    
    func addButton() {
        let button:UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRect(origin:CGPoint(x:150,y:450), size:CGSize(width: 100,height: 40))
        button.setTitle("别摸我", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        // 如果有参数，则在后面加一个冒号
        button.addTarget(self, action: Selector("tabButton:"), forControlEvents : UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
    }
    
    func tabButton(button:UIButton) {
        println("我被摸了\(button.titleForState(UIControlState.Normal))")
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        // 要执行此代理方法，需要在Storybord中，将文本框的代理设置给controller
        if textField == qqTextField {
            // 当用户在qq号输入框获取焦点时按下回车按钮，光标切换到密码框
            pwdTextField?.becomeFirstResponder()
        } else if textField == pwdTextField {
            // 当用户在密码框获取焦点时按下回车按钮，执行登陆操作
            login()
        }
        return true;
    }

    @IBAction func login() {
        let qq = qqTextField?.text
        let pwd = pwdTextField?.text
        view.endEditing(true)
        println("点击了登陆按钮，qq=\(qq),密码=\(pwd)")
    }
    
    @IBAction func calculator() {
        if let num1 = number1?.text.toInt() {
            if let num2 = number2?.text.toInt() {
                result?.text = "\(num1 + num2)"
               // number2.resignFirstResponder()
                view.endEditing(true)
            } else {
                println("number2 Couldn't convert to a number")
            }
        } else {
            println("number1 Couldn't convert to a number")
        }
    }
    
    @IBAction func indexChange(sender : UISegmentedControl) {
        println(sender.selectedSegmentIndex)
    }

}

