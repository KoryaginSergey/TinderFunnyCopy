//
//  MainScreenViewController.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit


// MARK: - MainScreenViewController
class MainScreenViewController: UIViewController, UICollectionViewDelegate {
  
  var model: MainScreenModelProtocol
  private var dataSource: MainScreenDataSource
  
  fileprivate var tempView: MainScreenViewProtocol?
  var customView: MainScreenViewProtocol! {
    return self.view as? MainScreenViewProtocol
  }
  
  // MARK: - Initializers
  init(withView view: MainScreenViewProtocol, model: MainScreenModelProtocol, dataSource: MainScreenDataSource) {
    
    self.model = model
    self.dataSource = dataSource
    self.tempView = view
    
    super.init(nibName: nil, bundle: nil)
    
    self.model.delegate = self
    self.dataSource.cellDelegate = self
    
    // your custom code
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
    self.connectCollectionViewDependencies()
  }
  
  private func connectCollectionViewDependencies() {
    self.customView.collectionView.delegate = self
    self.dataSource.registerNibsForCollectionView(collectionView: self.customView.collectionView)
    self.customView.collectionView.dataSource = self.dataSource
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

// MARK: - MainScreenCellDelegate
extension MainScreenViewController: MainScreenCellDelegate {
  func cellDidTapSomeButton(cell: MainScreenCollectionViewCell) {
  }
}
