//
//  MobileModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class MobileModel {
    var mobileCover: String
    var mobileTitle: String
    var mobileDescription: String
    init(mobileCover: String, mobileTitle: String, mobileDescription: String) {
        self.mobileCover = mobileCover
        self.mobileTitle = mobileTitle
        self.mobileDescription = mobileDescription
    }
}
