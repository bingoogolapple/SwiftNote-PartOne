//
//  ProductCell.swift
//  九宫格新
//
//  Created by bingoogol on 14/9/30.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : NSObjectProtocol {
    func productCell(productCell: ProductCell, didSelectedAtIndex index: Int)
}

class ProductCell: UITableViewCell {
    let START_INDEX = 100
    var delegate:ProductCellDelegate!
    var cellRow:Int!
    
    override init?(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        var w = UIScreen.mainScreen().bounds.width / CGFloat(COL_COUNT)
        var productBtn:ProductButton
        for i in 0 ..< COL_COUNT {
            productBtn = ProductButton.buttonWithType(UIButtonType.Custom) as ProductButton
            productBtn.frame = CGRectMake(CGFloat(i) * w, 0, w, ROW_HEIGHT)
            productBtn.tag = START_INDEX + i
            productBtn.addTarget(self, action: Selector("clickBtn:"), forControlEvents: UIControlEvents.TouchUpInside)
            self.contentView.addSubview(productBtn)
        }
    }
    
    func resetButtonWithArray(array:NSArray) {
        var productBtn:ProductButton
        var product:Product
        for i in 0 ..< COL_COUNT {
            productBtn = self.viewWithTag(START_INDEX + i) as ProductButton
            if i < array.count {
                productBtn.hidden = false
                product = array[i] as Product
                // UIButton优先显示图片，如果空间不够则只显示图片
                productBtn.setImage(product.image, forState: UIControlState.Normal)
                productBtn.setTitle(product.name, forState: UIControlState.Normal)
            } else {
                productBtn.hidden = true
            }
            
        }
    }
    
    func clickBtn(button:UIButton) {
        if delegate != nil {
            var index = cellRow * COL_COUNT + button.tag - START_INDEX
            delegate.productCell(self, didSelectedAtIndex: index)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
