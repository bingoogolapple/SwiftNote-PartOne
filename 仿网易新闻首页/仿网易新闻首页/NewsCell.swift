//
//  NewsCell.swift
//  仿网易新闻首页
//
//  Created by bingoogol on 14/10/1.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var replyCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

}
