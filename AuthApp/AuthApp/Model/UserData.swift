//
//  UserData.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit


struct User {
    var image: String
    var name: String
    
}

class UserData  {
     
    var user = [User]()
    
    init() {
        setUp()
    }
    
    func setUp () {
        user.append(User(image: "face1", name: "Вася Крылов"))
        user.append(User(image: "face2", name: "Александр Петров"))
        user.append(User(image: "face3", name: "Елена Смирнова"))
    }
    
    
}
