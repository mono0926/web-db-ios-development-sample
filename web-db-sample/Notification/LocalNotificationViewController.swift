//
//  LocalNotificationViewController.swift
//  web-db-sample
//
//  Created by mono on 12/19/15.
//  Copyright © 2015 mono. All rights reserved.
//

import Foundation
import UIKit

class LocalNotificationViewController: UIViewController {
    @IBOutlet var dummyTextField: UITextField!
    @IBOutlet var toolbar: UIToolbar!
    private lazy var pickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyTextField.inputView = pickerView
        dummyTextField.inputAccessoryView = toolbar
        dummyTextField.becomeFirstResponder()
    }
    @IBAction func localNootificationDateDidSelect(sender: UIBarButtonItem) {
        let date = pickerView.date
        print("date: \(date)")
        
        let n = UILocalNotification()
        n.fireDate = date
        n.timeZone = NSTimeZone.systemTimeZone()
        n.alertBody = "ローカル通知"
        n.soundName = UILocalNotificationDefaultSoundName
        n.alertAction = "開く"
        UIApplication.sharedApplication().scheduleLocalNotification(n)
    }
}