//
//  MainViewController.swift
//  多张图片分页
//
//  Created by bingoogol on 14/9/10.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/**
开发步骤
1.搭建界面，简历scrollView
2.增加分页功能
3.增加分页控件
    1)将滚动视图的页数和分页控件的页数绑定，需要遵守UIScrollViewDelegate
*/
class MainViewController: UIViewController,UIScrollViewDelegate {
    weak var pageControl:UIPageControl!
    weak var scrollView:UIScrollView!
    
    override func loadView() {
        // 1.实例化视图
        self.view = UIView(frame: UIScreen.mainScreen().applicationFrame)
        println(UIScreen.mainScreen().applicationFrame)
        println(self.view.bounds)
        // 2.创建滚动视图
        var scrollView = UIScrollView(frame: self.view.bounds)
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        // 3.初始化数据
        var datas = NSMutableArray(capacity: 5)
        for i in 1 ... 5 {
            // 1)创建图片的文件名
            var imageName = "\(i).jpg"
            // 2)建立图像视图
            var image = UIImage(named: imageName)
            var imageView = UIImageView(image: image)
            // 3)将视图添加到数组
            datas.addObject(imageView)
        }
        // 4.将建立好的图像数组添加到scrollView中
        var width = scrollView.bounds.size.width
        var height = scrollView.bounds.size.height
        // datas.enumerateObjectsUsingBlock({(var obj:AnyObject!, var index:Int, var stop:UnsafeMutablePointer<ObjCBool>) -> Void in
        // })
        datas.enumerateObjectsUsingBlock({ obj, index, stop in
            // 1)从数组取出imageView
            var imageView:UIImageView = obj as UIImageView
            // 2)设置图像视图的frame
            imageView.frame = CGRectMake(CGFloat(index) * width, 0, width, height)
            // 3)将图像视图添加到scrollView
            scrollView.addSubview(imageView)
        })
        
        // 5.设置滚动视图属性
        // 1)允许分页
        scrollView.pagingEnabled = true
        // 2)关闭弹簧效果
        scrollView.bounces = false
        // 3)关闭水平滚动条
        scrollView.showsHorizontalScrollIndicator = false
        // 4)设置滚动区域大小
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * 5, scrollView.bounds.size.height)
        // 5)设置代理
        scrollView.delegate = self
        // 6.添加分页的控件
        var pageControl = UIPageControl()
        // 1)根据指定的页数，返回分页控件最合适的大小
        var size = pageControl.sizeForNumberOfPages(5)
        pageControl.frame = CGRectMake(0, 0, size.width, size.height)
        // 2)设置分页控件的位置
        pageControl.center = CGPointMake(width/2, height - 30)
        // 3)设置分页控件的页数
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        // 4)设置分页控件指示器的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.blueColor()
        // 5)添加分页控件的监听方法
        pageControl.addTarget(self, action: Selector("pageChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        // 6)添加到视图
        self.view.addSubview(pageControl)
        self.pageControl = pageControl
    }
    
    // 此方法是用户点击分页控件时调用，点当前页的左侧页数递增，点当前页的右侧页数递增
    func pageChanged(sender:UIPageControl) {
        println("分页了")
        var offsetX = CGFloat(sender.currentPage) * self.scrollView.bounds.size.width
        self.scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
    }
    
    // 滚动视图减速事件
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // 根据scrollView的contentOffset属性，判断当前所在的页数
        var pageNo = scrollView.contentOffset.x / scrollView.bounds.size.width
        println("页面滚动停止\(pageNo)")
        pageControl.currentPage = Int(pageNo)
    }
    
}