//
//  Models.swift
//  CodingChallenge
//
//  Created by Juan Pablo on 10/3/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
//import SwiftyJSON

class Photo {
    
    var id: Int
    var name: String
    var height: Int
    var width: Int
    var imageUrl: String
    var image: UIImage?
    
    init(id: Int, name: String, height: Int, width: Int, imageUrl: String) {
        
        self.id = id
        self.name = name
        self.width = width
        self.height = height
        self.imageUrl = imageUrl
        
    }
    
//    init?(snapshot: JSON) {
//
//        let id = snapshot["id"].intValue
//        let imageTag = snapshot["image_tag"].stringValue
//        let imageUrl = snapshot["image_url"].stringValue
//        let caption = snapshot["caption"].stringValue
//        let message = snapshot["message"].stringValue
//        let hashtags = snapshot["hashtags"].stringValue
//        let author = snapshot["author"].stringValue
//
//        self.id = id
//        self.imageTag = imageTag
//        self.imageUrl = imageUrl
//        self.caption = caption
//        self.message = message
//        self.hashtags = hashtags
//        self.author = author
//    }
}
