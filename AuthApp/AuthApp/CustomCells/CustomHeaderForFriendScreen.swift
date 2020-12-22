//
//  CustomHeaderForFriendScreen.swift
//  AuthApp
//
//  Created by Михаил on 22.12.2020.
//

import UIKit

class CustomHeaderForFriendScreen: UITableViewHeaderFooterView {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView!.backgroundColor = .darkGray
        self.backgroundView!.alpha = 0.5

    }



}
