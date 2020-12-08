//
//  GroupsTableViewController.swift
//  AuthApp
//
//  Created by Михаил on 08.12.2020.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var uiTableView: UITableView!
    var data: [String] = ["Swift", "ObjectiveC", "Java", "JS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId2", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
        
    }
    
}
