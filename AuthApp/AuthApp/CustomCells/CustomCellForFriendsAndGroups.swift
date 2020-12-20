//
//  CustomCellForFriendsAndGroups.swift
//  AuthApp
//
//  Created by Михаил on 20.12.2020.
//

import UIKit

class CustomCellForFriendsAndGroups: UITableViewCell {

    
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setValues(img: UIImage, name: String) {
        uiImageView.image = img
        uiLbl.text = name

    }
}
