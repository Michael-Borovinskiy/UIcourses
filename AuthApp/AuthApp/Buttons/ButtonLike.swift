//
//  buttonLike.swift
//  AuthApp
//
//  Created by Михаил on 15.12.2020.
//

import UIKit

class ButtonLike: UIView {

//    var imageView: UIImageView? = nil
//
//    func initButtonLike () {
//        imageView = UIImageView(frame: self.bounds)
//        imageView?.image = UIImage(systemName: "heart")
//        imageView?.layer.masksToBounds = true
//
//        self.backgroundColor = .clear
//        self.addSubview(imageView!)
//    }
    
    
    var counterLikes = 0

    @IBOutlet var uiView: ButtonLike!
    @IBOutlet weak var heartLike: UIImageView!
    @IBOutlet weak var cntlikes: UILabel!


    @IBAction func setLike(_ sender: Any) {
//            if counterLikes == 0 {
//                cntlikes!.text = "1"
//                    } else{
//                cntlikes!.text = "0"
//                    }
        }

    override init (frame: CGRect){
    super.init(frame: frame)
    innerInit()
    }

    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }


    private func innerInit() {
    Bundle.main.loadNibNamed("buttonLikeView", owner: self, options: nil)
//
//    uiView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(uiView)
        uiView.frame = self.bounds
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        cntlikes.text = "0"
//
//    }

}

