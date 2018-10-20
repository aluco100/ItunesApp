//
//  Album.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Album: Object,Mappable,MusicItem {
    
//    "wrapperType": "collection",
//    "collectionType": "Album",
//    "artistId": "112018",
//    "collectionId": 706008781,
//    "amgArtistId": 5034,
//    "artistName": "Nirvana",
//    "collectionName": "In Utero (20th Anniversary) [Remastered]",
//    "collectionCensoredName": "In Utero (20th Anniversary) [Remastered]",
//    "artistViewUrl": "https://itunes.apple.com/us/artist/nirvana/112018?uo=4",
//    "collectionViewUrl": "https://itunes.apple.com/us/album/in-utero-20th-anniversary-remastered/706008781?uo=4",
//    "artworkUrl60": "https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/59/aa/71/59aa711b-6c74-5a8b-c6ac-8fc9a4a66069/source/60x60bb.jpg",
//    "artworkUrl100": "https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/59/aa/71/59aa711b-6c74-5a8b-c6ac-8fc9a4a66069/source/100x100bb.jpg",
//    "collectionPrice": 9.99,
//    "collectionExplicitness": "notExplicit",
//    "trackCount": 12,
//    "copyright": "℗ 2013 Geffen Records",
//    "country": "USA",
//    "currency": "USD",
//    "releaseDate": "2013-01-01T08:00:00Z",
//    "primaryGenreName": "Alternative"
    
    //MARK: - Properties
    @objc public dynamic var id: Int = 0
    @objc public dynamic var type: String = ""
    @objc public dynamic var artistID: String = ""
    @objc public dynamic var artistName: String = ""
    @objc public dynamic var albumName: String = ""
    @objc public dynamic var albumCensoredName: String = ""
    @objc public dynamic var artistViewURL: String = ""
    @objc public dynamic var albumViewURL: String = ""
    @objc public dynamic var artworkURL: String = ""
    @objc public dynamic var price: Float = 0.0
    @objc public dynamic var trackCount: Int = 0
    @objc public dynamic var collectionPrice: Float = 0.0

    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id<-map["collectionId"]
        type<-map["collectionType"]
        artistID<-map["artistId"]
        artistName<-map["artistName"]
        albumName<-map["collectionName"]
        albumCensoredName<-map["collectionCensoredName"]
        artistViewURL<-map["artistViewUrl"]
        albumViewURL<-map["collectionViewUrl"]
        artworkURL<-map["artworkUrl100"]
        price<-map["collectionPrice"]
        trackCount<-map["trackCount"]
        collectionPrice<-map["collectionPrice"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func getName() -> String {
        return self.albumName
    }
    
    func getImage() -> String {
        return self.artworkURL
    }
    
    func getPrice() -> Float {
        return self.collectionPrice
    }
    
    func getID() -> Int {
        return self.id
    }
    
    func getNumber() -> String {
        return ""
    }
    
    func getBand() -> String {
        return self.artistName
    }
    
    func getPreview() -> String {
        return ""
    }

}
