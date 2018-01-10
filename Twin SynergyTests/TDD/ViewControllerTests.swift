//
//  ViewControllerTests.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 10/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class ViewControllerTests: XCTestCase {
    var mView: ViewController!
    
    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let mViewController =
            storyboard.instantiateViewController(
                withIdentifier: "mViewController")
        mView = mViewController
            as! ViewController
        
        
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
    
}
