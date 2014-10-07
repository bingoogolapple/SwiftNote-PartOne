//
//  MyView.swift
//  CustomView
//
//  Created by bingoogol on 14/7/27.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }
    
    @IBInspectable var str:String = "Hello"
    
    @IBInspectable var borderWidth:CGFloat = 0 {
    didSet{
        layer.borderWidth = borderWidth
    }
    }
    
    @IBInspectable var borderCorlor:UIColor = UIColor.clearColor() {
    didSet{
        layer.borderColor = borderCorlor.CGColor
    }
    }
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
    didSet {
        layer.cornerRadius = cornerRadius
    }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
