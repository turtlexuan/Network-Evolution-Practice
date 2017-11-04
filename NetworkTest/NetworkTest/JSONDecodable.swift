//
//  JSONDecodable.swift
//  NetworkTest
//
//  Created by urclass on 2017/10/30.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONDecodable {
    
    init(json: JSON) throws
    
}
