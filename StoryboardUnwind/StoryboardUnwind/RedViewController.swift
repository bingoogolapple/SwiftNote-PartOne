//
//  RedViewController.swift
//  StoryboardUnwind
//
//  Created by bingoogol on 14/9/25.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("red viewDidLoad:\n\(self.navigationController?.childViewControllers)")
    }

    @IBAction func unwindToRed(sender:UIStoryboardSegue) {
        println("red unwindToRed:\n\(self.navigationController?.childViewControllers)")
    }

}
