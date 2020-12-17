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
    var photos: Array<UIImage> = []
    
}

class UserData  {
     
    var user = [User]()
    
    init() {
        setUp()
    }
    
    func setUp () {
        
        let user1 = User(image: "face1", name: "Вася Крылов", photos: [UIImage(named: "face1")!])
       
        let user2 = User(image: "face2", name: "Александр Петров", photos: [ UIImage(named: "face2")!, UIImage(named: "face2pic1")!,UIImage(named: "face2pic2")!] )
        
        let user3 = User(image: "face3", name: "Елена Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!] )
        
        user.append(user1)
        user.append(user2)
        user.append(user3)
    }
    
    
}
