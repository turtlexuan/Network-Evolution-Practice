//
//  ViewController.swift
//  NetworkTest
//
//  Created by urclass on 2017/11/1.
//  Copyright © 2017年 turtlexuan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchPost = FetchPost()
        fetchPost.perform().then { (post) in
            print(post)
            }.catch { (error) in
                print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

