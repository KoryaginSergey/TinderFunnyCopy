//
//  SwipeableCardViewDataSource.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import UIKit


/// A DataSource for providing all of the information required
/// for SwipeableCardViewContainer to layout a series of cards.
protocol SwipeableCardViewDataSource: AnyObject {
  
  /// Determines the number of cards to be added into the
  /// SwipeableCardViewContainer. Not all cards will initially
  /// be visible, but as cards are swiped away new cards will
  /// appear until this number of cards is reached.
  ///
  /// - Returns: total number of cards to be shown
  func numberOfCards() -> Int
  
  /// Provides the Card View to be displayed within the
  /// SwipeableCardViewContainer. This view's frame will
  /// be updated depending on its current index within the stack.
  ///
  /// - Parameter index: index of the card to be displayed
  /// - Returns: card view to display
  func card(forItemAtIndex index: Int) -> SwipeableView
  
  /// Provides a View to be displayed underneath all of the
  /// cards when all cards have been swiped away.
  ///
  /// - Returns: view to be displayed underneath all cards
  func viewForEmptyCards() -> UIView?
}
