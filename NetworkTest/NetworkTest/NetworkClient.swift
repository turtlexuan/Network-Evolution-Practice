//
//  NetworkClient.swift
//  NetworkTest
//
//  Created by urclass on 2017/10/30.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

protocol NetworkClientType {
    func performRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<Data>
}

struct NetworkClient: NetworkClientType {
    
    func performRequest<Request: NetworkRequest>(networkRequest: Request) -> Promise<Data> {
        
        let (promise, fulfill, reject) = Promise<Data>.pending()
        
        request(networkRequest.url,
                method: networkRequest.method,
                parameters: networkRequest.parameters,
                encoding: networkRequest.encoding,
                headers: networkRequest.headers)
            .validate().responseJSON { (response) in
                    
                if let data = response.data, response.error == nil {
                    fulfill(data)
                } else if let error = response.error, let data = response.data {
                    let e = AlamofireErrorHandler.handleNetworkRequestError(error, data: data, urlResponse: response.response)
                    reject(e)
                } else {
                    reject(NetworkRequestError.unknownError)
                }

        }
        
        return promise
    }
}
