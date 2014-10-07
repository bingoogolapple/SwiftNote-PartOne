//
//  EditPersonViewController.swift
//  数据存储和表格演练
//
//  Created by bingoogol on 14/9/2.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit

// 提示：在定义协议方法时，第一个参数最好使用自己，以便父视图控制器能够访问更多的成员变量
protocol EditPersonViewControllerDelegate : NSObjectProtocol {
    func editPersonShouldSavePersonData(controller:EditPersonViewController)
}

//UINavigationControllerDelegate,UIImagePickerControllerDelegate照片选择所需协议
class EditPersonViewController: UITableViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var iconImageBtn: UIButton!
    @IBOutlet weak var usernameTv: UITextField!
    @IBOutlet weak var qqTv: UITextField!
    
    @IBOutlet weak var phoneTextTv: UITextField!
    // 在显示的时候使用“男/女”，保存的时候装换成枚举类型
    @IBOutlet weak var sexTv: UITextField!
    // 定义代理
    // 注意：在使用UITableViewController时，如果要使用代理，不能命名成delegate
    // 因为UITableViewController默认有delegate的属性
    var editDelegate:EditPersonViewControllerDelegate?
    
    var person:Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTv.text = person?.username
        qqTv.text = person?.qq
        phoneTextTv.text = person?.phoneNo
        iconImageBtn.setImage(person?.iconImage, forState: UIControlState.Normal)
        var sexStr = person?.getSexStr()
        sexTv.text = sexStr
        
        // 初始化性别选择的UIPickerView,并指定其数据源
        var pickerView:UIPickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        sexTv.inputView = pickerView
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        println("titleForRow - \(row)")
        if row == 0 {
            return "男"
        } else {
            return "女"
        }
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        println("didSelectRow")
        var sexStr = row == 0 ? "男" : "女"
        person?.setSexStr(sexStr)
        sexTv.text = sexStr
    }
    
    @IBAction func selectPhoto() {
        var imagePickerController:UIImagePickerController = UIImagePickerController()
        // 指定照片源
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // 指定是否允许修改
        imagePickerController.allowsEditing = true
        // 指定代理
        imagePickerController.delegate = self
        // 显示照片选择器
        self.navigationController?.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func savePerson(sender: UIBarButtonItem) {
        // 在保存用户数据时，对个人数据进行懒加载方式的实例化
        if person == nil {
            person = Person()
        }
        person?.username = usernameTv.text
        person?.qq = qqTv.text
        person?.phoneNo = phoneTextTv.text
        // 性别问题占时不处理
        person?.iconImage = iconImageBtn.imageView?.image
        
        // 通知父视图控制器（用户列表）保存用户记录，并返回
        // 子视图控制器给父视图控制器传数据时，需要使用代理协议的方式
        editDelegate?.editPersonShouldSavePersonData(self)
        // 要退回到上级视图控制器，需要使用NavigationController将自己弹出窗口
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        /*
        跟踪进去
        let UIImagePickerControllerMediaType: NSString! // an NSString (UTI, i.e. kUTTypeImage)
        let UIImagePickerControllerOriginalImage: NSString! // a UIImage
        let UIImagePickerControllerEditedImage: NSString! // a UIImage
        let UIImagePickerControllerCropRect: NSString! // an NSValue (CGRect)
        let UIImagePickerControllerMediaURL: NSString! // an NSURL
        */
        var image:UIImage = info["UIImagePickerControllerEditedImage"] as UIImage
        self.iconImageBtn.setImage(image, forState: UIControlState.Normal)
        // 关闭照片选择控制器
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}