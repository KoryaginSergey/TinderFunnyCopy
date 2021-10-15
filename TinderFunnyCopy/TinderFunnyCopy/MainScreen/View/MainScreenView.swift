//
//  MainScreenView.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

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
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var leftViewInStackView: UIView!
  @IBOutlet weak var rightViewInStackView: UIView!
  @IBOutlet weak var leftCircleView: UIView!
  @IBOutlet weak var rightCircleView: UIView!
  @IBOutlet weak var leftCircleImage: UIImageView!
  @IBOutlet weak var rightCircleImage: UIImageView!
  
  // add view private properties/outlets/methods here
  
  // MARK: - IBActions
  @IBAction func someButtonAction() {
    self.delegate?.viewSomeAction(view: self)
  }
  
  // MARK: - Overrided methods
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
    setValuesMainScreenView()
  }
}

private extension MainScreenView {
  func setupUI() {
    leftCircleView.layer.cornerRadius = leftCircleView.frame.size.width/2
    leftCircleView.clipsToBounds = true
    leftCircleView.layer.shadowColor = UIColor.black.cgColor
    leftCircleView.layer.shadowOffset = CGSize(width: 0, height: 5)
    leftCircleView.layer.masksToBounds = false
    leftCircleView.layer.shadowRadius = 2.0
    leftCircleView.layer.shadowOpacity = 0.5
    
    rightCircleView.layer.cornerRadius = rightCircleView.frame.size.width/2
    rightCircleView.clipsToBounds = true
    rightCircleView.layer.shadowColor = UIColor.black.cgColor
    rightCircleView.layer.shadowOffset = CGSize(width: 0, height: 5)
    rightCircleView.layer.masksToBounds = false
    rightCircleView.layer.shadowRadius = 2.0
    rightCircleView.layer.shadowOpacity = 0.5
    
    rightCircleView.backgroundColor = myRedColor
    rightCircleImage.image = UIImage(named: "Heart")?.withTintColor(.white)
    leftCircleImage.image = UIImage(named: "Cross")
    collectionView.layer.cornerRadius = 15
  }
  
  func setValuesMainScreenView() {
    titleLabel.text = "Discover"
    titleLabel.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
  }
}

