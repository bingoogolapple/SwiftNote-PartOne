//
//  Message.swift
//  QQ聊天布局
//
//  Created by bingoogol on 14/9/27.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class Message: NSObject {
    var content:NSString!
    var fromSelf:Bool!
    class func messageWithContent(content:NSString,fromSelf:Bool) -> Message {
        var msg = Message()
        msg.content = content
        msg.fromSelf = fromSelf
        return msg
    }
}