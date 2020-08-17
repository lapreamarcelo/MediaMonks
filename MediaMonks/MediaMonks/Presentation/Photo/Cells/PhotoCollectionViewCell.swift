//
//  PhotoCollectionViewCell.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func bind(photo: Photo?) {
        if let imagePath = photo?.thumbnailUrl, let imageURL = URL(string: imagePath) {
            imageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "empty_image"))
        }
    }
}
