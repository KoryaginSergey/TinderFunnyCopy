//
//  CardView.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import Foundation
import UIKit

class CardView: SwipeableView {
  
  
  
  
  
  
  
  
  
  /// Shadow View
  private weak var shadowView: UIView?
  
  /// Inner Margin
  private static let kInnerMargin: CGFloat = 20.0
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = myBlueColor
    layer.cornerRadius = 14
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
