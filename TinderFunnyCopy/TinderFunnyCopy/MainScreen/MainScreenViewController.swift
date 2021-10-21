//
//  MainScreenViewController.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit
import Alamofire


// MARK: - MainScreenViewController
class MainScreenViewController: UIViewController {
  
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
    // your custom code
    title = "Discover"
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
    PostServices.shared.fetchRequest()
  }
  
  // MARK: - Collection view delegate
  
}

// MARK: - MainScreenViewDelegate
extension MainScreenViewController: MainScreenViewDelegate {
  func viewSomeAction(view: MainScreenViewProtocol) {
  }
}

// MARK: - MainScreenModelDelegate
extension MainScreenViewController: MainScreenModelDelegate {
  func modelDidChanged(model: MainScreenModelProtocol) {
  }
}

extension MainScreenViewController: SwipeableCardViewDataSource {
    
    func numberOfCards() -> Int {
        5
    }
    
    func card(forItemAtIndex index: Int) -> SwipeableView {
        let card: CardView = CardView.create()
        return card
    }
    
    func viewForEmptyCards() -> UIView? {
        nil
    }
    
}
