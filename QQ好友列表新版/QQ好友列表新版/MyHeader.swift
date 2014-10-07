//
//  MyHeader.swift
//  QQ好友列表新版
//
//  Created by bingoogol on 14/9/28.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol MyHeaderDelegate : NSObjectProtocol {
    func myHeaderDidSelectedHeader(header:MyHeader,section:Int)
}

class MyHeader: UITableViewHeaderFooterView {
    weak var button:UIButton!
    weak var delegate:MyHeaderDelegate!
    var section:Int!
    var isOpen:Bool = false
    
    override init(frame: CGRect) {
        //println("init frame")
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.orangeColor()
        button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = self.bounds
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.setImage(UIImage(named: "disclosure.png"), forState: UIControlState.Normal)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        button.addTarget(self, action: Selector("clickBtn"), forControlEvents: UIControlEvents.TouchUpInside)
        self.contentView.addSubview(button)
    }
    
    required init(coder aDecoder: NSCoder) {
        //println("init coder")
        super.init(coder: aDecoder)
    }
    
    func setTitleContent(title:NSString) {
        button.setTitle(title, forState: UIControlState.Normal)
    }
    
    func clickBtn() {
        if delegate != nil {
            delegate.myHeaderDidSelectedHeader(self, section:self.section)
        }
    }
    
    func toggle(isOpen:Bool) {
        UIView.animateWithDuration(0.5, animations: {
            var angle = isOpen == true ? CGFloat(M_PI_2) : 0
            self.button.imageView?.transform = CGAffineTransformMakeRotation(angle)
            self.isOpen = isOpen
        })
    }

}
