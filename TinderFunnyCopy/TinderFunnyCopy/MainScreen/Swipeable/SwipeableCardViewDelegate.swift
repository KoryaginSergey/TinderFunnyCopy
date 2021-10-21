//
//  SwipeableCardViewDelegate.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import Foundation


protocol SwipeableCardViewDelegate: AnyObject {
  func didSelect(card: SwipeableView, atIndex index: Int)
}
