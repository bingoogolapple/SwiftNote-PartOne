//
//  Province.swift
//  省份城市分组
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class Province: NSObject {
    var name:NSString!
    var pinyin:NSString!
    
    // 工厂方法，简化对象的实例化
    class func provinceWithName(name:NSString) -> Province {
        var province = Province()
        province.name = name
        // 针对重庆这个多音字的问题。只有重庆的重是多音字，特殊情况特殊处理
        if province.name.isEqualToString("重庆") {
            province.pinyin = "C"
        } else {
            // 根据名称的第一个汉子，取出首字母的字符。 -32可以把小写字母转换成大写字母
            var firstChar = pinyinFirstLetter(name.characterAtIndex(0)) - 32
            province.pinyin = NSString(format: "%c",firstChar)
        }
        println("province.pinyin = \(province.pinyin)")
        return province
    }

}