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

struct NetworkClient {
    
    static func makeRequest(url: String, params: [String: Any], completionHandler: @escaping (JSON?, Error?) -> Void) {
        
        request(url, method: .post, parameters: params).responseJSON { (response) in
            
            if let error = response.error {
                completionHandler(nil, error)
                return
            }
            
            if let jsonData = response.data, response.error == nil {
                let json = JSON(jsonData)
                completionHandler(json, nil)
            }
        }
    }
}
