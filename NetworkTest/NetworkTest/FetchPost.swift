//
//  FetchPost.swift
//  NetworkTest
//
//  Created by urclass on 2017/11/1.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class FetchPost: NetworkRequest {
    
    typealias ResponseType = [Post]
    
    var endPoint: String { return "posts" }
    var method: HTTPMethod { return .get }
    
    func perform() -> Promise<ResponseType> {
        
        return networkClient.performRequest(networkRequest: self).then(execute: responseHandler)
    }

}

