//
//  albumViewControllerTests.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 14/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class albumViewControllerTests: XCTestCase {
    var mView: albumViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let mViewController =
            storyboard.instantiateViewController(
                withIdentifier: "AlbumViewController")
        mView = mViewController
            as! albumViewController
        mView.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAlbumModel(){
        let albums = AlbumModel(albumCover: "m1", albumTitle: "MEDIA")
        XCTAssertEqual(albums.albumCover, "m1")
        XCTAssertEqual(albums.albumTitle, "MEDIA")
    }
    
    func testDataAccess(){
        let dataAccess = DataAccess()
        let data = dataAccess.getAlbums()
        XCTAssertNotNil(data)
        XCTAssertEqual(data[0].albumCover, "m1")
    }
    
    func testAlbumViewModel(){
        let dataAccess = DataAccess()
        let albumViewModelData = AlbumViewModel(dataAccess: dataAccess)
        XCTAssertNotNil(albumViewModelData)
        XCTAssertEqual(albumViewModelData.albumViewModels[0].albumCover, "m1")
    }
}
