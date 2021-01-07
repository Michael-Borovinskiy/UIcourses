//
//  AllGroupsCell.swift
//  AuthApp
//
//  Created by Михаил on 12.12.2020.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiLabel: UILabel!
    
    func setValues(img: UIImage, name: String) {
        uiImageView.image = img
        uiLabel.text = name

    }
}
