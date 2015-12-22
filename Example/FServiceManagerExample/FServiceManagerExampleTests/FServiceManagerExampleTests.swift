//
//  FServiceManagerExampleTests.swift
//  FServiceManagerExampleTests
//
//  Created by huchunbo on 15/12/22.
//  Copyright © 2015年 Bijiabo. All rights reserved.
//

import XCTest
@testable import FServiceManagerExample
import FServiceManager

class FServiceManagerExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        FConfiguration.sharedInstance.host = "http://192.168.31.200:3000/"
        
    }
    
    // MARK: - test log in
    
    func testLogIn_success() {
        let expectation = expectationWithDescription("test log in success")
        var successResult: Bool = false
        
        FAction.login("admin@admin.com", password: "password") { (success, description) -> Void in
            successResult = success
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            XCTAssert(successResult)
        }
    }
    
    func testLogIn_unsuccess() {
        let expectation = expectationWithDescription("test log in unsuccess")
        var successResult: Bool = false
        
        FAction.login("xxx@xxx.com", password: "xxxxxx") { (success, description) -> Void in
            successResult = success
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            XCTAssertFalse(successResult)
        }
    }
    
    // MARK: - test register
    func testRegister() {
        let expectation = expectationWithDescription("test register")
        var successResult: Bool = false
        
        FAction.register("bijiabo+FTest\(getCurrentShortDate())@gmail.com", name: "TestUser\(getCurrentShortDate())", password: "password") { (success, description) -> Void in

            successResult = success
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            XCTAssert(successResult)
        }
    }
    
    // MARK: - check login state
    
    func testCheckLogin() {
        let expectation = expectationWithDescription("test check login")
        var isLogin: Bool = false
        
        FAction.login("admin@admin.com", password: "password") { (success, description) -> Void in
            if success {
                FAction.checkLogin { (success, description) -> Void in
                    isLogin = success
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            XCTAssertNil(error)
            XCTAssert(isLogin)
        }
    }
    
    // MARK: - Flux module
    
    func testGetFluxesList() {
        let expectation = expectationWithDescription("test check login")
        var list: JSON = JSON(Array<JSON>())
        
        FAction.fluxes.list { (request, response, json, error) -> Void in
            list = json
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            XCTAssert(list.count>0)
        }
    }
    
    // MARK: - tool func
    func getCurrentShortDate() -> String {
        let todaysDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd_MM_yyyy_ss_hh_mm"
        let DateInFormat = dateFormatter.stringFromDate(todaysDate)
        print(DateInFormat)
        return DateInFormat
    }
    
}
