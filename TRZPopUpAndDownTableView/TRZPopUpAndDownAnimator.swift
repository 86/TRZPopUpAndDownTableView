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
    
    let duration: NSTimeInterval = 0.3
    var animateStyle: TRZPopUpAndDownAnimateStyle = .UP
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        NSLog("animateTransition")
        
//        UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//        UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
//        UIView *container = [transitionContext containerView];
        let container: UIView = transitionContext.containerView()
//        fromViewController.view.layer.masksToBounds = YES;
//        fromViewController.view.layer.cornerRadius = 4.0;
//        
//        if (self.reverse) {
//            [container insertSubview:toViewController.view belowSubview:fromViewController.view];
//            toViewController.view.transform = CGAffineTransformMakeScale(0.98, 0.98);
//        }
//        else {
//            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 0);
//            toViewController.view.alpha = 0.0;
//            [container addSubview:toViewController.view];
//        }
        
        if self.animateStyle == .DOWN {
            NSLog("animateStyle.DOWN")
            container.insertSubview(toViewController.view, belowSubview:fromViewController.view)
//            toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
//            toViewController.view.alpha = 0.0
        } else {
            NSLog("animateStyle.UP")
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 0)
            toViewController.view.alpha = 0.0
            container.addSubview(toViewController.view)
        }
        
//        
//        [UIView animateKeyframesWithDuration:TRANSITION_DURATION
//            delay:0
//            options:UIViewKeyframeAnimationOptionCalculationModeCubic
//            animations:^{
//            if (self.reverse) {
//            switch (self.transitionStyle) {
//            case CR7DissMissTransitionStyleScale:
//            fromViewController.view.transform = CGAffineTransformMakeScale(1.0, 0);
//            fromViewController.view.alpha = 0.0;
//            break;
//            case CR7DissMissTransitionStyleSlideLeft:
//            fromViewController.view.transform = CGAffineTransformMakeTranslation(fromViewController.view.bounds.size.width, 0);
//            fromViewController.view.alpha = 0.9;
//            break;
//            case CR7DissMissTransitionStyleSlideRight:
//            fromViewController.view.transform = CGAffineTransformMakeTranslation(-fromViewController.view.bounds.size.width, 0);
//            fromViewController.view.alpha = 0.9;
//            break;
//            default:
//            break;
//            }
//            toViewController.view.transform = CGAffineTransformIdentity;
//            }
//            else {
//            fromViewController.view.transform = CGAffineTransformMakeScale(0.98, 0.98);
//            toViewController.view.transform = CGAffineTransformIdentity;
//            toViewController.view.alpha = 1.0;
//            }
//            } completion:^(BOOL finished) {
//            [transitionContext completeTransition:finished];
//            }];
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            if self.animateStyle == .DOWN {
                NSLog("animateStyle.DOWN")
                fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5)
                fromViewController.view.alpha = 0.0
//                toViewController.view.transform = CGAffineTransformIdentity
//                toViewController.view.alpha = 1.0
            } else {
                NSLog("animateStyle.UP")
                fromViewController.view.transform = CGAffineTransformMakeScale(0.2, 0.2)
                fromViewController.view.alpha = 0.0
                toViewController.view.transform = CGAffineTransformIdentity
                toViewController.view.alpha = 1.0
            }}
            , completion: { (finished: Bool) -> Void in
                transitionContext.completeTransition(finished)
            })
        
    }
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return duration
    }
    
}
