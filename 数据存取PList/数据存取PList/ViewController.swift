//
//  ViewController.swift
//  数据存取PList
//
//  Created by bingoogol on 14/8/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

// 只有支持的数据类型可以被序列化，存储到plist中。无法将其他cocoa对象存储到plist，不能存储自定义对象
// 支持的数据类型：Array,Dictionary,Boolean,Date,Number,String
class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var arrayBtn:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        arrayBtn.frame = CGRect(x: 110, y: 100, width: 100, height: 40)
            arrayBtn.setTitle("写入array", forState: UIControlState.Normal)
        arrayBtn.addTarget(self, action: Selector("writeArray"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(arrayBtn)
        var dictBtn:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        dictBtn.frame = CGRect(x: 110, y: 170, width: 100, height: 40)
        dictBtn.setTitle("写入dict", forState: UIControlState.Normal)
        dictBtn.addTarget(self, action: Selector("writeDict"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(dictBtn)
    }
    
    func writeArray() {
        println("写入array")
        // 1.定义数组
        var array:NSArray = [1,2,3,4]
        // 2.确定要写入的位置
        var documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        var path = "\(documents[0])/array.plist"
        println(documents[0])
        println(path)
        // 3.写入数组
        array.writeToFile(path, atomically: true)
        
    }
    
    func writeDict() {
        println("写入dict")
        var dict:NSMutableDictionary = NSMutableDictionary()
        for index in 0 ... 5 {
            dict.setValue("value \(index)", forKey: "key \(index)")
        }
        
        var documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var path = "\(documents[0])/dict.plist"
        dict.writeToFile(path, atomically: true)
        
    }

}