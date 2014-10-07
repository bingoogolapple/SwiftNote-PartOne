//
//  ChatCell.swift
//  QQ聊天布局
//
//  Created by bingoogol on 14/9/27.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/**
在聊天布局表格行中包含的内容包括：
1）用户头像（UIImageView）
2）聊天内容
    1>UIButton有背景图片，刚好适合设置聊天内容的背景
    2>UIButton有title，刚好设置聊天的内容文字

条件预设：
1）当发言人是“我”，用户头像显示在界面的右侧，消息按钮紧贴着用户头像，间距10个点
2）当发言人是“对方”，用户头像显示在界面的左侧，消息按钮紧贴着用户头像，间距10个点
*/

let MARGIN:CGFloat = 10
let ICON_SIZE:CGFloat = 60
let EDGE_SMALL:CGFloat = 10
let EDGE_LARGE:CGFloat = 30
let SCREEN_WIDTH:CGFloat = UIScreen.mainScreen().bounds.width
let BTN_CONTENT_WIDTH:CGFloat = 150
let FONT_SIZE:CGFloat = 18

class ChatCell: UITableViewCell {
    weak var iconIv:UIImageView!
    weak var msgBtn:UIButton!

    // 如果使用storyboard或者xib的方式，该方法不会被调用。此时可以使用awakeFromNib方法来代替
    override init?(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 在初始化单元格时，并不能确定消息的发送方，因此无法准确的定位头像以及按钮的大小及位置，按钮的大小需要随发送的文本自动调整
        var iconIv = UIImageView(frame: CGRectMake(0, 0,ICON_SIZE, ICON_SIZE))
        self.contentView.addSubview(iconIv)
        self.iconIv = iconIv
        var msgBtn = UIButton.buttonWithType(UIButtonType.System) as UIButton
        // default value is 1 (single line). A value of 0 means no limit   不限制文本行数
        msgBtn.titleLabel?.numberOfLines = 0
        msgBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.contentView.addSubview(msgBtn)
        self.msgBtn = msgBtn
        
        // 取消选中样式
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func setMessage(message:Message) {
        // 设置消息按钮文字的外间距
        
        self.msgBtn.setTitle(message.content, forState: UIControlState.Normal)
        
        var strSize = ChatCell.getStringSize(message.content, fontSize: FONT_SIZE, width: BTN_CONTENT_WIDTH)
        
        var normalImage:UIImage
        var focusedImage:UIImage
        if message.fromSelf == true {
            self.iconIv.frame = CGRectMake(SCREEN_WIDTH - ICON_SIZE - MARGIN, MARGIN, ICON_SIZE, ICON_SIZE)
            self.iconIv.image = UIImage(named: "me.png")
            
            self.msgBtn.contentEdgeInsets = UIEdgeInsetsMake(EDGE_SMALL, EDGE_SMALL, EDGE_SMALL, EDGE_LARGE)
            self.msgBtn.frame = CGRectMake(SCREEN_WIDTH - 2 * MARGIN - ICON_SIZE - strSize.width - EDGE_SMALL - EDGE_LARGE, MARGIN, strSize.width + EDGE_SMALL + EDGE_LARGE, strSize.height + 2 * EDGE_SMALL)
            
            normalImage = UIImage(named: "chatto_bg_normal.png")!
            focusedImage = UIImage(named: "chatto_bg_focused.png")!
        } else {
            self.iconIv.frame = CGRectMake(MARGIN, MARGIN, ICON_SIZE, ICON_SIZE)
            self.iconIv.image = UIImage(named: "her.png")
            
            self.msgBtn.contentEdgeInsets = UIEdgeInsetsMake(EDGE_SMALL, EDGE_LARGE, EDGE_SMALL, EDGE_SMALL)
            self.msgBtn.frame = CGRectMake(2 * MARGIN + ICON_SIZE, MARGIN, strSize.width + EDGE_SMALL + EDGE_LARGE, strSize.height + 2 * EDGE_SMALL)
            
            normalImage = UIImage(named: "chatfrom_bg_normal.png")!
            focusedImage = UIImage(named: "chatfrom_bg_focused.png")!
        }
        
        setBtnBackgroundImage(normalImage, state: UIControlState.Normal)
        setBtnBackgroundImage(focusedImage, state: UIControlState.Highlighted)
    }
    
    func setBtnBackgroundImage(var icon:UIImage,state:UIControlState) {
        // 拉伸图像
        // rightCapWidth = width - leftCapWidth - 1;
        // bottomCapHeight = height - topCapHeight - 1
        // stretchWidth为中间可拉伸区域的宽度
        // stretchWidth = width - leftCapWidth - rightCapWidth = 1;
        // stretchHeight为中间可拉伸区域的高度
        // stretchHeight = height - topCapHeight - bottomCapHeight = 1;
        
        var leftCap = Int(icon.size.width * 0.5)
        var topCap = Int(icon.size.height * 0.7)
        icon = icon.stretchableImageWithLeftCapWidth(leftCap, topCapHeight: topCap)
        
        self.msgBtn.setBackgroundImage(icon, forState: state)
    }
    
    class func getStringSize(mytext: NSString, fontSize: CGFloat, width: CGFloat) -> CGSize {
        let font = UIFont.systemFontOfSize(fontSize)
        let size = CGSizeMake(width,CGFloat.max)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .ByWordWrapping;
        let attributes = [NSFontAttributeName:font,
            NSParagraphStyleAttributeName:paragraphStyle.copy()]
        
        let rect = mytext.boundingRectWithSize(size, options:.UsesLineFragmentOrigin, attributes: attributes, context:nil)
        return rect.size
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        
    }

}
