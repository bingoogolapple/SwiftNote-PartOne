//
//  ViewController.swift
//  仿网易新闻首页
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var headerNewsList:NSArray!
    var newsList:NSArray!
    let HEADER_NEWS_CELL_ID = "HeaderNewsCell"
    let NEWS_CELL_ID = "NewsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化标题新闻
        var headerNewsPath = NSBundle.mainBundle().pathForResource("headerNews", ofType: "plist")
        var headerNewsDict = NSDictionary(contentsOfFile: headerNewsPath!) as NSDictionary!
        var headerNewsArray = headerNewsDict["headline_ad"] as NSArray
        var headerNewsList = NSMutableArray(capacity: headerNewsArray.count)
        for dict in headerNewsArray {
            var headerNews = HeaderNews.headerNewsWithDict(dict as NSDictionary)
            headerNewsList.addObject(headerNews)
        }
        self.headerNewsList = headerNewsList
        
        // 初始化列表新闻
        var newsPath = NSBundle.mainBundle().pathForResource("news", ofType: "plist")
        var newsDict = NSDictionary(contentsOfFile: newsPath!) as NSDictionary!
        var newsArray = newsDict["T1348647853363"] as NSArray
        var newsList = NSMutableArray(capacity: newsArray.count)
        for dict in newsArray {
            var news = News.newsWithDict(dict as NSDictionary)
            newsList.addObject(news)
        }
        self.newsList = newsList
        
        // 注册nib
        var headerNewsNib = UINib(nibName: "HeaderNewsCell", bundle: nil)
        self.tableView.registerNib(headerNewsNib!, forCellReuseIdentifier: HEADER_NEWS_CELL_ID)
        
        var newsNib = UINib(nibName: "NewsCell", bundle: nil)
        self.tableView.registerNib(newsNib!, forCellReuseIdentifier: NEWS_CELL_ID)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + newsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            var headerNewsCell = tableView.dequeueReusableCellWithIdentifier(HEADER_NEWS_CELL_ID) as HeaderNewsCell
            headerNewsCell.loadScrollViewWithArray(headerNewsList)
            return headerNewsCell
        } else {
            var newsCell = tableView.dequeueReusableCellWithIdentifier(NEWS_CELL_ID) as NewsCell
            var news = newsList[indexPath.row - 1] as News
            newsCell.newsTitleLabel.text = news.title
            newsCell.newsDetailLabel.text = news.detail
            newsCell.replyCountLabel.text = "\(news.replyCount)"
            newsCell.newsImageView?.image = news.image
            return newsCell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 185
        } else {
            return 90
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 通过选中动画，在短时间内提示用户选中了某一行
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        // 显示用户选中的新闻标题和url
        var news = newsList[indexPath.row - 1] as News
        println("\(news.title) \(news.url)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
}