//
//  MainScreenView.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.
//  
//

import UIKit


// MARK: - MainScreenViewDelegate
protocol MainScreenViewDelegate: class {
  func viewSomeAction(view: MainScreenViewProtocol)
}

// MARK: - MainScreenViewProtocol
protocol MainScreenViewProtocol: UIView {
  var delegate: MainScreenViewDelegate? { get set }
  var collectionView: UICollectionView! { get }
}

// MARK: - MainScreenView
class MainScreenView: UIView, MainScreenViewProtocol{
  
  // MARK: - MainScreenView interface methods
  weak var delegate: MainScreenViewDelegate?
  @IBOutlet weak var collectionView: UICollectionView!
  
  // add view private properties/outlets/methods here
  
  // MARK: - IBActions
  @IBAction func someButtonAction() {
    self.delegate?.viewSomeAction(view: self)
  }
  
  // MARK: - Overrided methods
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // setup view and collection view programmatically here
  }
}

