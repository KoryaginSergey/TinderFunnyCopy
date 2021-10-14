//
//  MainScreenModel.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.
//  
//

import UIKit


// MARK: - MainScreenModelDelegate
protocol MainScreenModelDelegate: class {
  func modelDidChanged(model: MainScreenModelProtocol)
}

// MARK: - MainScreenModelProtocol
protocol MainScreenModelProtocol: class {
  var delegate: MainScreenModelDelegate? { get set }
  var items: [String] { get }
}

// MARK: - MainScreenModel
class MainScreenModel: MainScreenModelProtocol {
  init() {
    self.items = self.getTestItems()
  }
  
  func getTestItems() -> [String] {
    return ["Item 0", "Item 1", "Item 2"]
  }
  
  // MARK: - MainScreenModel methods
  weak var delegate: MainScreenModelDelegate?
  private(set) var items: [String] = []
  
  /** Implement MainScreenModel methods here */

  // MARK: - Private methods
  /** Implement private methods here */
  
}

