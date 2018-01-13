//
//  ProfileViewControllerTest.swift
//  Twin SynergyTests
//
//  Created by SkullTree on 10/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import XCTest
@testable import Twin_Synergy
class ProfileViewControllerTest: XCTestCase {
    var mView: ProfileViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let mViewController =
            storyboard.instantiateViewController(
                withIdentifier: "ProfileViewController")
        mView = mViewController
            as! ProfileViewController
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
    
    func testProfileViewModel(){
        let profile = ProfileViewModel(mProfile: ProfileModel(address: "aaa", telephone: "bbb", email: "ccc@ccc.com"))
        XCTAssertEqual(profile.address, "aaa")
        XCTAssertEqual(profile.telephone, "bbb")
        XCTAssertEqual(profile.email, "ccc@ccc.com")
        XCTAssertNotNil(profile.contactTelephoneNumber, "contactTelephoneNumber not nil")
        XCTAssertNotNil(profile.emailDetail, "emailDetail not nil")
        XCTAssertNotNil(profile.emailTo, "emailTo not nil")
        XCTAssertNotNil(profile.titleEmail, "titleEmail not nil")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        guard emailTest.evaluate(with: profile.email) else {
            XCTFail()
            return
        }
    }
        
    func test_AddressLabelNotNil(){
        XCTAssertNotNil(mView.addressLabel)
    }
    
    func test_TelephoneLabelNotNil(){
        XCTAssertNotNil(mView.telephoneLabel)
    }
    
    func test_EmailLabelNotNil(){
        XCTAssertNotNil(mView.emailMeLabel)
    }
    
    func test_AddressAction(){
        guard (mView.addressLabel.gestureRecognizers != nil) else { XCTFail(); return }
    }
    
    func test_AddressTapped(){
        mView.performSelector(onMainThread: #selector(mView.mapHandleTap(sender:)), with: mView.addressLabel.gestureRecognizers?.first, waitUntilDone: true)
    }
    
    func test_TelephoneAction(){
        guard (mView.telephoneLabel.gestureRecognizers != nil) else { XCTFail(); return }
    }
    
    func test_TelephoneTapped(){
        mView.performSelector(onMainThread: #selector(mView.telephoneHandleTap(sender:)), with: mView.telephoneLabel.gestureRecognizers?.first, waitUntilDone: true)
    }
    
    func test_EmailAction(){
        guard (mView.emailMeLabel.gestureRecognizers != nil) else {
            XCTFail()
            return
        }
    }
    
    func test_EmailTapped(){
        mView.performSelector(onMainThread: #selector(mView.emailHandleTap(sender:)), with: mView.emailMeLabel.gestureRecognizers?.first, waitUntilDone: true)
    }

}

