//
//  FriendsTableViewController.swift
//  AuthApp
//
//  Created by Михаил on 06.12.2020.
//

import UIKit


class FriendsTableViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    @IBOutlet weak var uiTableView: UITableView!

    var userData: UserData = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userData.user.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! FriendsCell
            let image = UIImage(named: userData.user[indexPath.row].image)!
            let name = userData.user[indexPath.row].name
        
        cell.setValues(img: image,name: name)
        
             return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toCollection" else { return }
        guard let destination = segue.destination as? ImagesViewController else { return }
        destination.imgFriends = userData.user[uiTableView.indexPathForSelectedRow!.row].photos
    }
    
    
    
}
