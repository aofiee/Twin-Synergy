//
//  MapViewModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 13/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class MapViewModel {
    private var map: MapModel
    init(map: MapModel) {
        self.map = map
    }
    var placeName: String {
        return map.placeName
    }
    var address: String {
        return map.address
    }
    var lat: Float {
        return map.lat
    }
    var lng: Float {
        return map.lng
    }
}
