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
    var mobileCoverBig: String
    var mobileTitle: String
    var mobileDescription: String
    var mobileCoverLand: String
    var storyboardName: String?
    init(mobileCover: String, mobileTitle: String, mobileDescription: String, storyboardName: String? = nil) {
        self.mobileCover = mobileCover
        self.mobileTitle = mobileTitle
        self.mobileDescription = mobileDescription
        self.mobileCoverBig = "\(self.mobileCover)_big"
        self.mobileCoverLand = "\(self.mobileCover)_land"
        self.storyboardName = storyboardName
    }
}
