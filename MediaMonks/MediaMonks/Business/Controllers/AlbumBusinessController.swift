//
//  AlbumBusinessController.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

class AlbumBusinessController {
    
    var albumGateway: AlbumGatewayProtocol
    
    init(albumGateway: AlbumGatewayProtocol) {
        self.albumGateway = albumGateway
    }
    
    func getAlbums() -> [Album] {
        let albumsResponse = albumGateway.getAlbums()
        
        return albumsResponse.map { $0.convert() }
    }
}
