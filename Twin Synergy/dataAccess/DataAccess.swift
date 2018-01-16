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
    
    func getMobile() -> [MobileModel]{
        var mobiles = [MobileModel]()
        let desc = """
                   A simple, highly customisable, data-driven 3D carousel
                   """
        mobiles.append(MobileModel(mobileCover: "tall1", mobileTitle: "CRYSTALCLUB", mobileDescription: desc))
        mobiles.append(MobileModel(mobileCover: "tall2", mobileTitle: "BEAR SEEKING", mobileDescription: desc))
        mobiles.append(MobileModel(mobileCover: "tall3", mobileTitle: "MELLO", mobileDescription: desc))
        mobiles.append(MobileModel(mobileCover: "tall1", mobileTitle: "KICKDUDES", mobileDescription: desc))
        mobiles.append(MobileModel(mobileCover: "tall2", mobileTitle: "BUSP", mobileDescription: desc))
        mobiles.append(MobileModel(mobileCover: "tall3", mobileTitle: "EBA", mobileDescription: desc))
        return mobiles
    }
    
    func getWeb() -> [WebModel] {
        var webs = [WebModel]()
        let desc = """
                   A simple, highly customisable, data-driven 3D carousel
                   """
        webs.append(WebModel(webCover: "land1", webTitle: "TATA YOUNG", webDescription: desc))
        webs.append(WebModel(webCover: "land2", webTitle: "PADAENG", webDescription: desc))
        webs.append(WebModel(webCover: "land3", webTitle: "UKHEM", webDescription: desc))
        webs.append(WebModel(webCover: "land1", webTitle: "MIRARA", webDescription: desc))
        webs.append(WebModel(webCover: "land2", webTitle: "SPICY DISC", webDescription: desc))
        webs.append(WebModel(webCover: "land3", webTitle: "CENTRAL THAM", webDescription: desc))
        webs.append(WebModel(webCover: "land1", webTitle: "CENTRAL BKK", webDescription: desc))
        webs.append(WebModel(webCover: "land2", webTitle: "KICKDUDES", webDescription: desc))
        webs.append(WebModel(webCover: "land3", webTitle: "MELLO", webDescription: desc))
        webs.append(WebModel(webCover: "land1", webTitle: "FSM", webDescription: desc))
        webs.append(WebModel(webCover: "land2", webTitle: "KICKDUDES.CLUB", webDescription: desc))
        return webs
    }
}
