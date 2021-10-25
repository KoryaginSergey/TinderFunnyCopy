//
//  Result+Extensions.swift
//  TinderFunnyCopy
//
//  Created by macuser on 25.10.2021.
//

import Foundation
import CoreLocation


extension Result {
  func fullNameAndAge() -> String {
    var fullNameString = ""
    if let first = name?.first {
      fullNameString += first
    }
    
    if let last = name?.last {
      if !fullNameString.isEmpty {
        fullNameString += " "
      }
      fullNameString += last
    }
    
    if let age = dob?.age {
      if !fullNameString.isEmpty {
        fullNameString += ", "
      }
      fullNameString += "\(age)"
    }
    
    return fullNameString
  }
  
  func locationObject() -> CLLocation? {
    guard let lat = location?.coordinates?.latitude, let long = location?.coordinates?.longitude else { return nil }
    guard let latDouble = Double(lat), let longDouble = Double(long) else { return nil }
    return CLLocation(latitude: latDouble, longitude: longDouble)
  }
  
  func locationName() -> String {
    var locName = ""
    if let city = location?.city {
      locName += city
    }
    
    if let country = location?.country {
      if !locName.isEmpty {
        locName += ", "
      }
      locName += country
    }
    
    return locName
  }
}
