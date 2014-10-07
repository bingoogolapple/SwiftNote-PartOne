//
//  ViewController.swift
//  GuoQi
//
//  Created by bingoogol on 14-6-13.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var _dataList:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化日期选择器控件
        let picker = UIPickerView()
        // 1.设置选择器数据源
        picker.dataSource = self
        // 2.设置选择器代理
        picker.delegate = self
        picker.showsSelectionIndicator = true
        self.view.addSubview(picker)
        // 3.加载选择器数据源
        // 3.1 设置路径
        let path = NSBundle.mainBundle().pathForResource("flags", ofType: "plist")
        _dataList = NSArray(contentsOfFile:path!)
    }
    
    // 选择器数据源方法
    // 设置数据列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        
        return 1
    }
    // 设置数据行数
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        
        return _dataList.count
    }
    
    // 选择器代理方法
    // 用自定义视图填充选择器的内容
    // row 行
    // component 列
    // view 用来做优化的
    func pickerView(pickerView: UIPickerView!, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView! {
        let viewHeight = 44
        let labelWidth = 100
        let flagWidth = 280
        let dict = _dataList[row] as Dictionary<String,String>
        
        // 自定义一个UIView
        let flagV = UIView(frame:CGRect(origin: CGPoint(x:0,y:0),size: CGSize(width:flagWidth,height:viewHeight)))
        flagV.backgroundColor = UIColor.greenColor()
        // 1.填充UIView的内容
        // 1.1 国家的名字-UILabel
        let nameL = UILabel(frame:CGRect(origin: CGPoint(x:0,y:0), size:CGSize(width:labelWidth,height:viewHeight)))
        nameL.text = dict["name"]
        nameL.textAlignment = NSTextAlignment.Center
        // 1.2 将自定义UILabel添加到flagV
        flagV.addSubview(nameL)
        
        // 2.国家图标
        let imageIV = UIImageView(frame:CGRect(origin:CGPoint(x:labelWidth,y:0),size:CGSize(width:(flagWidth - labelWidth),height:viewHeight)))
        imageIV.image =  UIImage(named:dict["icon"])
        flagV.addSubview(imageIV)
        // 自定义完成，返回UIView作为选择器的内容
        return flagV
    }
    
    // 设置行高
    func pickerView(pickerView: UIPickerView!, rowHeightForComponent component: Int) -> CGFloat {
        
        // 默认44
        return 48
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        let dict = _dataList[row] as Dictionary<String,String>
        let name = dict["name"]
        println("选择的国家是--\(name)")
    }
    
}

