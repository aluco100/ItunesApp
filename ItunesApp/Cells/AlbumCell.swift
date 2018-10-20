//
//  AlbumCell.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import UIKit
import Haneke

class AlbumCell: UITableViewCell, CellBehavior {

    //MARK: - IBOutlets
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(item: MusicItem){
        self.thumbnailImageView.hnk_setImage(from: URL(string: item.getImage())!, placeholder: UIImage(named: "itunes"))
        self.albumNameLabel.text = item.getName()
    }
    
}
