//
//  NetworkRequest.swift
//  Network-Evolution-Practice
//
//  Created by urclass on 2017/10/31.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkRequest {
    associatedtype ResponseType
    
    // Required
    var endPoint: String { get }
    var responseHandler: (Data) -> ResponseType? { get }
    
    // Optional
    var baseURL: String { get }
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding { get }
    
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
    
    var networkClient: NetworkClientType { get }
}

extension NetworkRequest {
    
    var url: String { return baseURL + endPoint }
    var baseURL: String { return "https://httpbin.org/" }
    var method: Alamofire.HTTPMethod { return .get }
    var encoding: Alamofire.ParameterEncoding { return method == .get ? URLEncoding.default : JSONEncoding.default }
    
    var parameters: [String: Any] { return [:] }
    var headers: [String: String] { return [:] }
    
    var networkClient: NetworkClientType { return NetworkClient() }
}

extension NetworkRequest where ResponseType: JSONDecodable {
    var responseHandler: (Data) -> ResponseType? { return jsonResponseHandler }
}

private func jsonResponseHandler<Response: JSONDecodable>(data: Data) -> Response? {
    let json = JSON(data: data)
    return Response(json: json)
}
