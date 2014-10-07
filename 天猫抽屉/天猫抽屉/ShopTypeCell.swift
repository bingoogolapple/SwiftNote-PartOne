//
//  ShopTypeCell.swift
//  天猫抽屉
//
//  Created by bingoogol on 14/10/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ShopTypeCell: UITableViewCell {
    var originY:CGFloat!
    
    override init?(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        // 设置表格行的背景图片
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "tmall_bg_main.png")!)
        // 清空Label的背景色
        self.textLabel?.backgroundColor = UIColor.clearColor()
        self.textLabel?.font = UIFont.systemFontOfSize(16)
        self.detailTextLabel?.backgroundColor = UIColor.clearColor()
        self.detailTextLabel?.font = UIFont.systemFontOfSize(12)
        self.detailTextLabel?.textColor = UIColor.lightGrayColor()
        // 设置表格选中样式
        selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func saveOriginY() {
        self.originY = self.frame.origin.y
    }
    
    func restoreOriginY() {
        self.frame.origin.y = self.originY
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        println("init coder")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        println("from nib")
    }

}