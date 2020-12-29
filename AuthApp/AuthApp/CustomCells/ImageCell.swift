//
//  ImageCell.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    var isLiked: Bool = false
    var countOfLikes: Int?
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var btnLikes: UIButton!
    @IBOutlet weak var lblLikes: UILabel!
    
    
    func setImg (image: UIImage) {
        self.img.image = image
    }
    
    func setLikes (countOfLikes cnt: Int) {
        self.lblLikes.text = "\(cnt)"
        countOfLikes = cnt
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnLikes.addTarget(self, action: #selector(setLike), for: .touchUpInside)
        //self.clipsToBounds = true
        //self.contentMode = .scaleAspectFit
        //self.img.clipsToBounds = true
        //self.img.contentMode = .scaleAspectFit
        //self.img.frame
        self.layer .borderWidth = 2
        self.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    
        @objc func setLike() {
            if !isLiked {
                animateLike()
                lblLikes.text = "\(countOfLikes! + 1)"
                lblLikes.textColor = .green
                btnLikes.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                isLiked.toggle()
            } else{
                animateLikeBack()
                lblLikes.text = "\(countOfLikes!)"
                lblLikes.textColor = .systemPurple
                btnLikes.setImage(UIImage(systemName: "heart"), for: .normal)
                isLiked.toggle()
            }
        }
    
    func animateLike () {
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.5
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let translation = CABasicAnimation(keyPath: "position.y")
        translation.toValue = 10
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.toValue = 0

        animationsGroup.animations = [translation, alpha]
        
        lblLikes.layer.add(animationsGroup,forKey: nil)
        
    }
    
    func animateLikeBack () {
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.6
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.6
        rotation.isCumulative = true
        rotation.repeatCount = 66.0
        rotation.speed = 60
        
        let scale: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 1
        scale.toValue = 0.3
        
        
        let opacity : CABasicAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacity.toValue = 0
        animationsGroup.animations = [scale, opacity, rotation]
        
        lblLikes.layer.add(animationsGroup, forKey:  nil)
        
    }
    
    
}

