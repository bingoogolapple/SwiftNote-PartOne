//
//  ChatCell.swift
//  CustomTableViewCellCode
//
//  Created by bingoogol on 14/8/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    var iconIv:UIImageView!
    var msgBtn:UIButton!

    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 实例化图像视图
        var imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        imageView.image = UIImage(named: "0.png")
        self.contentView.addSubview(imageView)
        iconIv = imageView
        // 实例化聊天按钮
        var button : UIButton! = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRect(x: 100, y: 10, width: 200, height: 60)
        
        var normalImage = UIImage(named:"chatfrom_bg_normal.png")
        
        var leftCap = Int(normalImage.size.width) / 2
        var topCap = Int(normalImage.size.height) / 2
        normalImage = normalImage.stretchableImageWithLeftCapWidth(leftCap, topCapHeight: topCap)
        button.setBackgroundImage(normalImage, forState: UIControlState.Normal)
        
        var highlightImage = UIImage(named:"chatfrom_bg_focused.png")
        highlightImage = highlightImage.stretchableImageWithLeftCapWidth(leftCap, topCapHeight: topCap)
        button.setBackgroundImage(highlightImage, forState: UIControlState.Highlighted)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        self.contentView.addSubview(button)
        msgBtn = button
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}