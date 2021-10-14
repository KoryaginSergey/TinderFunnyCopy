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

//    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection section: Int) -> Int {
//        return self.model.items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.deque(for: indexPath) as MainScreenCollectionViewCell
//        cell.delegate = cellDelegate
//
//        let testItem = self.model.items[indexPath.row];
//        self.configure(cell: cell, forItem: testItem)
//
//        return cell
//    }
}

