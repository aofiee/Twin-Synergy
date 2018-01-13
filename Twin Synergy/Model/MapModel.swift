//
//  MapModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 13/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class MapModel {
    var placeName: String
    var address: String
    var lat: Float
    var lng: Float
    
    init(placeName: String, address: String, lat: Float, lng: Float) {
        self.placeName = placeName
        self.address = address
        self.lat = lat
        self.lng = lng
    }
    
}
