//
//  ViewController.swift
//  City
//
//  Created by bingoogol on 14-6-15.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var _province:NSArray!
    var _city:NSMutableDictionary!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化选择器控件
        let picker = UIPickerView()
        // 1.设置选择器数据源
        picker.dataSource = self
        // 2.设置选择器代理
        picker.delegate = self
        picker.showsSelectionIndicator = true
        self.view.addSubview(picker)
        // 3.指定选择器的内容
        loadPickerData()
    }
    
    func loadPickerData() {
        // 1.省份
        _province = ["北京","河北","湖南"]
        // 2.城市
        // 2.1初始化城市字典
        _city = NSMutableDictionary()
        // 2.2实例化城市中的数据
        let city1 = ["东城","西城"]
        _city["北京"] = city1
        let city2 = ["石家庄","唐山","保定"]
        _city["河北"] = city2
        let city3 = ["长沙","郴州","衡阳"]
        _city["湖南"] = city3
    }
    
    // 选择器数据源方法
    // 设置数据列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 设置数据行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return _province.count
        } else {
            let rowProvince = pickerView.selectedRowInComponent(0)
            let provinceName = _province[rowProvince] as String
            let citys = _city[provinceName] as NSArray
            return citys.count
        }
    }
    
    // 设置选择器行的内容
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        if component == 0 {
            return _province[row] as String
        } else {
            let rowProvince = pickerView.selectedRowInComponent(0)
            let provinceName = _province[rowProvince] as String
            let citys = _city[provinceName] as NSArray
            return citys[row] as String
        }
    }
    
    // 用户选择行的时候刷新数据
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
             pickerView.reloadComponent(1)
        } else {
            let rowProvince = pickerView.selectedRowInComponent(0)
            let provinceName = _province[rowProvince] as String
            let citys = _city[provinceName] as NSArray
            let cityName = citys[row] as String
            println("\(provinceName):\(cityName)")
        }
    }

}

