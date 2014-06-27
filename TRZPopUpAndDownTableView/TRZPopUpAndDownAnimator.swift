//
//  TRZPopUpAndDownAnimator.swift
//  TRZPopUpAndDownTableView
//
//  Created by yam on 2014/06/15.
//  Copyright (c) 2014年 86. All rights reserved.
//

import UIKit

class TRZPopUpAndDownAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum TRZPopUpAndDownAnimateStyle {
        case UP
        case DOWN
    }
    
    let duration: NSTimeInterval = 0.2
    var animateStyle: TRZPopUpAndDownAnimateStyle = .UP
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        NSLog("animateTransition")
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let container: UIView = transitionContext.containerView()
        
        if self.animateStyle == .UP {
            NSLog("animateStyle.UP")
            toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
            toViewController.view.alpha = 0.0
            container.addSubview(toViewController.view)
        } else {
            NSLog("animateStyle.DOWN")
            container.insertSubview(toViewController.view, belowSubview: fromViewController.view)
        }
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            if self.animateStyle == .UP {
                NSLog("animateStyle.UP")
                toViewController.view.transform = CGAffineTransformIdentity
                toViewController.view.alpha = 1.0
            } else {
                NSLog("animateStyle.DOWN")
                fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
                fromViewController.view.alpha = 0.0
            }}
            , completion: { (finished: Bool) -> Void in
                let completed: Bool = !transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(completed)
            })
    }
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return duration
    }
    
}
