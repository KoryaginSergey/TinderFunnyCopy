//
//  PostServices.swift
//  TinderFunnyCopy
//
//  Created by macuser on 18.10.2021.
//

import Foundation
import Alamofire


struct PostServices {
  
  static let shared = PostServices()
  
  
  
  
  let urlString: URL = URL(string: "https://randomuser.me/api/?page=3&results=10&seed=abc")!
  
//  https://habr.com/ru/post/330760/
  
  
  
  //  let realURL: URL = URL(string: "https://google.com")!
  //
  //  let url: Alamofire.URLConvertible = realURL
  //
  //  let urlRequest: Alamofire.URLRequestConvertible = URLRequest(url: realURL)
  //
  //  AF.request(urlRequest).responseJSON {
  //      print($0)
  //  }
  
  
  
  func fetchRequest() {
    
    AF.request("https://randomuser.me/api/?page=3&results=10&seed=abc", method: .get).responseJSON { response in
      print(response)
      
    }
  }
  
  
  
}
