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
        
        let user1 = User(image: "unnamed", name: "Вася", surname: "Крылов", photos: [UIImage(named: "unnamed")!], photoLikes: [2])
       
        let user2 = User(image: "d_1400x1100", name: "Александр", surname: "Петров", photos: [ UIImage(named: "d_1400x1100")!, UIImage(named: "garda")!,UIImage(named: "sunsystem")!], photoLikes: [0,14,5] )
        
        let user3 = User(image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "photo11")!, UIImage(named: "italy")!], photoLikes: [6,4] )
        
        let user4 = User(image: "sidyaschiy-muzhchina", name: "Ваня", surname: "Коломиец", photos: [UIImage(named: "sidyaschiy-muzhchina")!], photoLikes: [2])
        
        let user5 = User(image: "shatenka2", name: "Вера", surname: "Кондратенко", photos: [UIImage(named: "shatenka2")!], photoLikes: [100])
        
        let user6 = User(image: "shatenka", name: "Алена", surname: "Рылова", photos: [UIImage(named: "shatenka")!, UIImage(named: "d500_1000")!,UIImage(named: "garda")!], photoLikes: [1,14,5])
        
        let user7 = User(image: "oblozhka-6", name: "Ангелина", surname: "Ратова", photos: [UIImage(named: "oblozhka-6")!], photoLikes: [100])
        
        let user8 = User(image: "blondinka", name: "Света", surname: "Ильина", photos: [UIImage(named: "blondinka")!, UIImage(named: "oblozhka-6")!], photoLikes: [1,14])
        
        let user9 = User(image: "er3", name: "Ирина", surname: "Ганеева", photos: [UIImage(named: "er1")!, UIImage(named: "er2")!,UIImage(named: "er3")!], photoLikes: [1,14,5])
        
        
        
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
