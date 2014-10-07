//
//  MainViewController.swift
//  多张图片循环
//
//  Created by bingoogol on 14/9/11.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

/**
开发步骤
1.创建界面：self.view & scrollView
2.创建数据：
3.设置scrollView中的图像
4.设置scrollView的属性
5.通过代理方法实现循环播放
6.增加分页控件
*/
class MainViewController: UIViewController,UIScrollViewDelegate {
    weak var pageControl:UIPageControl!
    weak var scrollView:UIScrollView!
    let kImageCount = 5
    
    override func loadView() {
        // 1.实例化视图
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        // 2.实例化滚动视图
        var scrollView = UIScrollView(frame: UIScreen.mainScreen().applicationFrame)
        self.view.addSubview(scrollView)
        self.scrollView = scrollView
        // 3.创建数据，简历一个图像的数组
        // 因为要多添加首位两张图片，因此需要建立一个kImageCount+2的数组
        var datas = NSMutableArray(capacity: kImageCount + 2)
        for i in 1 ... kImageCount {
            datas.addObject(UIImageView(image: UIImage(named: "\(i).jpg")))
        }
        // 注意：不能直接使用现有数组中的imageView向数组中继续添加，因为指针式重复的
        // 将第一张图片插入到数组的尾部
        datas.addObject(UIImageView(image: UIImage(named: "1.jpg")))
        // 将最后一张图片插入到数组的头部
        datas.insertObject(UIImageView(image: UIImage(named: "\(kImageCount).jpg")), atIndex: 0)
        // 4.将建立好的图像数组添加到scrollView中
        var width = scrollView.bounds.size.width
        var height = scrollView.bounds.size.height
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
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * CGFloat(kImageCount + 2), scrollView.bounds.size.height)
        // 5)设置代理
        scrollView.delegate = self
        // 6.添加分页的控件
        var pageControl = UIPageControl()
        // 1)根据指定的页数，返回分页控件最合适的大小
        var size = pageControl.sizeForNumberOfPages(kImageCount)
        pageControl.frame = CGRectMake(0, 0, size.width, size.height)
        // 2)设置分页控件的位置
        pageControl.center = CGPointMake(width/2, height - 30)
        // 3)设置分页控件的页数
        pageControl.numberOfPages = kImageCount
        pageControl.currentPage = 0
        // 4)设置分页控件指示器的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.grayColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        // 5)添加分页控件的监听方法
        pageControl.addTarget(self, action: Selector("pageChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        // 6)添加到视图
        self.view.addSubview(pageControl)
        self.pageControl = pageControl
        
        changeContentOffset(false)
    }
    
    // 此方法是用户点击分页控件时调用，点当前页的左侧页数递增，点当前页的右侧页数递增
    func pageChanged(sender:UIPageControl) {
        println("分页了\(sender.currentPage)")
        changeContentOffset(true)
    }
    
    // 滚动视图减速事件
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // 根据scrollView的contentOffset属性，判断当前所在的页数
        var pageNo = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        println("页面滚动停止\(pageNo)")
        // 0,1,2,3,4,5,6   pageNo
        // 4,0,1,2,3,4,0   pageControl.currentPage
        if pageNo == 0 {
            pageControl.currentPage = kImageCount - 1
            changeContentOffset(false)
        } else if (pageNo == kImageCount + 1) {
            pageControl.currentPage = 0
            changeContentOffset(false)
        } else {
            pageControl.currentPage = pageNo - 1
        }
    }
    
    // 如果是点击pageControl触发的分页则要加动画，手动触发的循环分页则不要加动画
    func changeContentOffset(animated:Bool) {
        var offsetX = CGFloat(pageControl.currentPage + 1) * self.scrollView.bounds.size.width
        self.scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: animated)
    }

}
