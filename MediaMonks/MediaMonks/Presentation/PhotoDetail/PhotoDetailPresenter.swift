//
//  PhotoDetailPresenter.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import Foundation

protocol PhotoDetailView {

}

protocol PhotoDetailPresenter {
    var photo: Photo { get }
    
    func viewDidLoad()
    func update(view: PhotoDetailView)
}

class PhotoDetailPresenterDefault: PhotoDetailPresenter {

    var photo: Photo
    
    private var view: PhotoDetailView?
    private var photosBusinessController: PhotosBusinessController
    
    // MARK: - Initialization
    
    required init(photosBusinessController: PhotosBusinessController, photo: Photo) {
        self.photosBusinessController = photosBusinessController
        self.photo = photo
    }
    
    // MARK: - PhotoDeatilPresenter
    
    func viewDidLoad() {
    }
    
    func update(view: PhotoDetailView) {
        self.view = view
    }
    
    // MARK: - Private

}

