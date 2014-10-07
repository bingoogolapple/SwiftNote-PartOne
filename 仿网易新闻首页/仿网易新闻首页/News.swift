//
//  News.swift
//  仿网易新闻首页
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class News: NSObject {
    var title:NSString!
    var detail:NSString!
    var replyCount:Int!
    var image:UIImage!
    var url:NSString!
    
    class func newsWithDict(dict:NSDictionary) -> News {
        var news = News()
        news.title = dict["title"] as NSString
        news.detail = dict["digest"] as NSString
        news.replyCount = dict["replyCount"] as Int
        var imageName = dict["imgsrc"] as NSString
        news.image = UIImage(named: imageName.lastPathComponent)
        news.url = dict["url"] as NSString
        return news
    }
}
