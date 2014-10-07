//
//  MainViewController.swift
//  键盘输入
//
//  Created by bingoogol on 14/9/17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,KeyboardToolDelegate,UITextFieldDelegate {
    // 键盘工具自定义视图。会由文本输入框管理，所以用弱引用
    weak var keyboardTool:KeyboardTool!
    // 建立所有文本输入控件的数组
    var textFieldArray:NSArray!
    // 当前选中的文本框
    weak var selectedTextField:UITextField?
    

    override func loadView() {
        // 1.实例化视图
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        // 2.搭建UILabel
        createLabelWithFrame(CGRectMake(20, 20, 80, 30), text: "姓名\u{2600}")
        createLabelWithFrame(CGRectMake(20, 55, 80, 30), text: "QQ\u{0001f496}")
        createLabelWithFrame(CGRectMake(20, 90, 80, 30), text: "生日")
        createLabelWithFrame(CGRectMake(20, 125, 80, 30), text: "城市")
        // 3.创建TextField
        self.keyboardTool = KeyboardTool.keyboardTool()
        keyboardTool.toolDelegate = self
        var nameEt = createTextFieldWithFrame(CGRectMake(105, 20, 195, 30), placeholder: "请输入姓名")
        nameEt.inputAccessoryView = keyboardTool
        
        var qqEt = createTextFieldWithFrame(CGRectMake(105, 55, 195, 30), placeholder: "请输入QQ\u{0001f496}")
        qqEt.inputAccessoryView = keyboardTool
        var birthdayEt = createTextFieldWithFrame(CGRectMake(105, 90, 195, 30), placeholder: "请选择生日")
        birthdayEt.inputAccessoryView = keyboardTool
        var cityEt = createTextFieldWithFrame(CGRectMake(105, 125, 195, 30), placeholder: "请选择城市")
        cityEt.inputAccessoryView = keyboardTool
        textFieldArray = [nameEt,qqEt,birthdayEt,cityEt]
        
        // 常用遍历视图中子视图控件，并查找其中指定类型的方法textFieldArray:NSMutableArray
//        textFieldArray = NSMutableArray(capacity: 4)
//        for view in self.view.subviews {
//            if view.isKindOfClass(UITextField) {
//                textFieldArray.addObject(view)
//            }
//        }
    }
    
    func createLabelWithFrame(frame:CGRect, text:NSString) {
        var label = UILabel(frame: frame)
        label.text = text
        self.view.addSubview(label)
    }
    
    func createTextFieldWithFrame(frame:CGRect,placeholder:NSString) -> UITextField {
        var textField = UITextField(frame: frame)
        // 1)设置边框
        textField.borderStyle = UITextBorderStyle.RoundedRect
        // 2)设置垂直居中排列
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        // 3)文本的占位提示信息
        textField.placeholder = placeholder
        textField.delegate = self
        // 4)将文本添加到根视图
        self.view.addSubview(textField)
        return textField
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // 记录当前选中的文本框
        self.selectedTextField = textField
        var index = self.textFieldArray.indexOfObject(self.selectedTextField!)
        self.keyboardTool.preButton.enabled = index == 0 ? false : true
        self.keyboardTool.nextButton.enabled = index == textFieldArray.count - 1 ? false : true
    }
    
    func keyboardTool(keyboard: KeyboardTool, buttonType: KeyBoardToolButtonType) {
        if buttonType == KeyBoardToolButtonType.Done {
            self.view.endEditing(true)
        } else {
            var index = self.textFieldArray.indexOfObject(self.selectedTextField!)
            if buttonType == KeyBoardToolButtonType.Next {
                index++
            } else {
                index--
            }
            var textField = self.textFieldArray[index] as UITextField
            textField.becomeFirstResponder()
        }
    }
}