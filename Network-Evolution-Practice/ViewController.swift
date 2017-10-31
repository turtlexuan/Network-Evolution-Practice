//
//  ViewController.swift
//  Network-Evolution-Practice
//
//  Created by urclass on 2017/10/30.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SnapKit

class ViewController: UIViewController {

    var label = UILabel()
    var networkClient: NetworkClientType = NetworkClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        self.label.text = "Requesting Username..."
        self.view.addSubview(self.label)
        
        self.label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
//        networkClient.fetchUsername { (username, error) in
//
//            if error != nil {
//                self.label.text = "Request failed"
//            } else if let username = username {
//                self.label.text = "Username: " + username
//            }
//
//        }
        
        let url = "https://httpbin.org/post"
        let params = ["param": "turtlexuan"]
        
        networkClient.makeRequest(url: url, params: params) { (user: User?, error) in
            
            if error != nil {
                self.label.text = "Request failed"
            } else if let user = user {
                self.label.text = "Username: " + user.name
            }
        }

//        networkClient.makeRequest(url: url, params: params) { (json, error) in
//
//            if error != nil {
//                self.label.text = "Request failed"
//            } else if let json = json {
//                self.label.text = "Username: " + json["form"]["param"].stringValue
//            }
//
//        }
    }
}

