//
//  AlbumTableViewCell.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }
    
    func bind(album: Album?) {
        separatorInset = .zero
        titleLabel.text = album?.title
    }
}
