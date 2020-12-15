//
//  ImageCell.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    

    @IBOutlet weak var uiLikeViewBtn: ButtonLike!
    @IBOutlet weak var img: UIImageView!
    
    func setImg (str: String) {
        
        self.img.image = UIImage(named: str)
    }
    

    

    
}
