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
    
    // MARK: Animation components
    
    @IBOutlet weak var uiViewSearchAnimCell: UIView!
    
    @IBOutlet weak var round1: UIView!{
        didSet{
            self.round1.layer.cornerRadius = round1.frame.width/2.0
        }
    }
    @IBOutlet weak var round2: UIView! {
        didSet{
            self.round2.layer.cornerRadius = round1.frame.width/2.0
        }
    }
    @IBOutlet weak var round3: UIView!{
        didSet{
            self.round3.layer.cornerRadius = round1.frame.width/2.0
        }
    }
    @IBOutlet weak var uiSearchAnimationCell: UIView!
    
    // MARK: SearchController and func
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchtext = searchController.searchBar.text {
            filterSearchText(searchtext)
            
            uiTableView.reloadData()
        }
    }


    func filterSearchText (_ searchText: String) {
        animateSearchPoints()
        searchResult = userData.user.filter({(searchUser: User)-> Bool in
            let name = searchUser.name.range(of: searchText)
            let surname = searchUser.surname.range(of: searchText)
        
            return name != nil || surname != nil
        })
        
    }
    
    func setSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.placeholder = "Поиск по ФИО"
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        uiTableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        uiTableView.register(UINib(nibName: "CustomCellForFriendsAndGroups", bundle: nil), forCellReuseIdentifier: "customCellForTable")
        uiTableView.register(UINib(nibName: "CustomHeaderForFriendScreen", bundle: nil),forHeaderFooterViewReuseIdentifier: "sectionHeader")
        setSearchController()
        setConstraintsForAnimatedRounds ()
    }
    
    // MARK: DataSource
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searchController.isActive {
            return nil
        } else {
            return listFirstSurnameLetters
        }
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
        destination.title = "Галерея"
        
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
        round1.layer.removeAllAnimations()
        round2.layer.removeAllAnimations()
        round3.layer.removeAllAnimations()
        
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    // MARK: Animation
    
    func animateSearchPoints() {
        UIView.animate(withDuration: 0.8, delay: 0.4, options: .allowAnimatedContent, animations: {self.round1.alpha = 1}, completion: {_ in UIView.animate(withDuration: 0.2, animations: {self.round1.alpha = 0})})
        UIView.animate(withDuration: 0.8, delay: 0.6, options: .allowAnimatedContent, animations:
            {self.round2.alpha = 1}, completion: {_ in UIView.animate(withDuration: 0.2, animations:
            {self.round2.alpha = 0})})
        UIView.animate(withDuration: 0.8, delay: 0.8, options: .allowAnimatedContent, animations: {self.round3.alpha = 1}, completion: {_ in UIView.animate(withDuration: 0.2, animations:{self.round3.alpha = 0})})
        

    }
    
    // MARK: Constraints
    
    func setConstraintsForAnimatedRounds () {   // установлены констрейнты для размещения анимированных кругов по центру экрана относительно ячейки superview
        
        round1.translatesAutoresizingMaskIntoConstraints = false
        round2.translatesAutoresizingMaskIntoConstraints = false
        round3.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: round1!, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: round2, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: -20)
        let verticalConstraint = NSLayoutConstraint(item: round1!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiSearchAnimationCell, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 2)
        let widthConstraint = NSLayoutConstraint(item: round1!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: round1!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
            NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

        let horizontalConstraint2 = NSLayoutConstraint(item: round2!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiSearchAnimationCell, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant:
                                                        0)
        let verticalConstraint2 = NSLayoutConstraint(item: round2!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiSearchAnimationCell, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 2)
        let widthConstraint2 = NSLayoutConstraint(item: round2!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
        let heightConstraint2 = NSLayoutConstraint(item: round2!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
            NSLayoutConstraint.activate([horizontalConstraint2, verticalConstraint2, widthConstraint2, heightConstraint2])

        let horizontalConstraint3 = NSLayoutConstraint(item: round3!, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: round2, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 20)
        let verticalConstraint3 = NSLayoutConstraint(item: round3!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiSearchAnimationCell, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 2)
        let widthConstraint3 = NSLayoutConstraint(item: round3!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
        let heightConstraint3 = NSLayoutConstraint(item: round3!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 20)
            NSLayoutConstraint.activate([horizontalConstraint3, verticalConstraint3, widthConstraint3, heightConstraint3])
        
    }
    
    
    
}

