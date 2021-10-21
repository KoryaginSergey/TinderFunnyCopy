//
//  MainScreenView.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.

import UIKit

struct Defaults {
    struct View {
        static let shadowRadius: CGFloat = 2.0
        static let shadowOpacity: Float = 0.5
        static let shadowOffset: CGSize = CGSize(width: 0, height: 5)
    }
}

// MARK: - MainScreenViewDelegate
protocol MainScreenViewDelegate: AnyObject {
  func viewSomeAction(view: MainScreenViewProtocol)
}

// MARK: - MainScreenViewProtocol
protocol MainScreenViewProtocol: UIView {
  var delegate: MainScreenViewDelegate? { get set }
  var contentView: SwipeableCardViewContainer! { get }
}

// MARK: - MainScreenView
final class MainScreenView: UIView, MainScreenViewProtocol{
  
  // MARK: - MainScreenView interface methods
  weak var delegate: MainScreenViewDelegate?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var leftViewInStackView: UIView!
  @IBOutlet weak var rightViewInStackView: UIView!
  @IBOutlet weak var leftCircleView: UIView!
  @IBOutlet weak var rightCircleView: UIView!
  @IBOutlet weak var leftCircleImage: UIImageView!
  @IBOutlet weak var rightCircleImage: UIImageView!
  @IBOutlet internal weak var contentView: SwipeableCardViewContainer!
  
  // add view private properties/outlets/methods here
  
  // MARK: - IBActions
  @IBAction func someButtonAction() {
    self.delegate?.viewSomeAction(view: self)
  }
  
  // MARK: - Overrided methods
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
}

private extension MainScreenView {
  func setupUI() {
    leftCircleView.applyStyle()
    rightCircleView.applyStyle()
    
    rightCircleView.backgroundColor = myRedColor
    rightCircleImage.image = UIImage(named: "Heart")?.withTintColor(.white)
    leftCircleImage.image = UIImage(named: "Cross")

    titleLabel.text = "Discover"
    titleLabel.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
  }
}

private extension UIView {
    func applyStyle() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = Defaults.View.shadowOffset
        layer.masksToBounds = false
        layer.shadowRadius = Defaults.View.shadowRadius
        layer.shadowOpacity = Defaults.View.shadowOpacity
    }
}

