//
//  Product.swift
//  商品列表
//
//  Created by bingoogol on 14/9/22.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class Product: NSObject {
    var name:NSString!
    var detail:NSString!
    var image:UIImage!
    // 工厂方法，简化
    class func productWithName(name:NSString) -> Product {
        var product = Product()
        product.name = name
        product.detail = "老少皆宜"
        var imageName = NSString(format: "%03d.png", arc4random_uniform(9) + 1)
        product.image = UIImage(named: imageName)
        return product
    }
}