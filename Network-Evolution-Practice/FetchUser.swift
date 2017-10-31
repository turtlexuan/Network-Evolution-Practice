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

class FetchUser: NetworkRequest {
    typealias ResponseType = User
    
    var endPoint: String { return "post" }
    var method: HTTPMethod { return .post }
    var parameters: [String : Any] { return ["param": username]}
    
    private var username: String = ""
    
    func perform(username: String, completionHandler: @escaping (User?, Error?) -> Void) {
        
        self.username = username
        let parseCallback = { (data: Data?, error: Error?) in
            
            let response = data.flatMap(self.responseHandler)
            completionHandler(response, error)
        }
        
        networkClient.makeRequest(networkRequest: self, completionHandler: parseCallback)
    }
}
