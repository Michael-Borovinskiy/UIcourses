//
//  CommentsViewController.swift
//  AuthApp
//
//  Created by Михаил on 23.01.2021.
//

import UIKit

class CommentsViewController: UIViewController   {

    var newsComments: [Comment]?
    var textOfNews: String?
    var imageOfNews: UIImage?
    
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var uiTableView: UITableView!
    
    @IBOutlet weak var uiImage: UIImageView!{
    didSet{
        self.uiImage.layer.cornerRadius = 15
        self.uiImage.layer.masksToBounds = true
     }
    }
    @IBOutlet weak var uiText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiImage.image = imageOfNews
        uiText.text = textOfNews
        
        uiTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "comment")
    }
    
}

extension CommentsViewController: UITableViewDataSource ,UITableViewDelegate {

    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsComments!.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = uiTableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! CommentCell
    cell.setData(userImage: newsComments![indexPath.row].user.image,
                 userName: "\(newsComments![indexPath.row].user.surname) \(newsComments![indexPath.row].user.name)",
                 textComment: newsComments![indexPath.row].text)
    cell.isUserInteractionEnabled = true
    return cell
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    

}
