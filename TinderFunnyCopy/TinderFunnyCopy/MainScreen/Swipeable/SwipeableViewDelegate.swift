//
//  SwipeableViewDelegate.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import Foundation


protocol SwipeableViewDelegate: AnyObject {
  
  func didTap(view: SwipeableView)
  
  func didChangeDirection(direction: SwipeDirection)
  
  func didBeginSwipe(onView view: SwipeableView)
  
  func didEndSwipe(onView view: SwipeableView)
  
  func didInterruptSwipe(onView view: SwipeableView)
}
