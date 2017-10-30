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

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "https://httpbin.org/post"
        let params = ["param": "turtlexuan"]
        
        NetworkClient.makeRequest(url: url, params: params) { (json, error) in
            
            if error != nil {
                self.label.text = "Request failed"
            } else if let json = json {
                self.label.text = "Username: " + json["form"]["param"].stringValue
            }
            
        }
    }
}

