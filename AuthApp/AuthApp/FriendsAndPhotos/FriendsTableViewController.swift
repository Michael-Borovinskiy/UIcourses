//
//  FriendsTableViewController.swift
//  AuthApp
//
//  Created by Михаил on 06.12.2020.
//

import UIKit


class FriendsTableViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate, UISearchResultsUpdating {
    

    @IBOutlet weak var uiTableView: UITableView!
    
    var userData: UserData = UserData()
    var searchResult: [User] = []
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
    var searchController: UISearchController!
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchtext = searchController.searchBar.text {
            filterSearchText(searchtext)
            uiTableView.reloadData()
        }
    }

    func filterSearchText (_ searchText: String) {
       searchResult = userData.user.filter({(searchUser: User)-> Bool in
            let name = searchUser.name.range(of: searchText)
            let surname = searchUser.surname.range(of: searchText)
            return name != nil || surname != nil
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        searchController = UISearchController(searchResultsController: nil)
        uiTableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        uiTableView.register(UINib(nibName: "CustomCellForFriendsAndGroups", bundle: nil), forCellReuseIdentifier: "customCellForTable")
        uiTableView.register(UINib(nibName: "CustomHeaderForFriendScreen", bundle: nil),forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return listFirstSurnameLetters
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searchController.isActive  {
            return 0.0
        }
        return 25
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.searchBar.text == "" {
        return listFirstSurnameLetters.count
        } else {return 1}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive {
            return searchResult.count
        } else {
            let letter = listFirstSurnameLetters[section]
            guard let arrayFriends = dictLetterUser[letter] else {
                return 0
            }
            return arrayFriends.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellForTable", for: indexPath) as! CustomCellForFriendsAndGroups
        
        let user = (searchController.isActive ? searchResult[indexPath.row] : dictLetterUser[listFirstSurnameLetters[indexPath.section]]![indexPath.row])
        let image = UIImage(named: user.image)!
        let name = user.surname + " " + user.name
        
        cell.setValues(img: image,name: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if !searchController.isActive  {
            let view = uiTableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                    "sectionHeader") as! CustomHeaderForFriendScreen
            
            view.textLabel?.text = "\(listFirstSurnameLetters[section])"
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destination = storyboard.instantiateViewController(identifier: "ImagesViewController") as! ImagesViewController
        
        let friend: User
        if searchResult.isEmpty {
            let letter = listFirstSurnameLetters[indexPath.section]
            let arrayfriends = dictLetterUser[letter]
            friend = arrayfriends![indexPath.row]
        } else {
            friend = searchResult[indexPath.row]
        }
        
        destination.user = friend
        
        searchController.searchBar.text = ""
        searchController.isActive = false
        searchResult = []
        
        show(destination, sender: self)
        
    }
    
    
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "toCollection" else { return }
//        guard let destination = segue.destination as? ImagesViewController else { return }
//        destination.imgFriends = userData.user[uiTableView.indexPathForSelectedRow!.row].photos
//    }
//
    
    
}
