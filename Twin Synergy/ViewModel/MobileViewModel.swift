//
//  MobileViewModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class MobileViewModel {
    var mobileViewModels: [MobileModel] = [MobileModel]()
    private var dataAccess: DataAccess
    init(dataAccess: DataAccess) {
        self.dataAccess = dataAccess
        getMobiles()
    }
    private func getMobiles(){
        let mobiles = self.dataAccess.getMobile()
        self.mobileViewModels = mobiles.flatMap { mobile in
            return MobileModel(mobileCover: mobile.mobileCover, mobileTitle: mobile.mobileTitle, mobileDescription: mobile.mobileDescription)
        }
    }
}
