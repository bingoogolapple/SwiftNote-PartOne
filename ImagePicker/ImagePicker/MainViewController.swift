//
//  MainViewController.swift
//  ImagePicker
//
//  Created by bingoogol on 14/9/15.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

let kImageFileName = "image.png"
let documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)

class MainViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    weak var button:UIButton!
    override func loadView() {
        // 1.实例化根视图，视图实例化时默认是透明的
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        
        // 2.创建一个按钮，等下选择图片后，在按钮中显示选择的图片
        var button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(60, 130, 200, 200)
        button.setTitle("选择图片", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: Selector("clickButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        self.button = button
    }
    
    override func viewDidLoad() {
        var path = "\(documents[0])/\(kImageFileName)"
        var image:UIImage? = UIImage(contentsOfFile: path)
        if image != nil {
            button.setImage(image, forState: UIControlState.Normal)
        }
    }
    
    func clickButton() {
        var imagePicker = UIImagePickerController()
        
        // 1）照片源
        // a 照片库【用相机拍摄以及用电脑同步的】
        // b 保存的图像【用相机拍摄的】
        // c 照相机
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // 2）是否允许编辑
        imagePicker.allowsEditing = true
        // 3）设置代理
        imagePicker.delegate = self
        // 4）显示照片选择控制器，显示modal窗口
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // 照片选择完成的代理方法，照片信息保存在info中
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // 获取编辑后的照片
        var image:UIImage = info["\(UIImagePickerControllerEditedImage)"] as UIImage
        button.setImage(image, forState: UIControlState.Normal)
        // 关闭照片选择器
        // 注意：使用照片选择器选择的图片，只是保存在内存中，如果需要再次使用，需要做保存处理
        dismissViewControllerAnimated(true, completion: {
            // 要保存照片需要NSData做中转
            var imageData:NSData = UIImagePNGRepresentation(image)
            // 需要找出沙盒路径
            
            // 设置保存文件名称
            var path = "\(documents[0])/\(kImageFileName)"
            println(path)
            // 保存文件
            imageData.writeToFile(path, atomically: true)
        })
        
    }
}