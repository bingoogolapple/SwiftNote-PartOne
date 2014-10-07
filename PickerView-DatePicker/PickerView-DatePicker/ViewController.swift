//
//  ViewController.swift
//  PickerView-DatePicker
//
//  Created by bingoogol on 14-6-11.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import UIKit
/*
在制定PickerView的数据源之前，它是不会显示的
一旦通过PickerView的数据源方法制定了数据源，PickerView就可以显示了
*/
class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate {
    @IBOutlet weak var avatar: UIImageView!
    

    @IBOutlet weak var picker: UIPickerView!
    
    var dataSource = [NSString]()
    
    
    var birthdayTF:UITextField!
    let dateFormat = "yyyy-MM-dd"
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        addBirthday()
        dataSource.append("Hello")
        dataSource.append("World")
    }
    func addBirthday() {
        // 生日文本
        let birthdayL = UILabel(frame: CGRect(origin:CGPoint(x:20,y:20), size:CGSize(width: 80,height: 40)))
        birthdayL.text = "生日"
        self.view.addSubview(birthdayL)
        // 生日输入框
        birthdayTF = UITextField(frame:CGRect(origin:CGPoint(x:100,y:20),size:CGSize(width:200,height:40)))
        birthdayTF.text = "1991-08-02"
        birthdayTF.placeholder = "请输入生日"
        birthdayTF.borderStyle = UITextBorderStyle.RoundedRect
        
        self.view.addSubview(birthdayTF)
        // 日期选择控件
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.locale = NSLocale(localeIdentifier:"zh_Hans_CN")
        // 监听日期选择控件数值变化
        datePicker.addTarget(self, action: Selector("dateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        let df = NSDateFormatter()
        df.dateFormat = dateFormat
        datePicker.date = df.dateFromString(birthdayTF.text)
        
        // 设置生日文本输入使用的视图，可以使用自定义视图充当文本的输入视图
        birthdayTF.inputView = datePicker
    }
    
    func dateChanged(datePicker:UIDatePicker) {
        let date = datePicker.date
        let df = NSDateFormatter()
        df.dateFormat = dateFormat
        birthdayTF.text = df.stringFromDate(date)
    }
    
    @IBAction func selectAvatar() {
        // 实例化照片选择控制器
        let imagePickerController = UIImagePickerController()
        // 设置代理
        imagePickerController.delegate = self
        // 设置是否允许编辑
        imagePickerController.allowsEditing = true
        // 设置照片源
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    //pragma mark 选择头像视图
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!) {
        println(info)
        //avatar.image = info["UIImagePickerControllerOriginalImage"] as UIImage
        avatar.image = info["UIImagePickerControllerEditedImage"] as UIImage
        //picker.dismissViewControllerAnimated(true, completion:nil)
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    // 选择器中的列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        
        return 1
    }
    
    // 每一列中的行数
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        
        return dataSource.count
    }
    
    // 设置component列，row行的内容
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return dataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int) {
        println("列数：\(component),行数：\(row)，值：\(dataSource[row])")
    }
    
    @IBAction func showToast() {
        var alert = UIAlertView()
        alert.title = "这是标题"
        alert.message = "这是消息"
        alert.addButtonWithTitle("按钮文字")
        alert.delegate = self
        alert.show()
    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        println("buttonIndex:\(buttonIndex)")
        
    }

}