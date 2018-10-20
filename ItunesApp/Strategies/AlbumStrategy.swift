//
//  AlbumStrategy.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation
import UIKit

class AlbumStrategy: MusicStrategy {
    func searchBarHeight() -> CGFloat {
        return 50.0
    }
    
    func headerView(item: MusicItem?) -> UIView? {
        return nil
    }
    
    func cellIdentifier() -> String {
        return "albumIdentifier"
    }
    
    func retrieveData(id: Int?,offset: Int, text: String, success: @escaping ([Any]) -> Void, failure: @escaping (Error) -> Void) {
        MusicManager.shared.retrieveAlbums(params: [
            "term" : text,
            "offset" : offset,
            "entity" : "album",
            "mediaType" : "music",
            "limit" : 20
            ]).then({
                success($0)
            }).catch({
                failure($0)
            })
    }
    
    func itemId(item: MusicItem?) -> Int? {
        return nil
    }
    
    func noDataMessage() -> String {
        return "No hay resultados"
    }
    
    func isPaginable() -> Bool {
        return true
    }
    
    func headerHeight() -> CGFloat {
        return 0.0
    }
   
}
