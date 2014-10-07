//
//  ProductButton.swift
//  九宫格新
//
//  Created by bingoogol on 14/9/30.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ProductButton: UIButton {
    let IMAGE_PERCENT:CGFloat = 0.7
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.textAlignment = NSTextAlignment.Center
        self.titleLabel?.font = UIFont.systemFontOfSize(14)
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        // 设置图片等比例显示
        self.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        var imageHeight = contentRect.height * IMAGE_PERCENT
        var height = contentRect.height - imageHeight
        return CGRect(x: 0, y: imageHeight, width: contentRect.width, height: height)
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        var imageHeight = contentRect.height * IMAGE_PERCENT
        return CGRect(x: 0, y: 0, width: contentRect.width, height: imageHeight)
    }
}