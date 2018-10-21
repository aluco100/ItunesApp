//
//  SongCell.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell, CellBehavior {

    //MARK: - IBOutlets
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    var item: MusicItem? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.bottomShadow()
        // Initialization code
    }
    
    func setup(item: MusicItem) {
        self.item = item
        self.nameLabel.text = "\(item.getName()) - $\(item.getPrice())"
        self.numberLabel.text = "\(item.getNumber()) - "
        self.playButton.addTarget(self, action: #selector(playSong), for: .touchUpInside)
    }
    
    @objc func playSong(){
        //TODO: Escuchar
        NotificationCenter.default.post(name: Notification.Name("playingSong"), object: nil, userInfo: ["url":self.item!.getPreview()])

    }


}
