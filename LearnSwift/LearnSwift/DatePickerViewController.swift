//
//  DatePickerViewController.swift
//  LearnSwift
//
//  Created by bingoogol on 14-6-12.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//
import UIKit

class DatePickerViewController: UIViewController {
    var birthdayTF:UITextField!
    let dateFormat = "yyyy-MM-dd"
    
    init(coder aDecoder: NSCoder!) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.whiteColor()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBirthday()
    }
    
    func addBirthday() {
        // 生日文本
        let birthdayL = UILabel(frame: CGRect(origin:CGPoint(x:20,y:20), size:CGSize(width: 80,height: 40)))
        birthdayL.text = "生日"
        self.view.addSubview(birthdayL)
        // 生日输入框
        birthdayTF = UITextField(frame:CGRect(origin:CGPoint(x:100,y:20),size:CGSize(width:200,height:40)))
        birthdayTF.text = "1991-08-02"
        birthdayTF.placeholder = "请输入生日"
        birthdayTF.borderStyle = UITextBorderStyle.RoundedRect
        
        self.view.addSubview(birthdayTF)
        // 日期选择控件
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.locale = NSLocale(localeIdentifier:"zh_Hans_CN")
        // 监听日期选择控件数值变化
        datePicker.addTarget(self, action: Selector("dateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let df = NSDateFormatter()
        df.dateFormat = dateFormat
        datePicker.date = df.dateFromString(birthdayTF.text)
        
        // 设置生日文本输入使用的视图，可以使用自定义视图充当文本的输入视图
        birthdayTF.inputView = datePicker
    }
    
    func dateChanged(datePicker:UIDatePicker) {
        let date = datePicker.date
        let df = NSDateFormatter()
        df.dateFormat = dateFormat
        birthdayTF.text = df.stringFromDate(date)
    }
    
    @IBAction func backToHome() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}