//
//  ViewPersonViewController.swift
//  数据存储和表格演练
//
//  Created by bingoogol on 14/9/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

protocol ViewPersonViewControllerDelegate : NSObjectProtocol {
    func viewPersonShouldSavePersonData(controller:ViewPersonViewController)
}

class ViewPersonViewController: UITableViewController,EditPersonViewControllerDelegate {

    @IBOutlet weak var iconIv: UIImageView!
    
    @IBOutlet weak var usernameTv: UILabel!
    
    @IBOutlet weak var qqTv: UILabel!
    
    @IBOutlet weak var phoneTv: UILabel!
    
    @IBOutlet weak var sexTv: UILabel!
    
    var personData:Person?
    
    var viewDelegate:ViewPersonViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("ViewPersonViewController-viewDidLoad")
        
        setViewData()
    }
    
    func setViewData() {
        usernameTv.text = personData?.username
        qqTv.text = personData?.qq
        phoneTv.text = personData?.phoneNo
        iconIv.image = personData?.iconImage
        var sexStr = personData?.getSexStr()
        sexTv.text = sexStr
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var editPersonViewController:EditPersonViewController = segue.destinationViewController as EditPersonViewController
        println("ViewPersonViewController-prepareForSegue")
        editPersonViewController.editDelegate = self
        editPersonViewController.person = self.personData
    }
    
    func editPersonShouldSavePersonData(controller: EditPersonViewController) {
        personData = controller.person
        setViewData()
        
        viewDelegate?.viewPersonShouldSavePersonData(self)
    }
}