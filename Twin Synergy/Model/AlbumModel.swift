//
//  albumModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 13/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class AlbumModel {
    var albumCover: String
    var albumTitle: String
    init(albumCover: String, albumTitle: String) {
        self.albumCover = albumCover
        self.albumTitle = albumTitle
    }
}
