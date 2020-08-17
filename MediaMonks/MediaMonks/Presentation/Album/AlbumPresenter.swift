//
//  AlbumPresenter.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import Foundation

protocol AlbumView {
    func reloadData()
}

protocol AlbumPresenter {
    var albums: [Album] { get }
    var photosBusinessController: PhotosBusinessController { get }
    
    func viewDidLoad()
    func update(view: AlbumView)
}

class AlbumPresenterDefault: AlbumPresenter {
    
    var albums: [Album] = []
    var photosBusinessController: PhotosBusinessController = PhotosBusinessController(photoGateway: PhotoGateway())
    
    private var view: AlbumView?
    private var albumBusinessController: AlbumBusinessController
    
    // MARK: - Initialization
    
    required init(albumBusinessController: AlbumBusinessController) {
        self.albumBusinessController = albumBusinessController
    }
    
    // MARK: - AlbumPresenter
    
    func viewDidLoad() {
        getAlbums()
    }
    
    func update(view: AlbumView) {
        self.view = view
    }
    
    // MARK: - Private
    
    private func getAlbums() {
        albumBusinessController.getAlbums { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    
                case .success(let albums):
                    self?.albums = albums
                    self?.view?.reloadData()
                }
            }
        }
    }
}
