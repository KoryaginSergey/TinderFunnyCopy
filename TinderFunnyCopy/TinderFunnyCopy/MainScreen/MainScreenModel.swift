//
//  MainScreenModel.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit

// MARK: - MainScreenModelDelegate
protocol MainScreenModelDelegate: AnyObject {
  func modelDidChanged(model: MainScreenModelProtocol)
}

// MARK: - MainScreenModelProtocol
protocol MainScreenModelProtocol: AnyObject {
  var delegate: MainScreenModelDelegate? { get set }
}

// MARK: - MainScreenModel
class MainScreenModel: MainScreenModelProtocol {
  
  // MARK: - MainScreenModel methods
  weak var delegate: MainScreenModelDelegate?
  private(set) var items: [String] = []
  
  /** Implement MainScreenModel methods here */

  // MARK: - Private methods
  /** Implement private methods here */
  
}

