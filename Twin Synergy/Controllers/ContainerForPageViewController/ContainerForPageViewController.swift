//
//  ContainerForPageViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit

class ContainerForPageViewController: CustomNavigationController {

    @IBOutlet weak var pageViewContainer: UIView!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var webBtn: UIButton!
    @IBOutlet weak var mobileBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initNotificationCenter()
    }
    func initNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(changeButtonColor(notification:)), name: .switchBtn, object: nil)
    }
    @objc func changeButtonColor(notification: NSNotification) {
        if notification.name == .switchBtn {
            //print("notification.object")
            //print(notification.object!)
            let index = notification.object as! Int
            switch index {
                case 0:
                    allBtn.isSelected = true
                    webBtn.isSelected = false
                    mobileBtn.isSelected = false
                break;
                case 1:
                    allBtn.isSelected = false
                    webBtn.isSelected = true
                    mobileBtn.isSelected = false
                break;
                case 2:
                    allBtn.isSelected = false
                    webBtn.isSelected = false
                    mobileBtn.isSelected = true
                break;
                default:
                    
                break;
            }
        }
    }
    @IBAction func allBtn(_ sender: Any) {
        allBtn.isSelected = true
        webBtn.isSelected = false
        mobileBtn.isSelected = false
        NotificationCenter.default.post(name: .all, object: nil)
    }
    @IBAction func webBtn(_ sender: Any) {
        allBtn.isSelected = false
        webBtn.isSelected = true
        mobileBtn.isSelected = false
        NotificationCenter.default.post(name: .web, object: nil)
    }
    @IBAction func mobileBtn(_ sender: Any) {
        allBtn.isSelected = false
        webBtn.isSelected = false
        mobileBtn.isSelected = true
        NotificationCenter.default.post(name: .mobile, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Notification.Name {
    static let all = Notification.Name("all")
    static let web = Notification.Name("web")
    static let mobile = Notification.Name("mobile")
}
