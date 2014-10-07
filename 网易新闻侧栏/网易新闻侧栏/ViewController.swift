//
//  ViewController.swift
//  网易新闻侧栏
//
//  Created by bingoogol on 14/10/6.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit


class ViewController: UIViewController,RightViewControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,LeftViewControllerDelegate {
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var rightViewController:RightViewController!
    var leftViewController:LeftViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.rightViewController = RightViewController()
        self.rightViewController.delegate = self
        self.rightViewController.view.frame.size = self.rightView.frame.size
        self.rightView.addSubview(self.rightViewController.view)
        
        self.leftViewController = LeftViewController()
        self.leftViewController.leftDelegate = self
        self.leftViewController.view.frame.size = self.leftView.frame.size
        self.leftView.addSubview(self.leftViewController.view)
        
        // 初始化
        self.leftViewController(nil, className: "NewsViewController")
    }
    
    @IBAction func leftBtn(sender: UIBarButtonItem?) {
        var newFrame = self.contentView.frame
        // 根据内容视图的x点判断内容视图是否被移送
        if 0 == newFrame.origin.x {
            // 没有移动，要移动
            newFrame.origin.x = self.leftView.frame.width
        } else {
            // 已经移动，要收回
            newFrame.origin.x = 0
        }
        self.leftView.hidden = false
        self.rightView.hidden = true
        UIView.animateWithDuration(0.3, animations: {
            self.contentView.frame = newFrame
        })
        
    }
    
    @IBAction func rightBtn(sender: UIBarButtonItem?) {
        var newFrame = self.contentView.frame
        // 根据内容视图的x点判断内容视图是否被移送
        if 0 == newFrame.origin.x {
            // 没有移动，要移动
            newFrame.origin.x = -self.rightView.frame.width
        } else {
            // 已经移动，要收回
            newFrame.origin.x = 0
        }
        self.leftView.hidden = true
        self.rightView.hidden = false
        UIView.animateWithDuration(0.3, animations: {
            self.contentView.frame = newFrame
        })
    }
    
    func rightViewControllerDidSelectPhoto() {
        var picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var image = info[UIImagePickerControllerEditedImage] as UIImage
        self.rightViewController.selectImageBtn.setImage(image, forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: nil)
        
        // 注意：在正常开发中，不要忘记把照片保存到沙箱
    }
    
    func leftViewController(controller: LeftViewController?, className: NSString) {
        if controller != nil {
            leftBtn(nil)
        }
        // 注意：ProjectName.ClassName
        var anyobjectype : AnyObject.Type = NSClassFromString("网易新闻侧栏.\(className)")
        var nsobjectype : NSObject.Type = anyobjectype as NSObject.Type
        var vc: UIViewController = nsobjectype() as UIViewController
        for view in self.contentView.subviews {
            if !view.isKindOfClass(UINavigationBar.self) {
                view.removeFromSuperview()
            }
        }
        self.contentView.insertSubview(vc.view, atIndex: 0)
    }
}