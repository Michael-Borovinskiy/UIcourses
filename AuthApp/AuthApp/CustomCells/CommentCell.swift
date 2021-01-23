//
//  CommentCell.swift
//  AuthApp
//
//  Created by Михаил on 23.01.2021.
//

import UIKit

class CommentCell: UITableViewCell {

    
    @IBOutlet weak var uiImage: UIImageView! {
        didSet{
            self.uiImage.layer.cornerRadius = self.uiImage.frame.width/2.0
        }
    }
    
    @IBOutlet weak var uiUserName: UILabel!
    @IBOutlet weak var uiText: UILabel! 
    
    func setData (userImage imgName: String, userName name: String, textComment comment: String) {
        self.uiImage.image = UIImage(named: imgName)
        self.uiUserName.text = name
        self.uiText.text = comment
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
