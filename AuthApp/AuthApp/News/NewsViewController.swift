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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! NewsCell
        cell.setData(newsData.news[indexPath.row].text, newsData.news[indexPath.row].photo)
        
        return cell
    }
    

}
