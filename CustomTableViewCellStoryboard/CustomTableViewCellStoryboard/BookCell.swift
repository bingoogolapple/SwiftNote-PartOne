//
//  BookCell.swift
//  CustomTableViewCellStoryboard
//
//  Created by bingoogol on 14/8/20.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    @IBOutlet var bookNameLabel : UILabel!
    @IBOutlet var bookPriceLabel : UILabel!

    // 购买
    @IBAction func purchase(sender : UIButton) {
        println("购买\(bookNameLabel.text)")
    }
    
    // 收藏
    @IBAction func privates(sender : UIButton) {
        println("收藏\(bookPriceLabel.text)")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
