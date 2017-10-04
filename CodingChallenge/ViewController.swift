//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Juan Pablo on 10/3/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkHelper.getPosts(feature: "popular", page: 1) { (photos) in
            print(photos?.count)
        }
    }
}

