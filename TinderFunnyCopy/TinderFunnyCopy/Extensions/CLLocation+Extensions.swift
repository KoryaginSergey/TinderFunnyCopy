//
//  CLLocation+Extensions.swift
//  TinderFunnyCopy
//
//  Created by Admin on 26.10.2021.
//

import Foundation
import CoreLocation


extension CLLocation {
  func distanceKm(to location: CLLocation?) -> String? {
    guard let location = location else { return nil }
    let kmDistance: Int = Int(self.distance(from: location) / 1000)
    return "\(kmDistance) km away"
  }
}

