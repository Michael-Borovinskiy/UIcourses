//
//  CustomPushAnimations.swift
//  AuthApp
//
//  Created by Михаил on 04.01.2021.
//

import UIKit

final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return}
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: 0,
                                           width:  -source.view.frame.height,
                                           height: -source.view.frame.width )
                                         
        
        let destinationViewTargetFrame = source.view.frame//source.view.frame

        transitionContext.containerView.addSubview(destination.view)

        destination.view.frame = CGRect(x: containerViewFrame.width,
                                        y: -containerViewFrame.width,
                                        width: containerViewFrame.height,
                                        height: containerViewFrame.width)
        

        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        source.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
                        destination.view.frame = destinationViewTargetFrame
                        destination.view.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) { finished in
            source.removeFromParent()
            transitionContext.completeTransition(finished)
        }
    }
    
}
