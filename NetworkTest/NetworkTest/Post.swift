//
//  Post.swift
//  NetworkTest
//
//  Created by urclass on 2017/11/1.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation

struct Post {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

extension Post: Decodable {
    
    enum JSONKeys: String, CodingKey {
        case json
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id
        case title
        case body
    }

    init(from decoder: Decoder) throws {
        
        let json = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try json.decode(Int.self, forKey: .userId)
        self.id = try json.decode(Int.self, forKey: .id)
        self.title = try json.decode(String.self, forKey: .title)
        self.body = try json.decode(String.self, forKey: .body)
    }
}

