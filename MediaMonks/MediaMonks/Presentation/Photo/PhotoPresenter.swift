//
//  PhotoPresenter.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import Foundation

protocol PhotoView {
    func reloadData()
}

protocol PhotoPresenter {
    var album: Album? { get }
    var photos: [Photo] { get }
    var photosBusinessController: PhotosBusinessController { get }
    
    func viewDidLoad()
    func update(view: PhotoView)
}

class PhotoPresenterDefault: PhotoPresenter {
    
    var album: Album?
    var photos: [Photo] = []
    var photosBusinessController: PhotosBusinessController
    
    private var view: PhotoView?
    
    // MARK: - Initialization
    
    required init(photosBusinessController: PhotosBusinessController, album: Album?) {
        self.photosBusinessController = photosBusinessController
        self.album = album
    }
    
    // MARK: - PhotoPresenter
    
    func viewDidLoad() {
        getPhotos()
    }
    
    func update(view: PhotoView) {
        self.view = view
    }
    
    // MARK: - Private
    
    private func getPhotos() {
        guard let album = album else {
            return
        }
        
        photosBusinessController.getPhotosByAlbumID(albumId: album.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                    
                case .success(let photos):
                    self?.photos = photos
                    self?.view?.reloadData()
                }
            }
        }
    }
}
