//
//  StrategyContext.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation

class StrategyContext {
    
    
    func strategy(isAlbum: Bool)->MusicStrategy{
        if(isAlbum){
            return AlbumStrategy()
        }
        return SongStrategy()
    }
}
