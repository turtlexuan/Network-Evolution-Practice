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
    func performRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<Data>
}

struct NetworkClient: NetworkClientType {
    
    func performRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<Data> {
        
        let (promise, success, failure) = Promise<Data>.pending()
        
        request(networkRequest.url,
                method: networkRequest.method,
                parameters: networkRequest.parameters,
                encoding: networkRequest.encoding,
                headers: networkRequest.headers).responseJSON { (response) in
            
            if let error = response.error {
                failure(error)
                return
            }
            
            if let data = response.data, response.error == nil {
                success(data)
            }
        }
        
        return promise
    }
}
