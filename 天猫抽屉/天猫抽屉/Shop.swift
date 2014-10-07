//
//  Shop.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class Shop: BaseModel {
    var classId:NSString!
    // 注意：子类不能使用基类的工厂方法实例化
    class func shopWithDict(dict:NSDictionary) -> Shop {
        var shop = Shop(dict: dict)
        shop.classId = dict["classID"] as NSString
        return shop
    }
}