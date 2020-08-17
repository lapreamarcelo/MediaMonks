//
//  AlbumViewController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var albumPresenter: AlbumPresenter?
    
    // MARK: - Initialization
    
    init(albumPresenter: AlbumPresenter) {
        super.init(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
        self.albumPresenter = albumPresenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private
}

// MARK: - Extension AlbumView

extension AlbumViewController: AlbumView {
    
}
