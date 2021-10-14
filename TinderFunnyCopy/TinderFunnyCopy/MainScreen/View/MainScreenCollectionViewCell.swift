//
//  MainScreenTableViewCell.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit


// MARK: - MainScreenCollectionViewCell
class MainScreenCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var viewCell: UIView!
  weak var delegate: MainScreenCellDelegate?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    viewCell.backgroundColor = myBlueColor
  }
  
  // MARK: - IBAction
  @IBAction func someButtonAction() {
    self.delegate?.cellDidTapSomeButton(cell: self)
  }
}

// MARK: - MainScreenCellDelegate
protocol MainScreenCellDelegate: NSObjectProtocol {
  /** Delegate method example */
  func cellDidTapSomeButton(cell: MainScreenCollectionViewCell)
}

