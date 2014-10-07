//
//  TestSwift.swift
//  SwiftCallOC
//
//  Created by bingoogol on 14/9/21.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class TestSwift: NSObject {

    override init() {
        println("in init")
    }
    
    func someFunc() {
        println("int someFunc")
    }
    
    func getArrayByValue(v1:NSString,v2:NSString) -> NSArray {
        return [v1,v2]
    }
}