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
        XCTAssertEqual(viewController.label.text, "Username: turtlexuan")
    }
    
    func testFailureNetworkResponseShowUsername() {
        viewController.fetchUser = MockFailureFetchUser()
        viewController.loadViewIfNeeded()
        XCTAssertEqual(viewController.label.text, "Request failed")
    }
    
}

private class MockSuccessFetchUser: FetchUser {
    
    fileprivate override func perform(username: String, completionHandler: @escaping (User?, Error?) -> Void) {
        let user = User(name: username)
        completionHandler(user, nil)
    }
 }

private class MockFailureFetchUser: FetchUser {
    
    fileprivate override func perform(username: String, completionHandler: @escaping (User?, Error?) -> Void) {
        completionHandler(nil, NSError(domain: "", code: -1, userInfo: nil))
    }
    
}

