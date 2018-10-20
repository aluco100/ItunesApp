//
//  SongStrategy.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import Foundation
import UIKit
import Haneke

class SongStrategy: MusicStrategy {
    func searchBarHeight() -> CGFloat {
        return 0.0
    }
    
    func headerView(item: MusicItem?) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let band = UILabel()
        band.translatesAutoresizingMaskIntoConstraints = false
        band.text = item!.getBand()
        
        let album = UILabel()
        album.translatesAutoresizingMaskIntoConstraints = false
        album.text = item!.getName()
        
        view.addSubview(imageView)
        view.addSubview(band)
        view.addSubview(album)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(16)-[image(70)]-(8)-[album]-|", options: [], metrics: nil, views: ["image" : imageView,"album" : album]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(16)-[image(70)]-(8)-[band]-|", options: [], metrics: nil, views: ["image" : imageView,"band" : band]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(16)-[album]-(5)-[band]-(16)-|", options: [], metrics: nil, views: ["album" : album,"band" : band]))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 1.0))
        view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 70.0))

        imageView.sizeToFit()
        imageView.layoutIfNeeded()
        imageView.hnk_setImage(from: URL(string: item!.getImage())!, placeholder: UIImage(named: "itunes"))

        return view
    }
    
    func cellIdentifier() -> String {
        return "songIdentifier"
    }
    
    func retrieveData(id: Int?, offset: Int, text: String, success: @escaping ([Any]) -> Void, failure: @escaping (Error) -> Void) {
        MusicManager.shared.retrieveSongs(params: [
            "id" : id!,
            "entity" : "song"
            ]).then({
                success($0)
            }).catch(({
                failure($0)
            }))
    }
    
    func itemId(item: MusicItem?) -> Int? {
        return item!.getID()
    }
    
    func noDataMessage() -> String {
        return "No hay canciones para este álbum."
    }
    
    func isPaginable() -> Bool {
        return false
    }
    
    func headerHeight() -> CGFloat {
        return 100.0
    }
}
