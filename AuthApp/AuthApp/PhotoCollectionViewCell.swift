//
//  PhotoCollectionViewCell.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var image: UIImageView!
    
    func setImage (img: UIImage) {
        image.image = img
    }
    
    
}
