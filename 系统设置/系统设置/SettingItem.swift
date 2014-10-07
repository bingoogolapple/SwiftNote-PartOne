//
//  SettingItem.swift
//  系统设置
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class SettingItem: NSObject {
    var name:NSString!
    var detail:NSString!
    var identifier:NSString!
    var hasSwitch:Bool!
    var switchValue:Bool!
    
    class func settingItemWithDict(dict:NSDictionary) -> SettingItem {
        var settingItem = SettingItem()
        settingItem.name = dict["name"] as NSString?
        settingItem.detail = dict["detail"] as NSString?
        settingItem.identifier = dict["id"] as NSString?
        settingItem.hasSwitch = dict["hasSwitch"] as Bool?
        settingItem.switchValue = dict["switchValue"] as Bool?
        return settingItem
    }
}
