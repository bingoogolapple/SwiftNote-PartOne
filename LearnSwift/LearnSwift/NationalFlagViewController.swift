//
//  NationalFlagViewController.swift
//  LearnSwift
//
//  Created by bingoogol on 14-6-12.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class NationalFlagViewController: UIViewController {
    
    
    init(coder aDecoder: NSCoder!) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backToHome() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}