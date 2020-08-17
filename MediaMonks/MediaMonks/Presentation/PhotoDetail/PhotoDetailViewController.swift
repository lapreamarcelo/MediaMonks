//
//  PhotoDetailViewController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {

    @IBOutlet private  var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    
    var photoDetailPresenter: PhotoDetailPresenter?
    
    // MARK: - Initialization
        
    init(photoDetailPresenter: PhotoDetailPresenter) {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        self.photoDetailPresenter = photoDetailPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoDetailPresenter?.update(view: self)
        photoDetailPresenter?.viewDidLoad()
        
        setup()
    }

    // MARK: - Private
    
    private func setup() {
        title = "Photo detail"
        
        let photo = photoDetailPresenter?.photo
        
        titleLabel.text = photo?.title
        
        if let imagePath = photo?.url, let imageURL = URL(string: imagePath) {
            imageView.kf.setImage(with: imageURL, placeholder: UIImage(named: "empty_image"))
        }
        
        imageView.layer.cornerRadius = 5
    }
}

// MARK: - Extension PhotoView

extension PhotoDetailViewController: PhotoDetailView {
        
}
