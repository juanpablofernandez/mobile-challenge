//
//  NetworkHelper.swift
//  CodingChallenge
//
//  Created by Juan Pablo on 10/3/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit

class NetworkHelper {
    
    static func getPosts(feature: String, page: Int, completion: @escaping ([Photo]?) -> Void)  {
        
        let key: String = "szYNgvYUQieYgdIKWn2Ctk7M5AsXs7OtaaA1Easa"
        var request = URLRequest(url: URL(string: "https://api.500px.com/v1/photos?feature=\(feature)&consumer_key=\(key)&page=\(page)")!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // Networking error
                print("error=\(error!)")
                return
            }
            
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : AnyObject] {
                    
//                    print(jsonResult)
                    
//                    let currentPage = jsonResult["current_page"] as! Int
//                    let totalPages = jsonResult["total_pages"] as! Int
                    guard let photos = jsonResult["photos"] as? [[String : AnyObject]] else { return }
                    
                    var photoList = [Photo]()
                    
                    for photo in photos {
                        
                        guard let id = photo["id"] as? Int else { return }
                        guard let name = photo["name"] as? String else { return }
                        guard let height = photo["height"] as? Int else { return }
                        guard let width = photo["width"] as? Int else { return }
                        guard let imageUrl = photo["image_url"] as? String else { return }
                        
                        let photo = Photo(id: id, name: name, height: height, width: width, imageUrl: imageUrl)
                        
                        photoList.append(photo)
                    }
                    return completion(photoList)
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
