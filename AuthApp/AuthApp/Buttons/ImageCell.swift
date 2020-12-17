//
//  ImageCell.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    var isLiked: Bool = false
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnLikes: UIButton!
    @IBOutlet weak var lblLikes: UILabel!
    
    
    func setImg (image: UIImage) {
        self.img.image = image
        self.lblLikes.text = "0"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnLikes.addTarget(self, action: #selector(setLike), for: .touchUpInside)
        self.tintColor = UIColor.gray
        
    }
    
        @objc func setLike() {
            if !isLiked {
                lblLikes.text = "1"
                lblLikes.textColor = .green
                btnLikes.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                isLiked.toggle()
            } else{
                lblLikes.text = "0"
                lblLikes.textColor = .black
                btnLikes.setImage(UIImage(systemName: "heart"), for: .normal)
                isLiked.toggle()
            }
        }
    
}

