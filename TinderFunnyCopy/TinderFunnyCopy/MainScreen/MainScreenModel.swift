//
//  MainScreenModel.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit
import CoreLocation


// MARK: - MainScreenModelDelegate
protocol MainScreenModelDelegate: AnyObject {
  func modelDidChanged(model: MainScreenModelProtocol)
}

// MARK: - MainScreenModelProtocol
protocol MainScreenModelProtocol: AnyObject {
  var delegate: MainScreenModelDelegate? { get set }
  var modelUsers: [Result] { get }
  var isFetching: Bool { get }
  var location: CLLocation? { get }
  func fetch()
  func removeFirst()
  func requestLocation()
}

// MARK: - MainScreenModel
class MainScreenModel: MainScreenModelProtocol {
  var modelUsers: [Result] = []
  let locationManager = LocationManager()
  var location: CLLocation?
  var page = Page(page: 0, results: 5)
  var isFetching: Bool = true
  
  // MARK: - MainScreenModel methods
  weak var delegate: MainScreenModelDelegate?
  
  func fetch() {
    page.page += 1
    isFetching = true
    PostServices.shared.fetchRequest(page: page) { [weak self] model in
      guard let self = self else { return }
      self.isFetching = false
      self.modelUsers.append(contentsOf: model.results ?? [])
      self.delegate?.modelDidChanged(model: self)
    }
  }
  
  func removeFirst() {
    modelUsers.removeFirst()
  }
  
  func requestLocation() {
    self.locationManager.currentLocationRequest { [weak self] location in
      guard let self = self else { return }
      self.location = location
      self.delegate?.modelDidChanged(model: self)
    }
  }
}

