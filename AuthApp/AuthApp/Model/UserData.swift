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
    var surname: String
    var photos: Array<UIImage> = []
    var photoLikes: Array<Int> = []
    
}

class UserData  {
     
    var user = [User]()
    
    init() {
        setUp()
    }
    
    func setUp () {
        
        let user1 = User(image: "face1", name: "Вася", surname: "Крылов", photos: [UIImage(named: "face1")!], photoLikes: [2])
       
        let user2 = User(image: "face2", name: "Александр", surname: "Петров", photos: [ UIImage(named: "face2")!, UIImage(named: "face2pic1")!,UIImage(named: "face2pic2")!], photoLikes: [0,14,5] )
        
        let user3 = User(image: "face3", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "face3")!, UIImage(named: "face3pic1")!], photoLikes: [6,4] )
        
        user.append(user1)
        user.append(user2)
        user.append(user3)
    }
    
    
}
