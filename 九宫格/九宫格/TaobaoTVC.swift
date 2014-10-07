//
//  TaobaoTVC.swift
//  九宫格
//
//  Created by bingoogol on 14/8/31.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

// 为了避免和UITABLEViewCell内部的tag冲突，在自定义UIButton时，需要使用一个较大的tag加以区分
let START_TAG = 100
// 九宫格按钮总数
let BUTTONCOUNT = 39
// 每排按钮数量
let BUTTONCOUNT_ROW = 5

class TaobaoTVC: UITableViewCell {
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var buttonWidth = 320 / BUTTONCOUNT_ROW
        for index in 0 ..< BUTTONCOUNT_ROW {
            var button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
            button.frame = CGRect(x: index * buttonWidth, y: 0, width: buttonWidth, height: 100)
            button.tag = START_TAG + index
            self.contentView.addSubview(button)
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
