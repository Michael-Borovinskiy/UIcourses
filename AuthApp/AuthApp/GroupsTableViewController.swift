//
//  GroupsTableViewController.swift
//  AuthApp
//
//  Created by Михаил on 08.12.2020.
//

import UIKit


class GroupsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var uiTableView: UITableView!
    var groupData: GroupData = GroupData()
    var groupFromAllGroups: Group?    // для добавления группы с AllGroupsTableViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        uiTableView.register(UINib(nibName: "CustomCellForFriendsAndGroups", bundle: nil), forCellReuseIdentifier: "customCellForTable")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var nameOfgroup: String = ""
        var groupDataNames:[String] = [""]
        
        if groupFromAllGroups != nil {
            nameOfgroup = groupFromAllGroups!.name
            groupDataNames = groupData.group.map{String($0.name)}
        }
        
        if groupFromAllGroups != nil && !groupDataNames.contains(nameOfgroup) {     // добавление в мои группы
            groupData.group.append(groupFromAllGroups!)
            uiTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (groupData.group.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCellForTable", for: indexPath) as! CustomCellForFriendsAndGroups //MyGroupCell
            let image = UIImage(named: groupData.group[indexPath.row].image)!
            let name = groupData.group[indexPath.row].name
        
        cell.setValues(img: image,name: name)
        
             return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {  // удаление из моих групп
        if editingStyle == .delete {
            groupData.group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            groupFromAllGroups = nil
        }
    }
    
    
    
    
}
