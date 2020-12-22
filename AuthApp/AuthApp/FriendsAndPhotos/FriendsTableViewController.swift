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
    var listFirstSurnameLetters: [String] {
       return Array(Set(userData.user.map{String(($0.surname).prefix(1))})).sorted()
    }
    var dictLetterUser: [String:[User]] {
        var dictLetterUser = [String:[User]]()
        for letter in listFirstSurnameLetters {
            dictLetterUser[letter] = userData.user.filter{$0.surname.prefix(1) == letter}
        }
        return dictLetterUser
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.register(UINib(nibName: "CustomCellForFriendsAndGroups", bundle: nil), forCellReuseIdentifier: "customCellForTable")
        uiTableView.register(UINib(nibName: "CustomHeaderForFriendScreen", bundle: nil),forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listFirstSurnameLetters
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listFirstSurnameLetters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = listFirstSurnameLetters[section]
        guard let arrayFriends = dictLetterUser[letter] else {
            return 0
        }
        
        return arrayFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellForTable", for: indexPath) as! CustomCellForFriendsAndGroups
        
        let letter = listFirstSurnameLetters[indexPath.section]
        let arrayfriends = dictLetterUser[letter]
        let friend = arrayfriends![indexPath.row]
        
        
        let image = UIImage(named: friend.image)!
        let name = friend.surname + " " + friend.name
        
        cell.setValues(img: image,name: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = uiTableView.dequeueReusableHeaderFooterView(withIdentifier:
                       "sectionHeader") as! CustomHeaderForFriendScreen
        
        view.textLabel?.text = "\(listFirstSurnameLetters[section])"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(identifier: "ImagesViewController") as! ImagesViewController
        let letter = listFirstSurnameLetters[indexPath.section]
        let arrayfriends = dictLetterUser[letter]
        let friend = arrayfriends![indexPath.row]
        
        destination.user = friend
        show(destination, sender: self)
    }
    
    
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "toCollection" else { return }
//        guard let destination = segue.destination as? ImagesViewController else { return }
//        destination.imgFriends = userData.user[uiTableView.indexPathForSelectedRow!.row].photos
//    }
//
    
    
}
