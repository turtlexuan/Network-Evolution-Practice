//
//  User.swift
//  Network-Evolution-Practice
//
//  Created by urclass on 2017/10/30.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    
    let name: String
}

extension User: JSONDecodable {
    
    init(json: JSON) throws {
        guard let name = json["json"]["param"].string else { throw JSONError.MissingKey("json.param") }
        self.name = name
    }

}
