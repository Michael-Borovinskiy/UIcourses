//
//  NewsCell.swift
//  AuthApp
//
//  Created by Михаил on 25.12.2020.
//

import UIKit


class NewsCell: UITableViewCell {

 

    var newsData: News?
    var counterLikes: Int?
    var isLiked: Bool = false
    var id: Int?

    
    
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
    
    func setData (text textLabel: String ,img nameImg: String, imgHeader nameImgHeader: String, userName uiUserName: String, countPhotoLikes photoLikes: Int, countNewsLikes newsLikes: Int, countComments comments: [Comment], countForwardMessage forwardMessage: Int, countLooksForNews looksForNews: Int) {
        self.uiLabel.text = textLabel
        self.uiImageView.image = UIImage(named: nameImg)
        self.uiImageHeader.image = UIImage(named: nameImgHeader)
        self.uiUserName.text = uiUserName
        self.buttonLike.setTitle("\(newsLikes)", for: .normal)
        self.commentLike.setTitle("\(comments.count)", for: .normal)
        self.forwardMessage.setTitle("\(forwardMessage)", for: .normal)
        
        let newLooksCount = looksForNews + 1
        newsData?.news[id!].looksForNews = newLooksCount             // обновление количества просмотров при загрузке ячейки
        self.buttonLooks.setTitle("\(newLooksCount)", for: .normal)
        
        counterLikes = newsLikes
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        uiImageView.layer.cornerRadius = 3
        buttonLike.addTarget(self, action: #selector(setLike), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // MARK: Actions
    
    func setLikes (countOfLikes cnt: Int) {
        self.buttonLike.setTitle("\(cnt)", for: .normal)
        counterLikes = cnt
    }
    
    func setIsLiked (bool isLiked: Bool) {
        self.isLiked = isLiked
        if isLiked {
            buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
        @objc func setLike() {
            if !isLiked  {
                animateLike()
                counterLikes = counterLikes! + 1
                self.buttonLike.setTitle(String(counterLikes!), for: .normal)
                self.buttonLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                newsData?.news[id!].newsLikes = counterLikes!
                newsData?.news[id!].isLiked.toggle()
                
                isLiked.toggle()
            }
            else  {
                animateLikeBack()
                counterLikes = counterLikes! - 1
                self.buttonLike.setTitle(String(counterLikes!), for: .normal)
                self.buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)
                newsData?.news[id!].newsLikes = counterLikes!
                newsData?.news[id!].isLiked.toggle()

                
                isLiked.toggle()
            }
        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        uiLabel?.text = nil
        uiImageView.image = nil
        uiImageHeader.image = nil
        uiUserName.text = nil
        buttonLike.setTitle("", for: .normal)
        commentLike.setTitle("", for: .normal)
        forwardMessage.setTitle("", for: .normal)
        buttonLooks.setTitle("", for: .normal)
        buttonLike.setImage(UIImage(systemName: "heart"), for: .normal)  // для переиспользованиых ячеек обновление лайков
        id = nil
        counterLikes = nil
        isLiked = false
    }
    
    func animateLike () {
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.3
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let translation = CABasicAnimation(keyPath: "position.y")
        translation.toValue = 0.1
        let alpha = CABasicAnimation(keyPath: "opacity")
        alpha.toValue = 0

        animationsGroup.animations = [translation, alpha]
        
        buttonLike.layer.add(animationsGroup,forKey: nil)
        
    }
    
    func animateLikeBack () {
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 0.3
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.3
        rotation.isCumulative = true
        rotation.repeatCount = 66.0
        rotation.speed = 60
        
        let scale: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 1
        scale.toValue = 0.3
        
        
        let opacity : CABasicAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacity.toValue = 0
        animationsGroup.animations = [scale, opacity, rotation]
        
        buttonLike.layer.add(animationsGroup, forKey:  nil)
        
    }
    
    
    
}
