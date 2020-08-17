//
//  AlbumGateway.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import Foundation

typealias AlbumsResponseCompletion = (Result<[AlbumResponse], MediaMonkError>) -> Void

protocol AlbumGatewayProtocol {
    func getAlbums(completion: @escaping AlbumsResponseCompletion)
}

class AlbumGateway: AlbumGatewayProtocol {
    
    var baseURL: URL {
        guard let url = Enviroment().urlValue(withKey: .baseURL) else {
            fatalError("Wrong app configuration: Missing base URL!")
        }
        
        return url
    }
    
    func getAlbums(completion: @escaping AlbumsResponseCompletion) {
        guard let url = URL(string: "/albums", relativeTo: baseURL) else {
            completion(.failure(.wrongUrl))
            
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let albumsResponse = try decoder.decode([AlbumResponse].self, from: dataResponse)
                completion(.success(albumsResponse))
            } catch let parsingError {
                print(parsingError)
            }
        }
        
        task.resume()
    }
}
