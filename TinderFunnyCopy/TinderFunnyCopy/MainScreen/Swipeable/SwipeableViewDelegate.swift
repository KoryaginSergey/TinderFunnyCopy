//
//  SwipeableViewDelegate.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import Foundation

protocol SwipeableViewDelegate: class {
  
  func didTap(view: SwipeableView)
  
  func didBeginSwipe(onView view: SwipeableView)
  
  func didEndSwipe(onView view: SwipeableView)
  
}
