//
//  Song.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Song: Object, Mappable, MusicItem {
//    "wrapperType": "track",
//    "kind": "song",
//    "artistId": "112018",
//    "collectionId": 706008781,
//    "trackId": 706008816,
//    "artistName": "Nirvana",
//    "collectionName": "In Utero (20th Anniversary) [Remastered]",
//    "trackName": "Heart-Shaped Box",
//    "collectionCensoredName": "In Utero (20th Anniversary) [Remastered]",
//    "trackCensoredName": "Heart-Shaped Box",
//    "artistViewUrl": "https://itunes.apple.com/us/artist/nirvana/112018?uo=4",
//    "collectionViewUrl": "https://itunes.apple.com/us/album/heart-shaped-box/706008781?i=706008816&uo=4",
//    "trackViewUrl": "https://itunes.apple.com/us/album/heart-shaped-box/706008781?i=706008816&uo=4",
//    "previewUrl": "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/c7/45/42/c745429d-1cb8-d91d-5c5f-8f04cabd665c/mzaf_9171587916416181235.plus.aac.p.m4a",
//    "artworkUrl30": "https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/59/aa/71/59aa711b-6c74-5a8b-c6ac-8fc9a4a66069/source/30x30bb.jpg",
//    "artworkUrl60": "https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/59/aa/71/59aa711b-6c74-5a8b-c6ac-8fc9a4a66069/source/60x60bb.jpg",
//    "artworkUrl100": "https://is2-ssl.mzstatic.com/image/thumb/Music4/v4/59/aa/71/59aa711b-6c74-5a8b-c6ac-8fc9a4a66069/source/100x100bb.jpg",
//    "collectionPrice": 9.99,
//    "trackPrice": 1.29,
//    "releaseDate": "1993-08-30T07:00:00Z",
//    "collectionExplicitness": "notExplicit",
//    "trackExplicitness": "notExplicit",
//    "discCount": 1,
//    "discNumber": 1,
//    "trackCount": 12,
//    "trackNumber": 3,
//    "trackTimeMillis": 281093,
//    "country": "USA",
//    "currency": "USD",
//    "primaryGenreName": "Alternative",
//    "isStreamable": true
    
    //MARK: - Properties
    @objc dynamic var wrapperType: String = ""
    @objc dynamic var kind: String = ""
    @objc dynamic var artistId: String = ""
    @objc dynamic var collectionId: Int = 0
    @objc dynamic var trackId: Int = 0
    @objc dynamic var artistName: String = ""
    @objc dynamic var collectionName: String = ""
    @objc dynamic var trackName: String = ""
    @objc dynamic var collectionCensoredName: String = ""
    @objc dynamic var trackCensoredName: String = ""
    @objc dynamic var artistViewUrl: String = ""
    @objc dynamic var collectionViewUrl: String = ""
    @objc dynamic var trackViewUrl: String = ""
    @objc dynamic var previewUrl: String = ""
    @objc dynamic var artworkUrl100: String = ""
    @objc dynamic var collectionPrice: Float = 0.0
    @objc dynamic var trackPrice: Float = 0.0
    @objc dynamic var trackCount: Int = 0
    @objc dynamic var trackNumber: Int = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        wrapperType<-map["wrapperType"]
        kind<-map["kind"]
        artistId<-map["artistId"]
        collectionId<-map["collectionId"]
        trackId<-map["trackId"]
        artistName<-map["artistName"]
        collectionName<-map["collectionName"]
        trackName<-map["trackName"]
        collectionCensoredName<-map["collectionCensoredName"]
        trackCensoredName<-map["trackCensoredName"]
        artistViewUrl<-map["artistViewUrl"]
        collectionViewUrl<-map["collectionViewUrl"]
        trackViewUrl<-map["trackViewUrl"]
        previewUrl<-map["previewUrl"]
        artworkUrl100<-map["artworkUrl100"]
        collectionPrice<-map["collectionPrice"]
        trackPrice<-map["trackPrice"]
        trackCount<-map["trackCount"]
        trackNumber<-map["trackNumber"]
    }
    
    override static func primaryKey() -> String? {
        return "trackId"
    }
    
    func getImage() -> String {
        return self.artworkUrl100
    }
    
    func getName() -> String {
        return self.trackName
    }
    
    func getPrice() -> Float {
        return self.collectionPrice
    }
    
    func getID() -> Int {
        return self.trackId
    }
    
    func getNumber() -> String {
        return "\(self.trackNumber)"
    }
    
    func getBand() -> String {
        return self.artistName
    }
    
    func getPreview() -> String {
        return self.previewUrl
    }
}
