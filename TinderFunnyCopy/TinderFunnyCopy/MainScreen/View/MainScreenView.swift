//
//  MainScreenView.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit


// MARK: - MainScreenViewDelegate
protocol MainScreenViewDelegate: AnyObject {
  func viewLikeAction(view: MainScreenViewProtocol)
  func viewDissLikeAction(view: MainScreenViewProtocol)
}

// MARK: - MainScreenViewProtocol
protocol MainScreenViewProtocol: UIView {
  var delegate: MainScreenViewDelegate? { get set }
  var contentView: SwipeableCardViewContainer! { get }
}

// MARK: - MainScreenView
final class MainScreenView: UIView, MainScreenViewProtocol{
  
  struct Defaults {
    struct View {
      static let shadowRadius: CGFloat = 2.0
      static let shadowOpacity: Float = 0.5
      static let shadowOffset: CGSize = CGSize(width: 0, height: 5)
    }
  }
  
  // MARK: - MainScreenView interface methods
  weak var delegate: MainScreenViewDelegate?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var likeButton: UIButton!
  @IBOutlet weak var dissLikeButton: UIButton!
  @IBOutlet internal weak var contentView: SwipeableCardViewContainer!
  
  // MARK: - IBActions
  @IBAction func dissLikeButtonAction() {
    self.delegate?.viewDissLikeAction(view: self)
  }
  @IBAction func likeButtonAction() {
    self.delegate?.viewLikeAction(view: self)
  }
  
  // MARK: - Override methods
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
}

private extension MainScreenView {
  func setupUI() {
    dissLikeButton.applyStyle()
    dissLikeButton.setImage(UIImage(named: "CrossBig"), for: .normal)
    likeButton.applyStyle()
    likeButton.backgroundColor = myRedColor
    likeButton.setImage(UIImage(named: "HeartBig")?.withTintColor(.white), for: .normal)
    titleLabel.text = "Discover"
  }
}

private extension UIButton {
  func applyStyle() {
    layer.cornerRadius = frame.size.width / 2
    clipsToBounds = true
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOffset = MainScreenView.Defaults.View.shadowOffset
    layer.masksToBounds = false
    layer.shadowRadius = MainScreenView.Defaults.View.shadowRadius
    layer.shadowOpacity = MainScreenView.Defaults.View.shadowOpacity
  }
}

