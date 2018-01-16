//
//  MapViewControllerTests.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 13/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class MapViewControllerTests: XCTestCase {
    var mView: mapViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let mViewController =
            storyboard.instantiateViewController(
                withIdentifier: "MapStoryboard")
        mView = mViewController
            as! mapViewController
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
    
    func testMapModel(){
        let map = MapModel(placeName: "Twin Synergy Co., Ltd.", address: "1-3 Soi Rama 9 60" ,lat: 100.000, lng: 13.000)
        XCTAssertEqual(map.placeName, "Twin Synergy Co., Ltd.")
        XCTAssertEqual(map.address, "1-3 Soi Rama 9 60")
        XCTAssertEqual(map.lat, 100.000)
        XCTAssertEqual(map.lng, 13.000)
    }
    
    func testMapViewModel(){
        let mapViewMode = MapViewModel(map: MapModel(placeName: "Twin Synergy Co., Ltd.", address: "1-3 Soi Rama 9 60" ,lat: 100.000, lng: 13.000))
        XCTAssertEqual(mapViewMode.placeName, "Twin Synergy Co., Ltd.")
        XCTAssertEqual(mapViewMode.address, "1-3 Soi Rama 9 60")
        XCTAssertEqual(mapViewMode.lat, 100.000)
        XCTAssertEqual(mapViewMode.lng, 13.000)
    }
    
}
