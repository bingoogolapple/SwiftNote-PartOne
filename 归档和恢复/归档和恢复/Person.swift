
//
//  Person.swift
//  归档和恢复
//
//  Created by bingoogol on 14/8/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class Person:NSObject,NSCoding {
    var name:NSString!
    var age:NSInteger!
    var phoneNo:NSString!
    var image:UIImage!
    
    override init() {
    }
    
    
    // 如果父类也遵守了NSCoding协议，需要调用super里的方法
    // 归档（序列化/编码）
    func encodeWithCoder(aCoder: NSCoder) {
        println("序列化")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeInteger(age, forKey: "age")
        aCoder.encodeObject(phoneNo, forKey: "phoneNo")
        aCoder.encodeObject(image, forKey: "image")
    }
    
    // 恢复（反序列化/解码）
    required init(coder aDecoder: NSCoder) {
        println("反序列化")
        name = aDecoder.decodeObjectForKey("name") as NSString
        age = aDecoder.decodeIntegerForKey("age")
        phoneNo = aDecoder.decodeObjectForKey("phoneNo") as NSString
        image = aDecoder.decodeObjectForKey("image") as UIImage
    }
}