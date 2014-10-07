//
//  ViewController.swift
//  保存NSString和UIImage
//
//  Created by bingoogol on 14/8/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/*
需求：
从照片库读取一张照片，并且设置界面上的UIImageView
再次进入应用时，直接显示上次选择的图像
思路：
1.界面上需要一个按钮和一个UIImageView
2.使用UIImagePickerController选择照片并且设置UIImageView的显示
3.保存用户选择的UIImage
*/
class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRect(x: 10, y: 22, width: 300, height: 300))
        imageView.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(imageView)
        
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System)
            as UIButton
        button.frame = CGRect(x: 50, y: 320, width: 100, height: 40)
        button.setTitle("选择照片", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("selectPhoto"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        
        // 判断文件是否存在，如果存在，加载到UIImageView中
        var documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        println(documents[0])
        
        var image:UIImage! = UIImage(contentsOfFile: "\(documents[0])/image.png")
        if (image != nil) {
            imageView.image = image
        }
        
        var strPath = "\(documents[0])/abc.txt"
        
        var error : NSError?
        var savedStr:NSString! = NSString(contentsOfFile: strPath, encoding: NSUTF8StringEncoding, error: &error)
        if error != nil {
            println("从文件读取字符串错误: \(error)")
        }
        
        if (savedStr != nil) {
             println("savedStr=\(savedStr)")
        }
       
    }

    func selectPhoto() {
        println("选择照片")
        var imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    // 如果one执行了，这个方法是不会执行的
    //    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    //        println("one")
    //        imageView.image = image
    //        picker.dismissViewControllerAnimated(true, completion: nil)
    //    }
    
    // one
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        //println(info)
        /*
        [
            UIImagePickerControllerEditedImage: <UIImage: 0x7fc47a931a40> size {636, 636} orientation 0 scale 1.000000,
            UIImagePickerControllerOriginalImage: <UIImage: 0x7fc47a931810> size {255, 255} orientation 0 scale 1.000000, 
            UIImagePickerControllerCropRect: NSRect: {{0, 0}, {255, 255}}, 
            UIImagePickerControllerReferenceURL: assets-library://asset/asset.JPG?id=247CCD74-5C75-4701-B1AA-1B47A71D0B3D&ext=JPG, 
            UIImagePickerControllerMediaType: public.image
        ]
        */
        var image:UIImage = info["UIImagePickerControllerEditedImage"] as UIImage
        imageView.image = image
        // 保存图像时，需要使用NSData进行中转，NSData中间可以存储任意格式的二进制数据
        var imageData:NSData = UIImagePNGRepresentation(image)
        var documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        println(documents[0])
        imageData.writeToFile("\(documents[0])/image.png", atomically: true)
        
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        // 注意：虽然NSDictionary可以直接写入文件，但是当内容包含非Boolean,Date,Number,String时，则不能直接写入文件
        
        var strPath = "\(documents[0])/abc.txt"
        // 写入NSString的演示，除非特殊原因，在ios开发中字符串的编码格式统一使用UTF-8
        var string:NSString = "爱老虎油"
        // NSUTF8StringEncoding在NSString中
        string.writeToFile(strPath, atomically: true, encoding: NSUTF8StringEncoding, error:nil)
    }
}