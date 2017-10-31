//
//  FetchUser.swift
//  Network-Evolution-Practice
//
//  Created by urclass on 2017/10/31.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

class FetchUser: NetworkRequest {
    typealias ResponseType = User
    
    var endPoint: String { return "post" }
    var method: HTTPMethod { return .post }
    var parameters: [String : Any] { return ["param": username]}
    
    private var username: String = ""
    
    func perform(username: String) -> Promise<User> {
        
        self.username = username
        return networkClient.performRequest(networkRequest: self).then(execute: responseHandler)
    }
}
