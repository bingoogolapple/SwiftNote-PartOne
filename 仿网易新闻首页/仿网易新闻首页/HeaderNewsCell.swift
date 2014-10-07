//
//  HeaderNewsCell.swift
//  仿网易新闻首页
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

// 不能直接指定父视图的透明度，否则会连带子视图的透明度一起设置。应该单独建一个视图设置透明度，讲父视图的背景色置为clearColor
class HeaderNewsCell: UITableViewCell,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    var dataList:NSArray!
    
    // 在使用xib或者storyboard开发时，此方法不会被调用
    override init?(style: UITableViewCellStyle, reuseIdentifier: String?) {
        println("init reuse start")
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        println("init reuse end")
    }

    required init(coder aDecoder: NSCoder) {
        println("init coder start")
        super.init(coder: aDecoder)
        println("init coder end")
    }
    
    // 从Bundle中加载nib后会调用
    override func awakeFromNib() {
        println("init nib start")
        super.awakeFromNib()
        println("init nib end")
        // 做一些nib的初始化工作
        // 1.设置滚动视图基本属性
        // 1)关闭弹簧效果
        scrollView.bounces = false
        // 2)关闭水平滚动条
        scrollView.showsHorizontalScrollIndicator = false
        // 3)允许分页
        scrollView.pagingEnabled = true
        // 4)设置代理
        scrollView.delegate = self
        // 2.设置新闻标题标签
        newsTitleLabel.textColor = UIColor.whiteColor()
        
        // 3.设置分页控件的属性
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.darkGrayColor()
    }
    
    func loadScrollViewWithArray(array:NSArray) {
        // 为了避免视图控制器传入新的新闻数组，造成滚动视图中图像视图的重复，在设置滚动视图的内容前，需要清空其中的内容
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
        
        var w = scrollView.bounds.width
        var h = scrollView.bounds.height
        for index in 0 ..< array.count {
            var headerNews = array[index] as HeaderNews
            var imageView = UIImageView(image: headerNews.image)
            imageView.frame = CGRectMake(CGFloat(index) * w, 0, w, h)
            scrollView.addSubview(imageView)
        }
        // 设置滚动区域大小
        scrollView.contentSize = CGSize(width: CGFloat(array.count) * w, height: h)

        // 将数组中的第一项设置为默认标题
        newsTitleLabel.text = (array[0] as HeaderNews).title

        // 设置分页控件
        pageControl.currentPage = 0
        pageControl.numberOfPages = array.count
        
        self.dataList = array
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // 首先判断滚动到的页数
        var pageNo = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        newsTitleLabel.text = (dataList[pageNo] as HeaderNews).title
        pageControl.currentPage = pageNo
    }
    
    
    
    
    
    
    
    
    
    
    
}