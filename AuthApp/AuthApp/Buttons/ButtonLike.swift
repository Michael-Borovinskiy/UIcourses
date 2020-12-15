//
//  buttonLike.swift
//  AuthApp
//
//  Created by Михаил on 15.12.2020.
//

import UIKit

class ButtonLike: UIView {


    @IBOutlet weak var uiView: ButtonLike!
    @IBOutlet weak var heartLike: UIImageView!
    @IBOutlet weak var counterForLikes: UILabel!
    

    override init (frame: CGRect){
    super.init(frame: frame)
    innerInit()
    }

    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
    

    private func innerInit() {
        Bundle.main.loadNibNamed("buttonLikeView", owner: self, options: nil)
        addSubview(uiView)
        uiView.frame = self.bounds
        uiView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
