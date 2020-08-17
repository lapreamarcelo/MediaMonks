//
//  PhotoResponse.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

struct PhotoResponse: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

extension PhotoResponse {
    func convert() -> Photo {
        return Photo(albumId: albumId, id: id, title: title, url: url, thumbnailUrl: thumbnailUrl)
    }
}
