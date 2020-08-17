//
//  AlbumResponse.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

struct AlbumResponse: Codable {
    let userId: Int
    let id: Int
    let title: String
}

extension AlbumResponse {
    func convert() -> Album {
        return Album(userId: userId, id: id, title: title)
    }
}
