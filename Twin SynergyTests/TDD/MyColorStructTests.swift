//
//  MyColorStruct.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 9/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class MyColorStructTests: XCTestCase {
    let myColor = MyColorStruct(basedColor: "#FF8A00", basedBarColor: "#356A97", secondBarColor: "#17274E", titleColor: "#FFFFFF")
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
    
    func testBasedColor(){
        XCTAssertEqual(myColor.basedColor, "#FF8A00", "should set #FF8A00")
    }
    
    func testBasedBarColor(){
        XCTAssertEqual(myColor.basedBarColor, "#356A97", "should set #356A97")
    }
    func testSecondBarColor(){
        XCTAssertEqual(myColor.secondBarColor, "#17274E", "should set #17274E")
    }
    func testTitleColor(){
        XCTAssertEqual(myColor.titleColor, "#FFFFFF", "should set #FFFFFF")
    }
    func testHexToUIColor(){
        let myUIColor = myColor.hexStringToUIColor(hex: "#FFFFFF")
        let myUIColor2 = myColor.hexStringToUIColor(hex: "#FFFFFF")
        XCTAssertEqual(myUIColor, myUIColor2,"Test Same Color")
    }
}
