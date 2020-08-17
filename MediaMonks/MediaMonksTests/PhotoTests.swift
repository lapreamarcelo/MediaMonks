//
//  PhotoTests.swift
//  MediaMonksTests
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import XCTest
@testable import MediaMonks

class PhotoTests: XCTestCase {

    override func setUp() {
        
    }
    
    override class func tearDown() {
        
    }

    func testAlbumConvert() {
        let singlePhotoResponse = PhotoResponse(albumId: 1, id: 1, title: "First photo", url: "url", thumbnailUrl: "url")
        let singlePhoto = singlePhotoResponse.convert()
        
        XCTAssertEqual(singlePhoto.albumId, 1)
        XCTAssertEqual(singlePhoto.id, 1)
        XCTAssertEqual(singlePhoto.title, "First photo")
        XCTAssertEqual(singlePhoto.url, "url")
        XCTAssertEqual(singlePhoto.thumbnailUrl, "url")
    }
    
    func testEmptyPhotos() {
        let photoBusinessController = PhotosBusinessController(photoGateway: PhotoGatewayMock(photosMocked: []))
        
        photoBusinessController.getPhotosByAlbumID(albumId: 1) { result in
            switch result {
            case .failure(_):
                break
                
            case .success(let photos):
                XCTAssertEqual(photos.count, 0)
            }
        }
    }
    
    func testTwoPhotos() {
        let photoBusinessController = PhotosBusinessController(photoGateway: PhotoGatewayMock(photosMocked: [
            PhotoResponse(albumId: 1, id: 1, title: "First photo", url: "url", thumbnailUrl: "url"),
            PhotoResponse(albumId: 2, id: 2, title: "Second photo", url: "url", thumbnailUrl: "url")]))
        
        photoBusinessController.getPhotosByAlbumID(albumId: 1) { result in
            switch result {
            case .failure(_):
                break
                
            case .success(let photos):
                XCTAssertEqual(photos.count, 2)
                XCTAssertEqual(photos[1].albumId, 2)
            }
        }
    }
}
