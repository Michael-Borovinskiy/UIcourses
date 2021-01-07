//
//  AvatarView.swift
//  AuthApp
//
//  Created by Михаил on 14.12.2020.
//

import UIKit

class AvatarView: UIImageView {
    
    override class var layerClass: AnyClass{
        return CAShapeLayer.self }
    
    override func draw(_ rect: CGRect) {
        
        
        self.layer.borderWidth = 8
        self.layer.backgroundColor = UIColor.black.cgColor
        makeRounded()
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOpacity = 8
        self.layer.shadowOffset = CGSize.zero
        self.layer.borderColor = UIColor.green.cgColor
    }
    
    func makeRounded() {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
