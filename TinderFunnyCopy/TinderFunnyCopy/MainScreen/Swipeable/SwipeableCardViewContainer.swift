//
//  SwipeableCardViewContainer.swift
//  TinderFunnyCopy
//
//  Created by Admin on 21.10.2021.
//

import UIKit


class SwipeableCardViewContainer: UIView, SwipeableViewDelegate {
  static let horizontalInset: CGFloat = 12.0
  static let verticalInset: CGFloat = 12.0
  var dataSource: SwipeableCardViewDataSource? {
    didSet {
      reloadData()
    }
  }
  
  var delegate: SwipeableCardViewDelegate?
  private var cardViews: [SwipeableView] = []
  private var visibleCardViews: [SwipeableView] {
    return subviews as? [SwipeableView] ?? []
  }
  
  fileprivate var remainingCards: Int = 0
  static let numberOfVisibleCards: Int = 3
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = .clear
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func swipeAction(direction: SwipeDirection) {
    guard let card = self.cardViews.first else { return }
    card.swipeAnimation(to: direction)
  }
  
  /// Reloads the data used to layout card views in the
  /// card stack. Removes all existing card views and
  /// calls the dataSource to layout new card views.
  func reloadData() {
    removeAllCardViews()
    guard let dataSource = dataSource else {
      return
    }
    let numberOfCards = dataSource.numberOfCards()
    remainingCards = numberOfCards
    for index in 0..<min(numberOfCards, SwipeableCardViewContainer.numberOfVisibleCards) {
      addCardView(cardView: dataSource.card(forItemAtIndex: index), atIndex: index)
    }
    if let emptyView = dataSource.viewForEmptyCards() {
      addEdgeConstrainedSubView(view: emptyView)
    }
    setNeedsLayout()
  }
  
  private func addCardView(cardView: SwipeableView, atIndex index: Int) {
    cardView.delegate = self
    setFrame(forCardView: cardView, atIndex: index)
    cardViews.append(cardView)
    insertSubview(cardView, at: 0)
    remainingCards -= 1
  }
  
  private func removeAllCardViews() {
    for cardView in visibleCardViews {
      cardView.removeFromSuperview()
    }
    cardViews = []
  }
  
  /// Sets the frame of a card view provided for a given index. Applies a specific
  /// horizontal and vertical offset relative to the index in order to create an
  /// overlay stack effect on a series of cards.
  ///
  /// - Parameters:
  ///   - cardView: card view to update frame on
  ///   - index: index used to apply horizontal and vertical insets
  private func setFrame(forCardView cardView: SwipeableView, atIndex index: Int) {
    var cardViewFrame = bounds
    let horizontalInset = (CGFloat(index) * SwipeableCardViewContainer.horizontalInset)
    let verticalInset = CGFloat(index) * SwipeableCardViewContainer.verticalInset
    cardViewFrame.size.width -= 2 * horizontalInset
    cardViewFrame.origin.x += horizontalInset
    cardViewFrame.origin.y -= verticalInset
    cardView.frame = cardViewFrame
  }
}

// MARK: - SwipeableViewDelegate
extension SwipeableCardViewContainer {
  func didTap(view: SwipeableView) {
    if let cardView = view as? SwipeableView,
       let index = cardViews.firstIndex(of: cardView) {
      delegate?.didSelect(card: cardView, atIndex: index)
    }
  }
  
  func didBeginSwipe(onView view: SwipeableView) {
    // React to Swipe Began?
  }
  
  func didChangeDirection(direction: SwipeDirection) {
    guard let card1 = self.cardViews.first else { return }
    guard let card = card1 as? CardView else { return }
    card.direction = direction
  }
  
  func didInterruptSwipe(onView view: SwipeableView) {
    guard let cardView = view as? CardView else { return }
    cardView.direction = .up
  }
  
  func didEndSwipe(onView view: SwipeableView) {
    guard let dataSource = dataSource else {
      return
    }
    
    // Remove swiped card
    view.removeFromSuperview()
    self.cardViews.removeFirst()
    self.delegate?.didRemoveFirst()
    // Only add a new card if there are cards remaining
    if remainingCards > 0 {
      // Calculate new card's index
      let newIndex = dataSource.numberOfCards() - remainingCards
      // Add new card as Subview
      addCardView(cardView: dataSource.card(forItemAtIndex: newIndex), atIndex: 2)
      self.layoutIfNeeded()
      // Update all existing card's frames based on new indexes, animate frame change
      // to reveal new card from underneath the stack of existing cards.
      for (cardIndex, cardView) in visibleCardViews.reversed().enumerated() {
        UIView.animate(withDuration: 0.2, animations: {
          cardView.center = self.center
          self.setFrame(forCardView: cardView, atIndex: cardIndex)
          self.layoutIfNeeded()
        })
      }
    }
  }
}
