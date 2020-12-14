//
//  FriendsTableViewController.swift
//  AuthApp
//
//  Created by Михаил on 06.12.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet weak var uiTableView: UITableView!
    var data: [String] = ["Василий Иванов", "Александр Петров" , "Елена Смирнова", "Егор Сидоров", "Ксения Малинина"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
        
    }
    
}
