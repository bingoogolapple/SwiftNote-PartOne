//
//  MainViewController.swift
//  滚动视图优化
//
//  Created by bingoogol on 14/9/11.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/**
开发思路：
1.使用三个UIImageView来显示scrollView中的内容，当页面变化时，刷新三个UIImageView中的内容可以达到模拟连续滚动的效果
2.准备工作：
    1）图像数组
    2）图像文件名的数组，把要显示的图像文件记录在数组中，等需要时再临时加载图像
3.开发工作
    1）实例化滚动视图
    2）创建图像文件名的数组
    3）创建图像视图数组
*/
let kImageCount = 5
class MainViewController: UIViewController,UIScrollViewDelegate {
    weak var scrollView:UIScrollView!
    weak var label:UILabel!
    // 保存滚动视图显示内容的图像视图数组，数组中一共有三张图片
    var imageViewList = [UIImageView]()
    // 图像“文件名”数组，按照要显示的顺序保存图像文件名
    var imageNameList:NSMutableArray = NSMutableArray(capacity: kImageCount)
    
    
    override func loadView() {
        // 1.实例化视图
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        // 2.实例化滚动视图
        var scrollView = UIScrollView(frame: UIScreen.mainScreen().applicationFrame)
        self.view.addSubview(scrollView)
        // 3.创建图像文件名的数组
        for i in 1 ... kImageCount {
            imageNameList.addObject("\(i).jpg")
        }
        // 4.创建图像视图的数组
        for i in 0 ... 2 {
            // 注意：全屏子控件的大小要与其父控件的大小相一致，这样便于移植
            var imageView = UIImageView(frame: scrollView.bounds)
            imageViewList.append(imageView)
            // 将三张图像视图添加到scrollView上，后续直接设置位置即可
            scrollView.addSubview(imageView)
        }
        
        
        // 5.设置滚动视图属性
        // 1)允许分页
        scrollView.pagingEnabled = true
        // 2)关闭弹簧效果
        scrollView.bounces = false
        // 3)关闭水平滚动条
        scrollView.showsHorizontalScrollIndicator = false
        // 4)设置滚动区域大小
        var width = scrollView.bounds.size.width
        var height = scrollView.bounds.size.height
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * CGFloat(kImageCount + 2), height)
        // 5)设置代理
        scrollView.delegate = self
        self.scrollView = scrollView
        
        // 6.添加分页的控件
        var label = UILabel(frame: CGRectMake(0, 420, 320, 20))
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(15)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.redColor()
        
        self.view.addSubview(label)
        self.label = label
        
        changeContentOffset(1)
        setScrollContentWithPage(0)
    }
    
    func setScrollContentWithPage(page:Int) {
        label.text = "\(page + 1)/共\(kImageCount)页"
        // 4 0 1    0
        // 0 1 2    1
        
        // 2 3 4    3
        // 3 4 0    4
        var startI = (page + kImageCount - 1) % kImageCount
        var next = (page + 1) % kImageCount
        println("\(startI),\(page),\(next)")
        
        // 知道对应的图片文件名的数组下标，可以直接设置imageView数组中的图像
        var width = scrollView.bounds.size.width
        var height = scrollView.bounds.size.height
        for i in 0 ... 2 {
            var imageName = imageNameList[(startI + i) % kImageCount] as NSString
            println("imageName:\(imageName)")
            var imageView = imageViewList[i]
            imageView.image = UIImage(named: imageName)
            // 挪动位置，需要连续设置三张图片的位置
            // 因为多了两张缓存的页面，因此page = 0时，数组中的第0张图片应该显示在1的位置
            imageView.frame = CGRectMake(CGFloat(page + i) * width, 0, width, height)
            println("frame:\(imageView.frame)")
        }
        
    }
    
    // 滚动视图减速事件
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var pageNo = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        println("页面滚动停止\(pageNo)")
        // 0,1,2,3,4,5,6   pageNo
        // 4,0,1,2,3,4,0
        var needAdjust = false
        if pageNo == 0 {
            pageNo = kImageCount
            needAdjust = true
        } else if (pageNo == kImageCount + 1) {
            pageNo = 1
            needAdjust = true
        }
        if(needAdjust) {
            changeContentOffset(pageNo)
        }
        
        setScrollContentWithPage(pageNo - 1)
    }
    
    func changeContentOffset(pageNo:Int) {
        scrollView.contentOffset = CGPointMake(CGFloat(pageNo) * scrollView.bounds.size.width, 0)
    }
}
