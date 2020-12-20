//
//  CustomCellForFriendsAndGroups.swift
//  AuthApp
//
//  Created by Михаил on 20.12.2020.
//

import UIKit

class CustomCellForFriendsAndGroups: UITableViewCell {

    required init? (coder: NSCoder) {
        super.init(coder: coder)!
        addGestureRecognizer(ilongPressGestureRecognizer)
    }
    
    @IBOutlet weak var uiView: UIView!
    {didSet {
        self.uiView.clipsToBounds = false
        self.uiView.layer.shadowColor = UIColor.black.cgColor
        self.uiView.layer.cornerRadius = self.uiView.frame.width/2.0
        self.uiView.layer.shadowOpacity = 1
        self.uiView.layer.shadowOffset = CGSize.zero
        self.uiView.layer.shadowRadius = 8
       // self.uiView.layer.shadowPath = UIBezierPath(roundedRect: self.uiView.bounds, cornerRadius: 10).cgPath
        
    }}

    @IBOutlet weak var uiImageView: UIImageView!
    {didSet {
        self.uiImageView.clipsToBounds = true
        self.uiImageView.layer.cornerRadius = self.uiImageView.frame.width/2.0
    }}
    
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
    
    var ilongPressGestureRecognizer: UILongPressGestureRecognizer { //  recognizer длительного нажатия на cell
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress))
        return recognizer
    }
    
    @objc func onLongPress () {        //  функция при длительном нажатии на cell
        self.uiView.layer.shadowOpacity = Float(Int.random(in: 5...30))
        self.uiView.layer.shadowRadius = CGFloat(Int.random(in: 5...30))
        self.uiView.layer.shadowColor = UIColor.random.cgColor
    }
    
    
}

extension UIColor {                 // для выбора рандомного UIColor
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
