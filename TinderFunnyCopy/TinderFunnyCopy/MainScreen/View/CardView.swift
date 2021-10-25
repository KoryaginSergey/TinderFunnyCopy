//
//  CardView.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import Foundation
import UIKit
import SDWebImage


class CardView: SwipeableView {
  @IBOutlet weak var fotoImageView: UIImageView!
  @IBOutlet weak var forDistanceView: UIView!
  @IBOutlet weak var forLocationView: UIView!
  @IBOutlet weak var fullNameLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var centralView: UIView!
  @IBOutlet weak var centralContentView: UIView!
  @IBOutlet weak var centralImageView: UIImageView!
  
  public struct State {
      let fullName: String?
      let distance: String?
      let location: String?
      let isOnline: Bool
      let imagePath: String?
      
      init(fullName: String?,
           distance: String?,
           location: String?,
           isOnline: Bool,
           imagePath: String?) {
          self.fullName = fullName
          self.distance = distance
          self.location = location
          self.isOnline = isOnline
          self.imagePath = imagePath
    }
  }
  
  public var direction: SwipeDirection = .up {
    didSet {
      configureCentralView(swipeDirection: direction)
    }
  }
    
    public var state: State? {
      didSet {
        configure()
      }
    }
  
  /// Shadow View
  private weak var shadowView: UIView?
  
  /// Inner Margin
  private static let kInnerMargin: CGFloat = 20.0
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
  
  private func applyShadow(width: CGFloat, height: CGFloat) {
    if let shadowView = shadowView {
      let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14.0)
      shadowView.layer.masksToBounds = false
      shadowView.layer.shadowRadius = 8.0
      shadowView.layer.shadowColor = UIColor.black.cgColor
      shadowView.layer.shadowOffset = CGSize(width: width, height: height)
      shadowView.layer.shadowOpacity = 0.15
      shadowView.layer.shadowPath = shadowPath.cgPath
    }
  }
}

private extension CardView {
  
  func setupUI() {
    //    backgroundColor = myGreyColor
    //    layer.cornerRadius = 14
    //    centralView.applyStyle()
    
    centralContentView.backgroundColor = .clear
    backgroundColor = .clear
    fotoImageView.layer.cornerRadius = 14
    centralContentView.layer.cornerRadius = 14
    centralView.applyStyle()
    statusView.layer.cornerRadius = statusView.frame.size.height / 2
    centralView.layer.cornerRadius = centralView.frame.height / 2
    configureCentralView(swipeDirection: .up)
  }
  
  func configure() {
    fullNameLabel.text = state?.fullName
    distanceLabel.text = state?.distance
    locationLabel.text = state?.location
    statusView.backgroundColor = state?.isOnline ?? false ? .green : .red
    fotoImageView.sd_setImage(with: URL(string: state?.imagePath ?? ""),
                              placeholderImage: UIImage(named: "avatar"))
  }
  
  func configureCentralView(swipeDirection: SwipeDirection) {
    guard swipeDirection == .left || swipeDirection == .right else {
      centralContentView.isHidden = true
      return
    }
    centralContentView.isHidden = false
    centralContentView.backgroundColor = swipeDirection == .left ? myBlueColor.withAlphaComponent(0.2) : myRedColor.withAlphaComponent(0.2)
    centralView.backgroundColor = swipeDirection == .left ? myBlueColor : myRedColor
    centralImageView.image = swipeDirection == .left ? UIImage(named: "Cross")?.withTintColor(.white) : UIImage(named: "Heart")?.withTintColor(.white)
  }
}

private extension UIView {
  func applyStyle() {
    layer.cornerRadius = frame.size.width / 2
    clipsToBounds = true
  }
}

