//
//  GroupData.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit


class Group {
    
    var image: String = ""
    var name: String = ""
    
    init(image img: String, name nm: String) {
        self.image = img
        self.name = nm
    }
    
   }

class GroupData  {
    

    var group = [Group]()
    var group2 = [Group]()
    
    init() {
        setUp()
    }
    
    func setUp () {
        group.append(Group(image: "group1", name: "Java"))
        group.append(Group(image: "group2", name: "Js"))
        group.append(Group(image: "group3", name: "Ruby"))
        group2.append(Group(image: "group4", name: "HumourSketches"))
        group2.append(Group(image: "group5", name: "Burgers"))
        group2.append(Group(image: "group1", name: "Java"))
        group2.append(Group(image: "group2", name: "Js"))
        group2.append(Group(image: "group3", name: "Ruby"))
    }
    
    
}
