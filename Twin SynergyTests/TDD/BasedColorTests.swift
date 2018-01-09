//
//  BasedColorTests.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 9/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class BasedColorTests: XCTestCase {
    let basedColor = BasedColor()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func hexStringToUIColor2_Test(){
        let colorTest = basedColor.hexStringToUIColor2(hex: "#FFFFFF")
        print(colorTest)
        XCTAssertEqual(UIColor.red, UIColor.black,"Test Hex Color To UIColor")
    }
    
}
