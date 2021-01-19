//
//  NewsCell.swift
//  AuthApp
//
//  Created by Михаил on 25.12.2020.
//

import UIKit

class NewsCell: UITableViewCell { // ToDo добавить в ячейку аватар и имя пользователя к каждой новости

    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let cgPoint = CGPoint(x: 0, y: 72)
    
    @IBOutlet weak var uiHeader: UIView!
    @IBOutlet weak var uiImageHeader: UIImageView!{
        didSet{
            self.uiImageHeader.layer.cornerRadius = self.uiImageHeader.frame.width/2.0
        }
    }
    @IBOutlet weak var uiUserName: UILabel!
    
    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var uiImageView: UIImageView!
    
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var commentLike: UIButton!
    @IBOutlet weak var forwardMessage: UIButton!
    @IBOutlet weak var buttonLooks: UIButton!
    
    func setData (_ textLabel: String ,_ nameImg: String, _ nameImgHeader: String, _ uiUserName: String) {
        self.uiLabel.text = textLabel
        self.uiImageView.image = UIImage(named: nameImg)
        self.uiImageHeader.image = UIImage(named: nameImgHeader)
        self.uiUserName.text = uiUserName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiImageView.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
