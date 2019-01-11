//
//  ATZoomBounceAnimation.swift
//  ATZoomBounceAnimation
//
//  Created by Ashish Tripathi on 11/01/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

class ATZoomBounceAnimation: NSObject, UIViewControllerAnimatedTransitioning {

  let duration = 1.5
  var presenting = true
  var originFrame = CGRect.zero

  var dismissCompletion: (()->Void)?

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    let detailView = presenting ? toView : transitionContext.view(forKey: .from)!

    let initialFrame = presenting ? originFrame : detailView.frame
    let finalFrame = presenting ? detailView.frame : originFrame

    let xScaleFactor = presenting ?
      initialFrame.width / finalFrame.width :
      finalFrame.width / initialFrame.width

    let yScaleFactor = presenting ?
      initialFrame.height / finalFrame.height :
      finalFrame.height / initialFrame.height

    let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)

    if presenting {
      detailView.transform = scaleTransform
      detailView.center = CGPoint(
        x: initialFrame.midX,
        y: initialFrame.midY)
      detailView.clipsToBounds = true
    }

    containerView.addSubview(toView)
    containerView.bringSubviewToFront(detailView)

    UIView.animate(withDuration: duration, delay:0.0,
                   usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0,
                   animations: {
                    detailView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
                    detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
    }, completion: { _ in
      if !self.presenting {
        self.dismissCompletion?()
      }
      transitionContext.completeTransition(true)
    })
  }
}
