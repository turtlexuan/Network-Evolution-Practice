//
//  NetworkClient.swift
//  Network-Evolution-Practice
//
//  Created by urclass on 2017/10/30.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

protocol NetworkClientType {
//    func fetchUsername(completionHandler: @escaping (String?, Error?) -> Void)
    func makeRequest<Request: NetworkRequest>(networkRequest: Request, completionHandler: @escaping (Data?, Error?) -> Void)
}

struct NetworkClient: NetworkClientType {
    
//    func fetchUsername(completionHandler: @escaping (String?, Error?) -> Void) {
//
//        let url = "https://httpbin.org/post"
//        let params = ["param": "turtlexuan"]
//
//        makeRequest(url: url, params: params) { (json, error) in
//
//            if error != nil {
//                completionHandler(nil, error)
//                return
//            }
//
//            if let json = json {
//                let username = json["form"]["param"].string
//                completionHandler(username, nil)
//            }
//        }
//    }
    
    func makeRequest<Request: NetworkRequest>(networkRequest: Request, completionHandler: @escaping (Data?, Error?) -> Void) {
        
        request(networkRequest.url, method: networkRequest.method, parameters: networkRequest.parameters, encoding: networkRequest.encoding, headers: networkRequest.headers).responseJSON { (response) in
            
            if let error = response.error {
                completionHandler(nil, error)
                return
            }
            
            if let data = response.data, response.error == nil {
                completionHandler(data, nil)
            }
        }
    }
}
