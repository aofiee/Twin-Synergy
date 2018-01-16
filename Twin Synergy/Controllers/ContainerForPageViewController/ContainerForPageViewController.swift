//
//  ContainerForPageViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit

class ContainerForPageViewController: CustomNavigationController {

    @IBOutlet var pageViewContainer: UIView!
    @IBOutlet var allBtn: UIButton!
    @IBOutlet var webBtn: UIButton!
    @IBOutlet var mobileBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
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
