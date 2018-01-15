//
//  AlbumViewModel.swift
//  Twin Synergy
//
//  Created by SkullTree on 15/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import Foundation

class AlbumViewModel {
    var albumViewModels :[AlbumModel] = [AlbumModel]()
    private var dataAccess :DataAccess
    init(dataAccess :DataAccess) {
        self.dataAccess = dataAccess
        getAlbums()
    }
    private func getAlbums() {
        let albums = self.dataAccess.getAlbums()
        self.albumViewModels =  albums.flatMap { album in
            return AlbumModel(albumCover: album.albumCover, albumTitle: album.albumTitle)
        }
    }
}
