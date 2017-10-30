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
        viewController.networkClient = MockSuccessNetworkClient()
        viewController.loadViewIfNeeded()
        XCTAssertEqual(viewController.label.text, "Username: turtlexuan")
    }
    
    func testFailureNetworkResponseShowUsername() {
        viewController.networkClient = MockFailureNetworkClient()
        viewController.loadViewIfNeeded()
        XCTAssertEqual(viewController.label.text, "Request failed")
    }
    
}

private struct MockSuccessNetworkClient: NetworkClientType {
    
    fileprivate func makeRequest(url: String, params: [String : Any], completionHandler: @escaping (JSON?, Error?) -> Void) {
        let json = JSON(["form": ["param": "turtlexuan"]])
        completionHandler(json, nil)
    }
}

private struct MockFailureNetworkClient: NetworkClientType {
    
    fileprivate func makeRequest(url: String, params: [String : Any], completionHandler: @escaping (JSON?, Error?) -> Void) {
        completionHandler(nil, NSError(domain: "", code: -1, userInfo: nil))
    }
    
    
}

