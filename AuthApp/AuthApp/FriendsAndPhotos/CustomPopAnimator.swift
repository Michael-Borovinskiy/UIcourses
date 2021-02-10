//
//  CustomPopAnimator.swift
//  AuthApp
//
//  Created by Михаил on 04.01.2021.
//

import UIKit

final class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return}

        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        let containerViewFrame = transitionContext.containerView.frame
        destination.view.frame = source.view.frame
        
        
        destination.view.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        destination.view.transform = CGAffineTransform(translationX: -containerViewFrame.width, y: containerViewFrame.height*2.5)
        
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        let rot = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                                                        let translationX = CGAffineTransform(translationX: source.view.frame.height, y: source.view.frame.width)
                                                        source.view.transform = translationX.concatenating(rot)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           let rot2 = CGAffineTransform(rotationAngle: CGFloat.pi/2)
                                                        let translation = CGAffineTransform(translationX: containerViewFrame.width, y: containerViewFrame.height)
                                            
                                                        destination.view.transform = translation.concatenating(rot2)
                                                        
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.9,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                           destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
}
