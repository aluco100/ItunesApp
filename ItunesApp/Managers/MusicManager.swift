//
//  MusicManager.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import Promise

class MusicManager {
    
    //MARK: - Singleton
    
    class var shared: MusicManager {
        struct Static {
            static let instance = MusicManager()
        }
        return Static.instance
    }
    
    //MARK: - Retrieve items
    public func retrieveAlbums(params: [String : Any])->Promise<[Album]>{
        return Promise<[Album]>(work: {fulfill,reject in
            Alamofire.request("https://itunes.apple.com/search", method: .get, parameters: params).validate(statusCode: 200..<300).responseJSON(completionHandler: { response in
                guard response.error == nil else{
                    reject(response.error!)
                    return
                }
                var albums: [Album] = []
                if let dict = response.result.value as? [String : Any]{
                    if let array = dict["results"] as? NSArray{
                        for item in array{
                            let mapper = Mapper<Album>()
                            if let mapValue = mapper.map(JSON: item as! [String : Any]){
                                albums.append(mapValue)
                            }
                        }
                        fulfill(albums)
                    }
                }
            })
        })
    }
    
    //MARK: - Retrieve items
    public func retrieveSongs(params: [String : Any])->Promise<[Song]>{
        return Promise<[Song]>(work: {fulfill,reject in
            Alamofire.request("https://itunes.apple.com/lookup", method: .get, parameters: params).validate(statusCode: 200..<300).responseJSON(completionHandler: { response in
                guard response.error == nil else{
                    reject(response.error!)
                    return
                }
                var songs: [Song] = []
                if let dict = response.result.value as? [String : Any]{
                    if let array = dict["results"] as? NSArray{
                        for item in array{
                            let mapper = Mapper<Song>()
                            if let mapValue = mapper.map(JSON: item as! [String : Any]){
                                songs.append(mapValue)
                            }
                        }
                        fulfill(songs)
                    }
                }
            })
        })
    }
    
}
