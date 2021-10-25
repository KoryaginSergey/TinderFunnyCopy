//
//  LocationManager.swift
//  TinderFunnyCopy
//
//  Created by macuser on 20.10.2021.
//

import Foundation
import CoreLocation
import UIKit


class LocationManager: NSObject {
  lazy var locationManager: CLLocationManager = {
    let localManager = CLLocationManager()
    localManager.delegate = self
    localManager.desiredAccuracy = 100
    localManager.pausesLocationUpdatesAutomatically = false
    localManager.requestWhenInUseAuthorization()
    return localManager
  }()
  
  func currentLocationRequest(completion: @escaping (CLLocation?) -> ()) {
    closure = { location in
      completion(location)
    }
    locationManager.startUpdatingLocation()
  }
  
  var closure:((CLLocation?) -> ())?
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
  
  //MARK: - request of coordinate when changing location
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let lastLocation = locations.last {
      closure?(lastLocation)
      locationManager.stopUpdatingLocation()
    }
  }
}





