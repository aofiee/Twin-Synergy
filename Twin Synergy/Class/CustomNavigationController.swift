//
//  TabbarStruct.swift
//  Twin Synergy
//
//  Created by SkullTree on 30/12/2560 BE.
//  Copyright © 2560 SkullTree. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbarWithButton()
    }
    private func setUpTabbarWithButton() {
        navigationController?.navigationBar.topItem?.title = "Twin Synergy"
        
        let searchBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 17, height: 17))
        searchBtn.setBackgroundImage(UIImage(named: "icon_search"), for: .normal)
        searchBtn.addTarget(self, action: #selector(CustomNavigationController.searchTapped(sender:)), for: .touchUpInside)
        let searchBarButton = UIBarButtonItem(customView: searchBtn)
        
        let cameraBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 17))
        cameraBtn.setBackgroundImage(UIImage(named: "icon_camera"), for: .normal)
        cameraBtn.addTarget(self, action: #selector(CustomNavigationController.cameraTapped(sender:)), for: .touchUpInside)
        let cameraBarButton = UIBarButtonItem(customView: cameraBtn)
        
        //let searchBarButton = UIBarButtonItem.init(image: UIImage.init(named: "icon_search"), style: .plain, target:self, action: #selector(CustomNavigationController.searchTapped(sender:)))
        
        //let cameraBarButton = UIBarButtonItem.init(image: UIImage.init(named: "icon_camera"), style: .plain, target: self, action: #selector(CustomNavigationController.cameraTapped(sender:)))
        
        let mainMenuButton = UIBarButtonItem.init(image: UIImage.init(named: "icon_main_menu"), style: .plain, target: self, action: #selector(mainMenuTapped(sender:)))
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = mainMenuButton
        navigationController?.topViewController?.navigationItem.rightBarButtonItems = [searchBarButton,cameraBarButton]
        //navigationController?.topViewController?.navigationItem.rightBarButtonItem = searchButton
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationController?.topViewController?.navigationItem.backBarButtonItem = backItem
    }
    @objc func searchTapped(sender: AnyObject) {
        print("xxxxx")
    }
    @objc func cameraTapped(sender: AnyObject) {
        print("yyyyy")
    }
    @objc func mainMenuTapped(sender: AnyObject) {
        print("zzzzz")
    }
}
