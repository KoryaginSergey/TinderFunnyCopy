//
//  PostServices.swift
//  TinderFunnyCopy
//
//  Created by macuser on 18.10.2021.
//

import Foundation
import Alamofire

//enum Result<T> {
//  case success(T)
//  case failure(Error)
//}


struct PostServices {
  
  static let shared = PostServices()

  let urlString: URL = URL(string: "https://randomuser.me/api/?page=1&results=1&seed=abc")!
  
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
  
  
  let params: [String: Any] = [
      "page": 1,
      "results": 4
  ]
  
//  func fetchRequest() {

//    AF.request("https://randomuser.me/api/", method: .get, parameters: params).validate().responseJSON { responseJSON in
////      print(responseJSON)
//
//      guard let statusCode = responseJSON.response?.statusCode else { return }
//      print("statusCode: ", statusCode)
//
//      switch responseJSON.result {
//      case .success(let value):
//        print(value)
//      case .failure(let error):
//        print(error)
//      }
//    }
//  }
  
  func fetchRequest(completion: @escaping ([Result]?) -> Void) {
    AF.request("https://randomuser.me/api/", method: .get, parameters: params).validate().responseData { (response) in
      switch response.result {
            case .success(let data):
              let object = try? JSONDecoder().decode(Welcome.self, from: data)
              print(data)
              completion(object?.results)
            case .failure(let error):
              print(error)
            }
    }
  }
}
