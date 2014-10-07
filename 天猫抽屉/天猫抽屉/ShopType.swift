//
//  ShopType.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ShopType: BaseModel {

    var subShops:NSArray!
    var detail:NSString!
    
    class func shopTypeWithDict(dict:NSDictionary) -> ShopType {
        var shopType = ShopType(dict: dict)
        var array = dict["subClass"] as NSArray
        var arrayM = NSMutableArray(capacity: array.count)
        var detailM = NSMutableString(string: "")
        var i = 0
//        for dict in array {
//            var shop = Shop.shopWithDict(dict as NSDictionary)
//            arrayM.addObject(shop)
//            if i < 3 {
//                detailM.appendString("\(shop.name)/")
//            } else if i == 3 {
//                detailM.appendString("\(shop.name)")
//            }
//            i++
//        }
        
//        array.enumerateObjectsUsingBlock { (dict, i, stop) -> Void in
//            var shop = Shop.shopWithDict(dict as NSDictionary)
//            arrayM.addObject(shop)
//            if i < 3 {
//                detailM.appendString("\(shop.name)/")
//            } else if i == 3 {
//                detailM.appendString("\(shop.name)")
//            }
//        }
        
        for (i,dict) in enumerate(array) {
            var shop = Shop.shopWithDict(dict as NSDictionary)
            arrayM.addObject(shop)
            if i < 3 {
                detailM.appendString("\(shop.name)/")
            } else if i == 3 {
                detailM.appendString("\(shop.name)")
            }
        }
        
        shopType.subShops = arrayM
        shopType.detail = detailM
        return shopType
    }
}