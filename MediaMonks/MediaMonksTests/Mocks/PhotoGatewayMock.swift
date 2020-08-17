//
//  PhotoGatewayMock.swift
//  MediaMonksTests
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

@testable import MediaMonks

class PhotoGatewayMock: PhotoGatewayProtocol {
        
    var photosMocked: [PhotoResponse] = []
    
    init(photosMocked: [PhotoResponse]) {
        self.photosMocked = photosMocked
    }
    
    func getPhotosByAlbumID(albumId: Int, completion: @escaping PhotosResponseCompletion) {
        completion(.success(photosMocked))
    }
}

