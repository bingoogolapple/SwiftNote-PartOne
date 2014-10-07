//
//  MainViewController.swift
//  swift2048
//
//  Created by bingoogol on 14-6-18.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class MainViewController:UIViewController {
    // 游戏方格维度
    var dimension:Int = 4
    // 游戏过关最大值
    var maxNumber:Int = 2048
    //数字格子的宽度
    var width:CGFloat = 50
    //格子与格子的间距
    var padding:CGFloat = 6
    
    var backgrounds:Array<UIView>
    
    init() {
        self.backgrounds = Array<UIView>()
        super.init(nibName:nil,bundle:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        getNumber()
    }
    
    func setupBackground() {
        var x:CGFloat = 30
        var y:CGFloat = 150
        
        for col in 0 .. dimension {
            y = 150
            for row in 0 .. dimension {
                var background = UIView(frame:CGRectMake(x,y,width,width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                backgrounds += background
                y += padding + width
            }
            x += padding + width
        }
    }
    
    func getNumber() {
        let randv = Int(arc4random_uniform(10))
        println(randv)
        var seed:Int = 2
        if(randv == 1) {
            seed = 4
        }
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        
        insertTitle((row,col),value:seed);
    }
    
    func insertTitle(pos:(Int,Int),value:Int) {
        let (row,col) = pos
        let x = 30 + CGFloat(col) * (width + padding)
        let y = 150 + CGFloat(row) * (width + padding)
        let tile = TileView(pos:CGPointMake(x,y),width:width,value:value)
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
        
        UIView.animateWithDuration(0.3,delay:0.1,options:
            UIViewAnimationOptions.TransitionNone,animations:{
                ()->Void in
                tile.layer.setAffineTransform(CGAffineTransformMakeScale(1,1))
            },completion: {
                (finished:Bool)->Void in
                UIView.animateWithDuration(0.08,animations:{
                    ()->Void in
                    tile.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
            })
    }
}