//
//  MusicItem.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation

protocol MusicItem {
    func getName()->String
    func getImage()->String
    func getPrice()->Float
    func getID()->Int
    func getNumber()->String
    func getBand()->String
    func getPreview()->String
}
