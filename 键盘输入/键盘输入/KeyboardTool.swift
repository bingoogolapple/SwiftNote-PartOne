//
//  KeyboardTool.swift
//  键盘输入
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

enum KeyBoardToolButtonType : Int {
    case Pre
    case Next
    case Done
}


protocol KeyboardToolDelegate : NSObjectProtocol {
    func keyboardTool(keyboard:KeyboardTool,buttonType:KeyBoardToolButtonType)
}

class KeyboardTool: UIToolbar {
    @IBOutlet weak var preButton: UIBarButtonItem!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    // 代理名字不能叫delegate
    var toolDelegate:KeyboardToolDelegate?
    
    // 工厂方法通常与类名相同，工厂方法的参数可以使用WithXXX的格式传递
    class func keyboardTool() -> KeyboardTool {
        // 从xib中加载一组平行的视图数组，然后从中找到定义好的键盘助手视图
        // 本示例中只有一个视图
        // 不要写扩展名
        var array:NSArray = NSBundle.mainBundle().loadNibNamed("KeyboardTool", owner: nil, options: nil)
        return array.lastObject as KeyboardTool
    }

    
    @IBAction func clickPrev(sender: UIBarButtonItem) {
        if self.toolDelegate != nil {
            self.toolDelegate?.keyboardTool(self, buttonType: KeyBoardToolButtonType.Pre)
        }
    }
    
    @IBAction func clickNext(sender: UIBarButtonItem) {
        if self.toolDelegate != nil {
            self.toolDelegate?.keyboardTool(self, buttonType: KeyBoardToolButtonType.Next)
        }

    }
    
    @IBAction func clickDone(sender: UIBarButtonItem) {
        if self.toolDelegate != nil {
            self.toolDelegate?.keyboardTool(self, buttonType: KeyBoardToolButtonType.Done)
        }

    }
    
}