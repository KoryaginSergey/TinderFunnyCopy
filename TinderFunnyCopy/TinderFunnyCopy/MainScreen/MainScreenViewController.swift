//
//  MainScreenViewController.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit
import Alamofire
import CoreLocation


// MARK: - MainScreenViewController
final class MainScreenViewController: UIViewController {
  var model: MainScreenModelProtocol
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
    model.requestLocation()
    model.fetch()
  }
}

// MARK: - MainScreenViewDelegate
extension MainScreenViewController: MainScreenViewDelegate {
  func viewLikeAction(view: MainScreenViewProtocol) {
    if !model.isFetching {
      customView.contentView.swipeAction(direction: .right)
    }
  }
  
  func viewDissLikeAction(view: MainScreenViewProtocol) {
    if !model.isFetching {
      customView.contentView.swipeAction(direction: .left)
    }
  }
}

// MARK: - MainScreenModelDelegate
extension MainScreenViewController: MainScreenModelDelegate {
  func modelDidChanged(model: MainScreenModelProtocol) {
    customView.contentView.reloadData()
  }
}

// MARK: - SwipeableCardViewDataSource
extension MainScreenViewController: SwipeableCardViewDataSource {
  func numberOfCards() -> Int {
    model.modelUsers.count
  }
  
  func card(forItemAtIndex index: Int) -> SwipeableView {
    let person = model.modelUsers[index]
    let card: CardView = CardView.create()
    card.state = .init(fullName: person.fullNameAndAge(),
                       distance: person.locationObject()?.distanceKm(to: model.location),
                       location: person.locationName(), isOnline: true,
                       imagePath: person.picture?.large)
    return card
  }
  
  func viewForEmptyCards() -> UIView? {
    nil
  }
}

// MARK: - SwipeableCardViewDelegate
extension MainScreenViewController: SwipeableCardViewDelegate {
  func didSelect(card: SwipeableView, atIndex index: Int) { }
  
  func didRemoveFirst() {
    model.removeFirst()
    if model.modelUsers.count == SwipeableCardViewContainer.numberOfVisibleCards {
      model.fetch()
    }
  }
}


