//
//  MyCell.swift
//  UISearchBar
//
//  Created by bingoogol on 14/9/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("initcoder")
    }
    
    // 如果在storyboard中制定了单元格，那么该方法不会被执行
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel.textColor = UIColor.redColor()
        print("initstylereuseidentifier")
    }
    
    // 是所有的控件在加载的时候都会调用该方法
    // 注意：如果使用storyboard设置控件，那么自定义控件的initstylereuseIdentifier不会执行
    // 如果需要对控件进行设置，需要在awakeFromNib方法中设定。initcoder-》awakeFromNib
    override func awakeFromNib() {
        print("awakeFromNib")
    }
    
}
