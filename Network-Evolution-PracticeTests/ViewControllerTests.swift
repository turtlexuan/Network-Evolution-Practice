//
//  ViewControllerTests.swift
//  Network-Evolution-PracticeTests
//
//  Created by urclass on 2017/10/30.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

@testable import Network_Evolution_Practice
import XCTest
import SwiftyJSON
import PromiseKit

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = ViewController()
    }
}

extension ViewControllerTests {
    
    func testSuccessNetworkResponseShowUsername() {
        viewController.fetchUser = MockSuccessFetchUser()
        viewController.loadViewIfNeeded()
        
        let expectations = expectation(description: "Label set")
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            XCTAssertEqual(self.viewController.label.text, "Username: turtlexuan")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
    func testFailureNetworkResponseShowUsername() {
        viewController.fetchUser = MockFailureFetchUser()
        viewController.loadViewIfNeeded()
        
        let expectations = expectation(description: "Label set")
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            XCTAssertEqual(self.viewController.label.text, "Request failed")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
}

private class MockSuccessFetchUser: FetchUser {
    
    fileprivate override func perform(username: String) -> Promise<User> {
        return Promise(value: User(name: username))
    }
 }

private class MockFailureFetchUser: FetchUser {
    
    fileprivate override func perform(username: String) -> Promise<User> {
        return Promise(error: NSError(domain: "", code: -1, userInfo: nil))
    }
    
}

