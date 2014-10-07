//
//  BaseModel.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var image:UIImage!
    var name:NSString!
    
    init(dict:NSDictionary) {
        self.name = dict["name"] as NSString
        self.image = UIImage(named: dict["imageName"] as NSString)
    }
}