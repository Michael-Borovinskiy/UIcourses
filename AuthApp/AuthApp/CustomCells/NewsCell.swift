//
//  NewsCell.swift
//  AuthApp
//
//  Created by Михаил on 25.12.2020.
//

import UIKit

class NewsCell: UITableViewCell { // ToDo добавить в ячейку аватар и имя пользователя к каждой новости

    
    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var uiImageView: UIImageView!
    
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var commentLike: UIButton!
    @IBOutlet weak var forwardMessage: UIButton!
    
    func setData (_ textLabel: String ,_ nameImg: String) {
        self.uiLabel.text = textLabel
        self.uiImageView.image = UIImage(named: nameImg)
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
