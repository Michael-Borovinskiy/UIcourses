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
        
        let user4 = User(image: "face2", name: "Ваня", surname: "Коломиец", photos: [UIImage(named: "face2")!], photoLikes: [2])
        
        let user5 = User(image: "face3", name: "Вера", surname: "Кондратенко", photos: [UIImage(named: "face3pic1")!], photoLikes: [100])
        
        let user6 = User(image: "face3", name: "Алена", surname: "Рылова", photos: [UIImage(named: "face3pic1")!, UIImage(named: "face2pic1")!,UIImage(named: "face2pic2")!], photoLikes: [1,14,5])
        
        let user7 = User(image: "face3", name: "Ангелина", surname: "Ратова", photos: [UIImage(named: "face3pic1")!], photoLikes: [100])
        
        let user8 = User(image: "face3", name: "Света", surname: "Ильина", photos: [UIImage(named: "face3pic1")!, UIImage(named: "face2pic1")!,UIImage(named: "face2pic2")!], photoLikes: [1,14,5])
        
        let user9 = User(image: "face3", name: "Ирина", surname: "Ганеева", photos: [UIImage(named: "face3pic1")!, UIImage(named: "face2pic1")!,UIImage(named: "face2pic2")!], photoLikes: [1,14,5])
        
        
        
        user.append(user1)
        user.append(user2)
        user.append(user3)
        user.append(user4)
        user.append(user5)
        user.append(user6)
        user.append(user7)
        user.append(user8)
        user.append(user9)
        
    }
    
    
}
