//
//  PhotoBusinessController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

typealias PhotosCompletion = (Result<[Photo], MediaMonkError>) -> Void

class PhotosBusinessController {
    
    var photoGateway: PhotoGatewayProtocol
    
    init(photoGateway: PhotoGatewayProtocol) {
        self.photoGateway = photoGateway
    }
    
    func getPhotosByAlbumID(albumId: Int, completion: @escaping PhotosCompletion) {
        photoGateway.getPhotosByAlbumID(albumId: albumId) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let photosResponse):
                completion(.success(photosResponse.map { $0.convert() }))
            }
        }
    }
}
