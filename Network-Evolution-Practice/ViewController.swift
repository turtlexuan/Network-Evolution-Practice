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
    var fetchUser: FetchUser = FetchUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        self.label.text = "Requesting Username..."
        self.view.addSubview(self.label)
        
        self.label.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        
        fetchUser.perform(username: "turtlexuan")
            .then { (user) in
                self.label.text = "Username: " + user.name
            }
            .catch(execute: { (error) in
                self.label.text = "Request failed"
            })
        
//
//        fetchUser.perform(username: "turtlexuan") { (user, error) in
//
//            if error != nil {
//                self.label.text = "Request failed"
//            } else if let user = user {
//                self.label.text = "Username: " + user.name
//            }
//        }
    }
}

