//
//  AlbumBusinessController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

typealias AlbumsCompletion = (Result<[Album], MediaMonkError>) -> Void

class AlbumBusinessController {
    
    var albumGateway: AlbumGatewayProtocol
    
    init(albumGateway: AlbumGatewayProtocol) {
        self.albumGateway = albumGateway
    }
    
    func getAlbums(completion: @escaping AlbumsCompletion) {
        albumGateway.getAlbums { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let albumResponses):
                completion(.success(albumResponses.map { $0.convert() }))
            }
        }
    }
}
