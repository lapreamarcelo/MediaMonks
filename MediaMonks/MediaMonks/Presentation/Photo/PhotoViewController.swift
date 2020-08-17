//
//  PhotoViewController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var photoPresenter: PhotoPresenter?
    
    // MARK: - Initialization
        
    init(photoPresenter: PhotoPresenter) {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        self.photoPresenter = photoPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoPresenter?.update(view: self)
        photoPresenter?.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        title = "Photos"
    }
}

// MARK: - Extension AlbumView

extension PhotoViewController: PhotoView {
    
    func reloadData() {
    }
    
}
