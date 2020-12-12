//
//  FriendsCell.swift
//  AuthApp
//
//  Created by Михаил on 10.12.2020.
//

import UIKit

class FriendsCell: UITableViewCell {

    @IBOutlet weak var imgFriend: UIImageView!
    @IBOutlet weak var nameFriend: UILabel!
    
    
    func setValues(img: UIImage, name: String) {
        imgFriend.image = img
        nameFriend.text = name

    }
    

}