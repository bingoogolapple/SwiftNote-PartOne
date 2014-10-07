//
//  Product.swift
//  九宫格新
//
//  Created by bingoogol on 14/9/30.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class Product: NSObject {
    var name: NSString!
    var image: UIImage!
    
    class func productWithName(name:NSString) -> Product {
        var product = Product()
        product.name = name
        var imageName = NSString(format: "images.bundle/tmall_icon_cat_outing_%d", arc4random_uniform(12) + 1)
        product.image = UIImage(named: imageName)
        return product
    }
}