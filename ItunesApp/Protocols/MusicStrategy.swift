//
//  MusicStrategy.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation
import UIKit
protocol MusicStrategy {
    func searchBarHeight()->CGFloat
    func headerView(item: MusicItem?)->UIView?
    func cellIdentifier()->String
    func retrieveData(id: Int?,offset: Int,text: String,success: @escaping (_ data: [Any])->Void, failure: @escaping (_ error: Error)->Void)
    func itemId(item: MusicItem?)->Int?
    func noDataMessage()->String
    func isPaginable()->Bool
    func headerHeight()->CGFloat
}
