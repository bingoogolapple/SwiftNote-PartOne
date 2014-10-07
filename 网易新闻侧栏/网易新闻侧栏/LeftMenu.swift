//
//  Menu.swift
//  网易新闻侧栏
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class LeftMenu: NSObject {
    var title:NSString!
    var image:UIImage!
    var className:NSString!
    
    class func leftMenuWithDict(dict:NSDictionary) -> LeftMenu {
        var menu = LeftMenu()
        menu.title = dict["title"] as NSString
        menu.className = dict["className"] as NSString
        menu.image = UIImage(named: dict["imageName"] as NSString)
        return menu
    }
}
