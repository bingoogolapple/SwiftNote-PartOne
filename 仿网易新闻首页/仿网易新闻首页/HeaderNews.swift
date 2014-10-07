//
//  HeaderNews.swift
//  仿网易新闻首页
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class HeaderNews: NSObject {
    var title:NSString!
    var image:UIImage!
    
    class func headerNewsWithDict(dict:NSDictionary) -> HeaderNews {
        var headerNews = HeaderNews()
        headerNews.title = dict["title"] as NSString
        var imageName = dict["imgsrc"] as NSString
        headerNews.image = UIImage(named: imageName.lastPathComponent)
        return headerNews
    }
}