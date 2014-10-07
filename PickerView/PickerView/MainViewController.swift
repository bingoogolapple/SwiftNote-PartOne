//
//  MainViewController.swift
//  PickerView
//
//  Created by bingoogol on 14/9/16.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

let kStartYear = 1980
let kYearCount = 200

/*
1.实例化根视图
2.实例化PickerView并指定代理
3.设置PickerView的数据源：年数组、月数组、日数组
*/
class MainViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    // 定义数据属性
    var yearList:NSArray!
    var monthList:NSArray!
    var dayList:NSMutableArray = NSMutableArray(capacity: 31)
    var selectedYear:Int!
    var selectedMonth:Int!
    

    override func loadView() {
        // 1.实例化根视图
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        // 2.实例化PickerView
        // 提示：在使用PickerView之前，可必须指定数据源
        var pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.addSubview(pickerView)
        // 3.初始化数据
        // 1)年数据
        var yearList:NSMutableArray = NSMutableArray(capacity: kYearCount)
        for i in 0 ... kYearCount {
            yearList.addObject("\(i + kStartYear)年")
        }
        self.yearList = yearList
        // 2)月数据
        var monthList:NSMutableArray = NSMutableArray(capacity: 12)
        for i in 1 ... 12 {
            monthList.addObject("\(i)月")
        }
        self.monthList = monthList
        // 初始化选中年、月
        self.selectedYear = 1980
        self.selectedMonth = 1
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            // 年
            return self.yearList.count
        } else if component == 1 {
            // 月
            return self.monthList.count
        } else {
            // 日
            // 需要创建日数组-懒加载
            createDayListWithYear(self.selectedYear, month: self.selectedMonth)
            return self.dayList.count
        }
    }
    
    func isLeapYear(year:Int) -> Bool {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
    }
    
    func createDayListWithYear(year:Int, #month:Int) {
        self.dayList.removeAllObjects()
        // 初始化日数组
        /*
        年：是否是闰年
        月：大月、小月
        */
        var days = 31
        if isLeapYear(year) && month == 2 {
            // 闰年的2月
            days = 29
        } else if month == 2 {
            // 非闰年2月
            days = 28
        } else if month == 4 || month == 6 || month == 9 || month == 11 {
            days = 30
        }
        for i in 1 ... days {
            self.dayList.addObject("\(i)日")
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0 {
            return self.yearList[row] as NSString
        } else if component == 1 {
            return self.monthList[row] as NSString
        } else {
            return self.dayList[row] as NSString
        }
    }

    /*
    component:用户当前操作的列
    row:用户在component列选中的行
    这两个参数主要目的是用于数据联动操作的
    如果不需要数据联动，可以无视这两个参数
    如果需要知道用户在所有列中选择的信息，可以直接使用PickerView的selectedRowInComponent
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 && self.selectedMonth == 2 {
            // 如果用户是在年列选择的数值，同时月份中的当前值是2月，需要刷新数据
            self.selectedYear = pickerView.selectedRowInComponent(component) + kStartYear
            pickerView.reloadComponent(2)
        } else if component == 1 {
            // 当用户在月份列选择数组时，需要刷新日期的数组
            self.selectedMonth = pickerView.selectedRowInComponent(component) + 1
            pickerView.reloadComponent(2)
        }
    }

}