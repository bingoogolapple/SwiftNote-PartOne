//
//  MainViewController.swift
//  DataPicker
//
//  Created by bingoogol on 14/9/14.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITextFieldDelegate {
    weak var datePicker:UIDatePicker!
    weak var segment:UISegmentedControl!
    weak var dateText:UITextField!

    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        // 创建UIDatePicker
        var datePicker = UIDatePicker()
        
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.locale = NSLocale(localeIdentifier: "zh_Hans")
        datePicker.addTarget(self, action: Selector("dateValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(datePicker)
        self.datePicker = datePicker
        // 创建选项卡控件
        var segment = UISegmentedControl(items: ["日期","日期和时间","时间","倒计时"])
        segment.frame = CGRectMake(20, 250, 280, 44)
        segment.addTarget(self, action: Selector("segmentValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(segment)
        self.segment = segment
        // 创建文本框
        var dateText = UITextField(frame: CGRectMake(20, 320, 280, 44))
        // 文本控件默认没有边框
        dateText.borderStyle = UITextBorderStyle.RoundedRect
        // 文本控件在ios8中默认已经垂直居中了
        dateText.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        dateText.delegate = self
        self.view.addSubview(dateText)
        self.dateText = dateText
    }
    
    override func viewDidLoad() {
        segment.selectedSegmentIndex = 0
        segmentValueChanged(segment)
    }
    
    func dateFromString(str:NSString) -> NSDate {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.dateFromString(str)!
    }
    
    func segmentValueChanged(segment:UISegmentedControl) {
        println(segment.selectedSegmentIndex)
        switch(segment.selectedSegmentIndex) {
        case 0:
            datePicker.datePickerMode = UIDatePickerMode.Date
            datePicker.date = dateFromString("1990-01-01 12:30");
        case 1:
            datePicker.datePickerMode = UIDatePickerMode.DateAndTime
            datePicker.date = dateFromString("2012-12-30 10:50");
        case 2:
            datePicker.datePickerMode = UIDatePickerMode.Time
            datePicker.date = dateFromString("2013-09-10 15:23");
        case 3:
            // 注意：先设置日期选择模式，再设置计时时长
            datePicker.datePickerMode = UIDatePickerMode.CountDownTimer
            datePicker.countDownDuration = 10 * 60
        default:
            break
        }
        dateValueChanged(datePicker)
    }
    
    func dateValueChanged(datePicker:UIDatePicker) {
        var formatter = NSDateFormatter()
        switch datePicker.datePickerMode {
        case UIDatePickerMode.Date:
            formatter.dateFormat = "yyyy-MM-dd"
        case UIDatePickerMode.DateAndTime:
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
        case UIDatePickerMode.Time:
            formatter.dateFormat = "HH:mm"
        case UIDatePickerMode.CountDownTimer:
            formatter.dateFormat = "HH:mm:ss"
        default:
            break
        }
        dateText.text = formatter.stringFromDate(datePicker.date)
    }
    
    // 文本框代理方法，禁止用户输入
    func textFieldDidBeginEditing(textField: UITextField) -> Bool {
        return false
    }
}