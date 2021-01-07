//
//  CustomCellWithShadow.swift
//  AuthApp
//
//  Created by Михаил on 20.12.2020.
//

import UIKit

class CustomCellWithShadow: CustomCellForFriendsAndGroups {

    let customCell = CustomCellForFriendsAndGroups()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
