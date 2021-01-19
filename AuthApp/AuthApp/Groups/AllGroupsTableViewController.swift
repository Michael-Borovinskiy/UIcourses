//
//  AllGroupsTableViewController.swift
//  AuthApp
//
//  Created by Михаил on 08.12.2020.
//

import UIKit

class AllGroupsTableViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    
    @IBOutlet weak var uiTableView: UITableView!

    var groupData: GroupData = GroupData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        uiTableView.register(UINib(nibName: "CustomCellForFriendsAndGroups", bundle: nil), forCellReuseIdentifier: "customCellForTable")
    }
    
    // MARK: DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (groupData.group2.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellForTable", for: indexPath) as! CustomCellForFriendsAndGroups //AllGroupsCell
            let image = UIImage(named: groupData.group2[indexPath.row].image)!
            let name = groupData.group2[indexPath.row].name
        
        cell.setValues(img: image,name: name)
             return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = self.navigationController?.popViewController(animated: true)
        let previousViewController = self.navigationController?.viewControllers.last as! GroupsTableViewController
        previousViewController.groupFromAllGroups = groupData.group2[uiTableView.indexPathForSelectedRow!.row]
    }
    
}
