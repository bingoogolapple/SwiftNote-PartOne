//
//  RootViewController.swift
//  Empty
//
//  Created by bingoogol on 14-6-17.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
delegate用弱引用
UIViewController与组件属性用弱引用
UIViewController的根view与其他视图组件是强引用
*/
class RootViewController : UIViewController {
    
    var clickCount = 0
    var myLabel:UILabel!
    
    /*
    全代码开发时，在此方法中编写创建子视图的所有代码
    注意：
    1.不要使用super.loadView()
    2.不要忘记实例化self.view
    3.如果使用storyboard或者xib方式，不建议重写该方法
    */
    override func loadView() {
        // UIController中的视图是懒加载的
        // 在此处打印self.view，self.view并不存在，会出现死循环loadView
        // println(self.view)
        
        // 1.首先需要初始化视图
        // 使用UIScreen.mainScreen().applicationFrame可以获取应用程序窗口的大小，自动偏移了状态栏的高度
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        // self.view默认是透明的
        
        myLabel = UILabel(frame:CGRect(x:0,y:0,width:155,height:44))
        myLabel!.text = "点击了\(clickCount)次"
        myLabel!.backgroundColor = UIColor.greenColor()
        self.view.addSubview(myLabel)
        
        let myButton = UIButton(frame:CGRect(x:170,y:100,width:155,height:44))
        myButton.setTitle("这是按钮",forState:.Normal)
        myButton.backgroundColor = UIColor.orangeColor()
        myButton.addTarget(self, action: "clickMyButton:", forControlEvents:.TouchUpInside)
        self.view.addSubview(myButton)
    }
    
    /*
    在使用xib方式开发时，不要考虑在init或者initWithNib方法中编写代码。
    视图加载完成后，会调用viewDidLoad方法，可以在此方法中，编写一些后续的处理代码，例如：数据初始化工作。
    
    有些在网络上下载的程序，会在视图控制器中使用awakeFromNib方法，但是在实际开发中，awakeFromNib方法
    通常用于自定义视图，不建议在试图控制器中使用
    */
    // 视图完成加载，马上就要出现了。可以在此做一些后续的事情，不过通常在纯代码开发中，viewDidLoad方法也可以被忽略
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
    viewDidLoad方法完成后，只是视图完成了加载工作
    此时：视图控制器尚未把视图交给AppDelegate的UIWindow
    视图控制器会在视图显示前，将view交给UIWindow
    */
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func clickMyButton(sender:UIButton) {
        clickCount++
        myLabel!.text = "点击了\(clickCount)次"
    }
    
}
