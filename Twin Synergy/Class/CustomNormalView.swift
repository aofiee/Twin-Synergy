//
//  CustomNormalView.swift
//  Twin Synergy
//
//  Created by SkullTree on 26/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation
import UIKit
class CustomNormalView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationController?.topViewController?.navigationItem.backBarButtonItem = backItem
    }
}
