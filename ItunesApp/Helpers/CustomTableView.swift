//
//  CustomTableView.swift
//  ItunesApp
//
//  Created by Alfredo Luco on 10/20/18.
//  Copyright © 2018 aluco. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorStyle = .none
        self.estimatedRowHeight = 70.0
        self.rowHeight = UITableView.automaticDimension
    }

}
