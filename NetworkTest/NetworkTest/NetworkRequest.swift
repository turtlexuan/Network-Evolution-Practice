//
//  NetworkRequest.swift
//  NetworkTest
//
//  Created by urclass on 2017/10/31.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkRequestError: Error {
    case decodingError(error: DecodingError)
    case jsonParsingError(error: Error)
    case requestFailed(information: RequestErrorInformation)
    case unknownError
    case noNetwork
}

protocol NetworkRequest {
    associatedtype ResponseType
    
    // Required
    var endPoint: String { get }
    var responseHandler: (Data) throws -> ResponseType { get }
    
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
    var baseURL: String { return "https://jsonplaceholder.typicode.com/" }
    var method: Alamofire.HTTPMethod { return .get }
    var encoding: Alamofire.ParameterEncoding { return method == .get ? URLEncoding.default : JSONEncoding.default }
    
    var parameters: [String: Any] { return [:] }
    var headers: [String: String] { return [:] }
    
    var networkClient: NetworkClientType { return NetworkClient() }
}

extension NetworkRequest where ResponseType: Decodable {
    var responseHandler: (Data) throws -> ResponseType { return decodableResponseHandler }
}

private func decodableResponseHandler<Response: Decodable>(_ data: Data) throws -> Response {
    let jsonDecoder = JSONDecoder()
    do {
        return try jsonDecoder.decode(Response.self, from: data)
    } catch let e as DecodingError {
        throw NetworkRequestError.decodingError(error: e)
    }
}
