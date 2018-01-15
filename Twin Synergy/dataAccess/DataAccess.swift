//
//  DataAccess.swift
//  Twin Synergy
//
//  Created by SkullTree on 13/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class DataAccess{
    func getAlbums() -> [AlbumModel]{
        var albums = [AlbumModel]()
        albums.append(AlbumModel(albumCover: "m1", albumTitle: "MEDIA"))
        albums.append(AlbumModel(albumCover: "m2", albumTitle: "STORE"))
        albums.append(AlbumModel(albumCover: "m3", albumTitle: "INDUSTRAIL"))
        albums.append(AlbumModel(albumCover: "m4", albumTitle: "TRAVEL"))
        albums.append(AlbumModel(albumCover: "m5", albumTitle: "RESTURANT"))
        albums.append(AlbumModel(albumCover: "m6", albumTitle: "COMPANY"))
        return albums
    }
}
