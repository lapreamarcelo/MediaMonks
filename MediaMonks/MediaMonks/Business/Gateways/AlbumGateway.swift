//
//  AlbumGateway.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

protocol AlbumGatewayProtocol {
    func getAlbums() -> [AlbumResponse]
}

class AlbumGateway: AlbumGatewayProtocol {
    
    func getAlbums() -> [AlbumResponse] {
        return []
    }
    
}
