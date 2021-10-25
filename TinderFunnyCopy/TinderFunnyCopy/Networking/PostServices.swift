//
//  PostServices.swift
//  TinderFunnyCopy
//
//  Created by macuser on 18.10.2021.
//

import Foundation
import Alamofire


struct Page: Encodable {
  var page: Int
  var results: Int
  
  var parameters: [String : Any] {
    guard let data = try? JSONEncoder().encode(self) else { return [:] }
    guard let json = try?  JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] else { return [:] }
    return json
  }
}

struct PostServices {
  static let shared = PostServices()
  
  func fetchRequest(page: Page, completion: @escaping (Welcome) -> Void) {
    AF.request("https://randomuser.me/api/", method: .get, parameters: page.parameters).validate().responseData { (response) in
      switch response.result {
      case .success(let data):
        guard let object = try? JSONDecoder().decode(Welcome.self, from: data) else { return }
        completion(object)
      case .failure(let error):
        print(error)
      }
    }
  }
}
