//
//  RightViewController.swift
//  网易新闻侧栏
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol RightViewControllerDelegate : NSObjectProtocol {
    func rightViewControllerDidSelectPhoto()
}

class RightViewController: UIViewController {
    
    var selectImageBtn:UIButton!
    var delegate:RightViewControllerDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.frame = CGRectMake(0, 0, 250, 548)
//        self.view.backgroundColor = UIColor.redColor()
        selectImageBtn = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        selectImageBtn.frame = CGRectMake(20, 20, 200, 200)
        selectImageBtn.setTitle("选择照片", forState: UIControlState.Normal)
        selectImageBtn.addTarget(self, action: Selector("selectImage"), forControlEvents: UIControlEvents.TouchUpInside)
//        selectImageBtn.setImage(UIImage(named: "night_user_defaulthead@2x.png"), forState: UIControlState.Normal)
        self.view.addSubview(selectImageBtn)
    }
    
    func selectImage() {
        self.delegate?.rightViewControllerDidSelectPhoto()
    }
}