//
//  ViewController.swift
//  归档和恢复
//
//  Created by bingoogol on 14/8/24.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
需求：
1.自定义一个个人信息类：姓名、年龄、电话、头像
2.如果没有保存在磁盘上的记录，那么直接允许用户设置
3.如果存在磁盘记录，显示在界面上
4.需要一个保存按钮来帮助完成保存操作
开发步骤：
1.定义个人信息类
2.在界面上添加按钮，保存假数据到磁盘
3.设置完整的界面，从磁盘读取数据，显示UI
*/
class ViewController: UIViewController {
    let documentPath: NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as NSString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var saveBtn:UIButton = UIButton.buttonWithType(UIButtonType.System)
         as UIButton
        saveBtn.frame = CGRect(x: 110, y: 400, width: 100, height: 40)
        saveBtn.setTitle("保存", forState: UIControlState.Normal)
        saveBtn.addTarget(self, action: Selector("savePersonData"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(saveBtn)
        
        // 1.姓名
        var nameTv:UITextView = UITextView(frame: CGRect(x: 100, y: 22, width: 200, height: 40))
        self.view.addSubview(nameTv)
        // 2.年龄
        var ageTv:UITextView = UITextView(frame: CGRect(x: 100, y: 72, width: 200, height: 40))
        self.view.addSubview(ageTv)
        // 3.电话
        var phoneTv:UITextView = UITextView(frame: CGRect(x: 100, y: 122, width: 200, height: 40))
        self.view.addSubview(phoneTv)
        // 4.头像
        var imageIv:UIImageView = UIImageView(frame: CGRect(x: 100, y: 182, width: 200, height: 200))
        imageIv.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(imageIv)
        
        var personPath = "\(documentPath)/person.plist"
        // 归档的对象必须是遵守NSCoding协议的对象，如果该对象遵守了NSCoding协议
        // 那么，调用unarchiveObjectWithFile方法时，会自动调用该对象的init(coder aDecoder: NSCoder)方法
        var person:Person? = NSKeyedUnarchiver.unarchiveObjectWithFile(personPath) as? Person
        if person != nil {
            nameTv.text = person!.name
            ageTv.text = "\(person!.age)"
            phoneTv.text = person!.phoneNo
            imageIv.image = person!.image
        }
    }
    
    func savePersonData() {
        println("保存用户数据")
        // 实例化一条假数据，并且保存到磁盘
        var person:Person = Person()
        person.name = "张三"
        person.age = 19
        person.phoneNo = "15216661111"
        // 使用imageNamed加载的UIImage对象，会被保存在系统缓存中，并且释放的非常缓慢
        // 使用该方法适合加载较小的图像或频繁使用的图像(按钮背景图片等)
        // person.image = UIImage(named: "ppt.png")
        
        var imagePath = NSBundle.mainBundle().pathForResource("ppt", ofType: "png")
        // 而对于较大的图像，或者使用不频繁的图像，应该使用绝对路径的方式加载
        // 以下代码加载的UIImage一旦使用完毕就会被释放
        person.image = UIImage(contentsOfFile: imagePath)
        
        // 写入文件
        // 1.确定文件写入路径
        var personPath = "\(documentPath)/person.plist"
        println(personPath)
        // 2.调用归档方法保存个人数据
        // 归档的对象必须是遵守NSCoding协议的对象，如果该对象遵守了NSCoding协议
        // 那么，调用archiveRootObject方法时，会自动调用该对象的encodeWithCoder方法
        // 编码完成之后，再去写入
        NSKeyedArchiver.archiveRootObject(person, toFile: personPath)
        
    }

}

