//
//  AlbumTests.swift
//  MediaMonksTests
//
//  Created by Marcelo Laprea on 17/08/2020.
//  Copyright © 2020 Marcelo Laprea. All rights reserved.
//

import XCTest
@testable import MediaMonks

class AlbumTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }

    func testAlbumConvert() {
        let singleAlbumResponse = AlbumResponse(userId: 1, id: 1, title: "First album")
        let singleAlbum = singleAlbumResponse.convert()
        
        XCTAssertEqual(singleAlbum.userId, 1)
        XCTAssertEqual(singleAlbum.id, 1)
        XCTAssertEqual(singleAlbum.title, "First album")
    }
    
    func testEmptyAlbums() {
        let albumBusinessController = AlbumBusinessController(albumGateway: AlbumGatewayMock(albumsMocked: []))
        let albums = albumBusinessController.getAlbums()
        
        XCTAssertEqual(albums.count, 0)
    }
    
    func testTwoAlbums() {
        let albumBusinessController = AlbumBusinessController(albumGateway: AlbumGatewayMock(albumsMocked:
            [AlbumResponse(userId: 1, id: 1, title: "First album"),
             AlbumResponse(userId: 2, id: 2, title: "Second album")]))
        
        let albums = albumBusinessController.getAlbums()
        
        XCTAssertEqual(albums.count, 2)
        XCTAssertEqual(albums[1].id, 2)
    }
}
