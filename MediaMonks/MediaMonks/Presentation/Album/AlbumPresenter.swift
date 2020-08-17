//
//  AlbumPresenter.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

protocol AlbumView {
    
}

protocol AlbumPresenter {
    func viewDidLoad()
    func update(view: AlbumView)
}

class AlbumPresenterDefault: AlbumPresenter {
    
    private var view: AlbumView?
    private var albumBusinessController: AlbumBusinessController
    
    // MARK: - Initialization
    
    required init(albumBusinessController: AlbumBusinessController) {
        self.albumBusinessController = albumBusinessController
    }
    
    // MARK: - Lifecycle
    
    func viewDidLoad() {
        albumBusinessController.getAlbums { (result) in
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let albums):
                print(albums)
            }
        }
    }
    
    func update(view: AlbumView) {
        self.view = view
    }
    
    // MARK: - AlbumPresenter
    
    // MARK: - Private
}
