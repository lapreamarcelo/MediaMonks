//
//  AlbumGatewayMock.swift
//  MediaMonksTests
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

@testable import MediaMonks

class AlbumGatewayMock: AlbumGatewayProtocol {
        
    var albumsMocked: [AlbumResponse] = []
    
    init(albumsMocked: [AlbumResponse]) {
        self.albumsMocked = albumsMocked
    }
    
    func getAlbums(completion: @escaping AlbumsResponseCompletion) {
        completion(.success(albumsMocked))
    }
}
