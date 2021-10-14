//
//  MainScreenDataSource.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.
//  
//

import UIKit


// MARK: - MainScreenDataSource
class MainScreenDataSource: NSObject, UICollectionViewDataSource {
  
  weak var cellDelegate: MainScreenCellDelegate?
  private let model: MainScreenModelProtocol
  
  init(withModel model: MainScreenModelProtocol) {
    self.model = model
  }
  
  func registerNibsForCollectionView(collectionView: UICollectionView) {
    MainScreenCollectionViewCell.register(for: collectionView)
    
  }
  
  // MARK: - Private methods
  func configure(cell: MainScreenCollectionViewCell, forItem item: String) {
    //        cell.collectionLabel.text = item
  }
  
  // MARK: - UICollectionViewDataSource
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCollectionViewCell", for: indexPath) 
    return cell
  }
}

