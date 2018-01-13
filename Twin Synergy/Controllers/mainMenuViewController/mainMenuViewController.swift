//
//  mainMenuViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 31/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import UIKit

class mainMenuViewController: UIViewController {
    var mTabBarController: UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func contactBtnTapped(_ sender: UIButton) {
        mTabBarController?.selectedIndex = 2
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func portfolioBtnTapped(_ sender: UIButton) {
        mTabBarController?.selectedIndex = 1
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func homeBtnTapped(_ sender: UIButton) {
        mTabBarController?.selectedIndex = 0
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func closeTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
