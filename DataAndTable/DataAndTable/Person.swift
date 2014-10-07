//
//  Person.swift
//  数据存储和表格演练
//
//  Created by bingoogol on 14/9/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

enum SexType : Int {
    case SexMan
    case SexWoman
    case SexUnknow
}

class Person:NSObject,NSCoding {
    var username:NSString?
    var qq:NSString?
    var phoneNo:NSString?
    var sex:SexType?
    var iconImage:UIImage?
    var sexStr:NSString?
    
    override init() {
    }
    
    func getSexStr() -> NSString {
        if(SexType.SexMan == self.sex) {
            return "男"
        } else if(SexType.SexWoman == self.sex) {
            return "女"
        } else {
            return ""
        }
    }
    
    func setSexStr(var sexStr:NSString) {
        if(sexStr == "男") {
            sex = SexType.SexMan
        } else if(sexStr == "女") {
            sex = SexType.SexWoman
        } else {
            sex = SexType.SexUnknow
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(username!, forKey: "username")
        aCoder.encodeObject(qq!, forKey: "qq")
        aCoder.encodeObject(phoneNo!, forKey: "phoneNo")
        aCoder.encodeInteger(SexType.SexMan.rawValue, forKey: "sex")
        aCoder.encodeObject(iconImage!, forKey: "iconImage")
    }
    
    required init(coder aDecoder: NSCoder) {
        username = aDecoder.decodeObjectForKey("username") as? NSString
        qq = aDecoder.decodeObjectForKey("qq") as? NSString
        phoneNo = aDecoder.decodeObjectForKey("phoneNo") as? NSString
        sex = SexType(rawValue: aDecoder.decodeIntegerForKey("sex"))
        iconImage = aDecoder.decodeObjectForKey("iconImage") as? UIImage
    }
}