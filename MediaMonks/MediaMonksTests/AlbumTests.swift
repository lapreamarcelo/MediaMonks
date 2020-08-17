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
        
    }
    
    override class func tearDown() {
        
    }

    func testAlbumConvert() {
        let singleAlbumResponse = AlbumResponse(userId: 1, id: 1, title: "First album")
        let singleAlbum = singleAlbumResponse.convert()
        
        XCTAssertEqual(singleAlbum.userId, 1)
        XCTAssertEqual(singleAlbum.id, 1)
        XCTAssertEqual(singleAlbum.title, "First album")
    }
}
