//
//  webViewModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class WebViewModel {
    var webViewModels: [WebModel] = [WebModel]()
    private var dataAccess: DataAccess
    init(dataAccess: DataAccess) {
        self.dataAccess = dataAccess
        getWeb()
    }
    private func getWeb(){
        let webs = self.dataAccess.getWeb()
        self.webViewModels = webs.flatMap { web in
            return WebModel(webCover: web.webCover, webTitle: web.webTitle, webDescription: web.webDescription)
        }
    }
}
