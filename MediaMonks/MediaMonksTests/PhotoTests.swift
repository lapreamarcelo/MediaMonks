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
}
