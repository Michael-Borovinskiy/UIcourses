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
    }
    
    @IBOutlet weak var uiView: UIView!
    {didSet {
        self.uiView.clipsToBounds = false
        self.uiView.layer.shadowColor = UIColor.black.cgColor
        self.uiView.layer.cornerRadius = self.uiView.frame.width/2.0
        self.uiView.layer.shadowOpacity = 1
        self.uiView.layer.shadowOffset = CGSize.zero
        self.uiView.layer.shadowRadius = 4
        
    }}

    @IBOutlet weak var uiImageView: UIImageView!
    {didSet {
        self.uiImageView.clipsToBounds = true
        self.uiImageView.layer.cornerRadius = self.uiImageView.frame.width/2.0
    }}
    
    @IBOutlet weak var uiLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uiView.addGestureRecognizer(pressGestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setValues(img: UIImage, name: String) {
        uiImageView.image = img
        uiLbl.text = name

    }
    
    var pressGestureRecognizer: UITapGestureRecognizer { //  recognizer  нажатия на cell
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        return recognizer
    }
    
    
    @objc func onTap () {        //  функция при длительном нажатии на cell
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.4, options: [], animations: {
            UIView.animate(withDuration: 0.5, animations: {
                self.uiView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75);
                      }, completion: {
                        _ in
                        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: [], animations: {
                                        self.uiView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)})
                    })
        })
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
