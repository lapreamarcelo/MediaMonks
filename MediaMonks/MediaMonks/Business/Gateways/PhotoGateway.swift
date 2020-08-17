//
//  PhotoGateway.swift
//  MediaMonks
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import Foundation

typealias PhotosResponseCompletion = (Result<[PhotoResponse], MediaMonkError>) -> Void

protocol PhotoGatewayProtocol {
    func getPhotosByAlbumID(albumId: Int, completion: @escaping PhotosResponseCompletion)
//    func getAlbums(completion: @escaping AlbumsResponseCompletion)
}

class PhotoGateway: PhotoGatewayProtocol {
    
    var baseURL: URL {
        guard let url = Enviroment().urlValue(withKey: .baseURL) else {
            fatalError("Wrong app configuration: Missing base URL!")
        }
        
        return url
    }
    
    func getPhotosByAlbumID(albumId: Int, completion: @escaping PhotosResponseCompletion) {
        let albumId = String(albumId)
        
        guard let url = URL(string: "/photos?albumId=\(albumId)", relativeTo: baseURL) else {
            completion(.failure(.wrongUrl))
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                completion(.failure(.unknownError))
                
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photosResponse = try decoder.decode([PhotoResponse].self, from: dataResponse)
                completion(.success(photosResponse))
            } catch let parsingError {
                print(parsingError)
            }
        }
        
        task.resume()
    }
}
