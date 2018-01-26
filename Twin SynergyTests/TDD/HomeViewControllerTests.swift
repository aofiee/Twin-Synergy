//
//  HomeViewController.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class HomeViewControllerTests: XCTestCase {
    var mView: HomeViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let mViewController =
            storyboard.instantiateViewController(
                withIdentifier: "HomeViewController")
        mView = mViewController
            as! HomeViewController
        mView.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMobileModel(){
        let desc = """
                   A simple, highly customisable, data-driven 3D carousel for iOS and Mac OS http://www.charcoaldesign.co.uk/sourc… ...... Swift Example. This example demonstrates how to use iCarousel with Swift instead of Objective-C. Tables Demo. This example demonstrates how to use UITableViews inside your iCarousel item views
                   """
        let mobileModel = MobileModel(mobileCover: "tall1", mobileTitle: "MyHeader", mobileDescription: desc)
        XCTAssertEqual(mobileModel.mobileCover, "tall1")
        XCTAssertEqual(mobileModel.mobileTitle, "MyHeader")
        XCTAssertEqual(mobileModel.mobileDescription, desc)
        XCTAssertNil(mobileModel.storyboardName)
        
        let mobileModel2 = MobileModel(mobileCover: "tall1", mobileTitle: "MyHeader", mobileDescription: desc, storyboardName: "MyStoryboard")
        XCTAssertEqual(mobileModel2.mobileCover, "tall1")
        XCTAssertEqual(mobileModel2.mobileTitle, "MyHeader")
        XCTAssertEqual(mobileModel2.mobileDescription, desc)
        XCTAssertNotNil(mobileModel2.storyboardName)
    }
    
    func testDataAccess(){
        let dataAccess = DataAccess()
        let data = dataAccess.getMobile()
        XCTAssertNotNil(data)
        XCTAssertEqual(data[0].mobileCover,"tall1")
        
        let webData = dataAccess.getWeb()
        XCTAssertNotNil(webData)
        XCTAssertEqual(webData[0].webCover, "land1")
    }
    
    func testMobileViewModel(){
        let dataAccess = DataAccess()
        let mobileViewModelData = MobileViewModel(dataAccess: dataAccess)
        XCTAssertNotNil(mobileViewModelData)
        XCTAssertEqual(mobileViewModelData.mobileViewModels[0].mobileCover, "tall1")
    }
    
    func testWebModel(){
        let desc = """
                   A simple, highly customisable, data-driven 3D carousel for iOS and Mac OS http://www.charcoaldesign.co.uk/sourc… ...... Swift Example. This example demonstrates how to use iCarousel with Swift instead of Objective-C. Tables Demo. This example demonstrates how to use UITableViews inside your iCarousel item views
                   """
        let webModel = WebModel(webCover: "tall1", webTitle: "MyHeader", webDescription: desc)
        XCTAssertEqual(webModel.webCover, "tall1")
        XCTAssertEqual(webModel.webTitle, "MyHeader")
        XCTAssertEqual(webModel.webDescription, desc)
    }
    
    func testWebViewModel(){
        let dataAccess = DataAccess()
        let webViewModelData = WebViewModel(dataAccess: dataAccess)
        XCTAssertNotNil(webViewModelData)
        XCTAssertEqual(webViewModelData.webViewModels[0].webCover, "land1")
    }
    
}
