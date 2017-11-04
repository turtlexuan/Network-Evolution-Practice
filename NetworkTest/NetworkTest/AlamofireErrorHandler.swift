//
//  AlamofireErrorHandler.swift
//  NetworkTest
//
//  Created by urclass on 2017/11/2.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireErrorHandler {
    
    class func handleNetworkRequestError(_ error: Error, data: Data?, urlResponse: HTTPURLResponse?) -> Error {
        
        if (error as NSError).code == -1009 {
            return NetworkRequestError.noNetwork
        } else {
            
            let errorInfo = RequestErrorInformation(error: error, data: data, urlResponse: urlResponse)
            let e = NetworkRequestError.requestFailed(information: errorInfo)
            
            return e as Error
            
        }
        
    }
    
}
