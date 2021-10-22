//
//  CardView.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import Foundation
import UIKit

class CardView: SwipeableView {
  
  @IBOutlet weak var fotoImageView: UIImageView!
  @IBOutlet weak var fullNameLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var distanceLabel: UILabel!
  
  @IBOutlet weak var centralView: UIView!
  
  @IBOutlet weak var centralImageView: UIImageView!
  
  
  public struct State {
 
    let firstName: String?
    let lastName: String?
//    let age: Int?
//    let city: String?
//    let country: String?
//    let coordinatesLatitude: String?
//    let coordinatesLangitude: String?
    
    
    init(firstName: String?, lastName: String?) {
      self.firstName = firstName
      self.lastName = lastName
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
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    configureShadow()
  }
  
  private func configureShadow() {
    // Shadow View
    //        self.shadowView?.removeFromSuperview()
    //        let shadowView = UIView(frame: CGRect(x: Self.kInnerMargin,
    //                                              y: Self.kInnerMargin,
    //                                              width: bounds.width - (2 * Self.kInnerMargin),
    //                                              height: bounds.height - (2 * Self.kInnerMargin)))
    //        insertSubview(shadowView, at: 0)
    //        self.shadowView = shadowView
    
    // Roll/Pitch Dynamic Shadow
    //        if motionManager.isDeviceMotionAvailable {
    //            motionManager.deviceMotionUpdateInterval = 0.02
    //            motionManager.startDeviceMotionUpdates(to: .main, withHandler: { (motion, error) in
    //                if let motion = motion {
    //                    let pitch = motion.attitude.pitch * 10 // x-axis
    //                    let roll = motion.attitude.roll * 10 // y-axis
    //                    self.applyShadow(width: CGFloat(roll), height: CGFloat(pitch))
    //                }
    //            })
    //        }
    //        self.applyShadow(width: CGFloat(0.0), height: CGFloat(0.0))
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
    backgroundColor = myGreyColor
    layer.cornerRadius = 14
    centralView.applyStyle()
  
    
//    centralView.backgroundColor = myRedColor
//    centralImageView.image = UIImage(named: "Heart")?.withTintColor(.white)
    
    centralImageView.image = UIImage(named: "Cross")
  }
  
  func configure() {
//    titleLabel.text = state?.title
//    sourceLabel.text = state?.source
//    dateLabel.text = state?.date
  }
  
  
  
}

private extension UIView {
    func applyStyle() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}

