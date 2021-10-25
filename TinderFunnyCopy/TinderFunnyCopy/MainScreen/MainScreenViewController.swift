//
//  MainScreenViewController.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit
import Alamofire
import CoreLocation


// MARK: - MainScreenViewController
class MainScreenViewController: UIViewController {
  var model: MainScreenModelProtocol
  var modelUsers: [Result] = []
  let locationManager = LocationManager()
  var location: CLLocation?
  var page = Page(page: 1, results: 5)
  fileprivate var tempView: MainScreenViewProtocol?
  var customView: MainScreenViewProtocol! {
    return self.view as? MainScreenViewProtocol
  }
  
  // MARK: - Initializers
  init(withView view: MainScreenViewProtocol, model: MainScreenModelProtocol) {
    self.model = model
    self.tempView = view
    super.init(nibName: nil, bundle: nil)
    self.model.delegate = self
    customView.contentView.dataSource = self
    customView.contentView.delegate = self
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    fatalError("This class needs to be initialized with init(withView:model:) method")
  }
  
  // MARK: - View life cycle
  override func loadView() {
    super.loadView()
    self.view = self.tempView
    self.tempView = nil
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.customView.delegate = self
    fetchNewData()
    self.locationManager.currentLocationRequest { [weak self] location in
      self?.location = location
      self?.customView.contentView.reloadData()
    }
  }
  
  func fetchNewData() {
    PostServices.shared.fetchRequest(page: page) { [weak self] model in
      self?.modelUsers.append(contentsOf: model.results ?? [])
      self?.customView.contentView.reloadData()
    }
  }
}

// MARK: - MainScreenViewDelegate
extension MainScreenViewController: MainScreenViewDelegate {
  func viewLikeAction(view: MainScreenViewProtocol) {
    customView.contentView.swipeAction(direction: .right)
  }
  
  func viewDissLikeAction(view: MainScreenViewProtocol) {
    customView.contentView.swipeAction(direction: .left)
  }
}

// MARK: - MainScreenModelDelegate
extension MainScreenViewController: MainScreenModelDelegate {
  func modelDidChanged(model: MainScreenModelProtocol) {
  }
}

extension MainScreenViewController: SwipeableCardViewDataSource {
  func numberOfCards() -> Int {
    modelUsers.count
  }
  
  func card(forItemAtIndex index: Int) -> SwipeableView {
    let person = modelUsers[index]
    let card: CardView = CardView.create()
    card.state = .init(fullName: person.fullNameAndAge(),
                       distance: person.locationObject()?.distanceKm(to: self.location),
                       location: person.locationName(), isOnline: false,
                       imagePath: person.picture?.large)
    return card
  }
  
  func viewForEmptyCards() -> UIView? {
    nil
  }
}

extension MainScreenViewController: SwipeableCardViewDelegate {
  func didSelect(card: SwipeableView, atIndex index: Int) { }
  
  func didRemoveFirst() {
    self.modelUsers.removeFirst()
    if self.modelUsers.count == 3 {
      self.page.page = 2
      self.fetchNewData()
    }
  }
}

private extension CLLocation {
  func distanceKm(to location: CLLocation?) -> String? {
    guard let location = location else { return nil }
    let kmDistance: Int = Int(self.distance(from: location) / 1000)
    return "\(kmDistance)km away"
  }
}

