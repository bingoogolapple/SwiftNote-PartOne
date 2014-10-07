//
//  ViewController.swift
//  沙盒目录
//
//  Created by bingoogol on 14/8/23.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
友情提示：
1.如果做数据存取方面的开发，测试工作最好在模拟器上先完成。
因为模拟器上测试数据相对比较好查看。待所有测试工作告一段落之后，再到真机上测试
2.在iPhone开发中，如果做文件的读写操作，通常是没有错误提示的
如果向一个不存在的文件中写文件，读写文件的方法会正常执行，并且不会报错，但是，文件不会写入
*/
class ViewController: UIViewController {
    var textView:UITextView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRect(x: 110, y: 400, width: 100, height: 40)
        button.setTitle("摸我", forState: UIControlState.Normal)
        button.addTarget(self, action: Selector("tapButton"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        textView = UITextView(frame: CGRect(x: 0, y: 22, width: 320, height: 380))
        textView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        textView.editable = false
        textView.dataDetectorTypes = UIDataDetectorTypes.All
        textView.text = "010-68168888"
        self.view.addSubview(textView)
    }
    
    func tapButton() {
        println("被摸了")
        // 1. 应用程序主目录
        var home = NSHomeDirectory()
        println(home)
        appendText("\n==============")
        appendText(home)
        // 2.文档目录
        // 2.1要搜索的目录类型，枚举（提示：需要使用DocumentDirectory，而不是DocumentationDirectory）
        // 2.2要搜索的目录所在范围，通常是用户目录范围
        // 2.3是否展开波浪号，通常使用true(波浪号指应用程序主目录，和linux中的用户主目录差不多cd ~)
        var documents = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        println(documents[0])
        appendText("==============")
        appendText(documents[0] as NSString)
        // 3. 缓存目录
        var caches = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, false)
        println(caches[0])
        appendText("==============")
        appendText(caches[0] as NSString)
        // 4. 临时目录
        var temp = NSTemporaryDirectory()
        println(temp)
        appendText("==============")
        appendText(temp)
    }
    
    func appendText(str:NSString) {
        var content:NSMutableString =  NSMutableString.stringWithString(textView.text) as NSMutableString
        content.appendFormat("%@\n",str)
        //var content = "\(textView.text) \n\(str)"
        textView.text = content
        // 要先设置范围再设置滚动范围
        textView.scrollRangeToVisible(NSRange(location: content.length,length: 0))
    }
    

}

