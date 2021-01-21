//
//  NewsViewController.swift
//  AuthApp
//
//  Created by Михаил on 25.12.2020.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    var newsData: News = News()
    
    @IBOutlet weak var uiTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        uiTableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "news")
    }
    
    // MARK: DataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! NewsCell
        
        cell.id = newsData.news[indexPath.row].id
        
        cell.setData(text: newsData.news[indexPath.row].text,
                     img: newsData.news[indexPath.row].photo,
                     imgHeader: newsData.news[indexPath.row].user.image,
                     userName: "\(newsData.news[indexPath.row].user.surname) \(newsData.news[indexPath.row].user.name)",
                     countPhotoLikes: newsData.news[indexPath.row].photoLikes,
                     countNewsLikes: newsData.news[indexPath.row].newsLikes,
                     countComments: newsData.news[indexPath.row].comments,
                     countForwardMessage: newsData.news[indexPath.row].forwardMessages,
                     countLooksForNews: newsData.news[indexPath.row].looksForNews
        )
        cell.newsData = newsData
        cell.setIsLiked(bool: newsData.news[indexPath.row].isLiked)
        

        return cell
    }
    
}
