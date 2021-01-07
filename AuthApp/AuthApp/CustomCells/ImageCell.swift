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
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
        self.img.clipsToBounds = true
        self.img.contentMode = .scaleAspectFit
        self.layer .borderWidth = 0.5
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
    
        @objc func setLike() {
            if !isLiked {
                lblLikes.text = "\(countOfLikes! + 1)"
                lblLikes.textColor = .green
                btnLikes.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                isLiked.toggle()
            } else{
                lblLikes.text = "\(countOfLikes!)"
                lblLikes.textColor = .white
                btnLikes.setImage(UIImage(systemName: "heart"), for: .normal)
                isLiked.toggle()
            }
        }
    
}

