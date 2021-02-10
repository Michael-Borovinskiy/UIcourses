//
//  UserData.swift
//  AuthApp
//
//  Created by Михаил on 11.12.2020.
//

import UIKit


class User {
    var id: Int? = nil
    var image: String = ""
    var name: String = ""
    var surname: String = ""
    var photos: Array<UIImage> = []
    var photoLikes: Array<Int> = []
    var isLiked: Array<Bool> = []
    
    init(id:Int, image:String, name:String, surname:String, photos:Array<UIImage>,photoLikes:Array<Int>, isLiked:Array<Bool>) {
        self.id = id
        self.image = image
        self.name = name
        self.surname = surname
        self.photos = photos
        self.photoLikes = photoLikes
        self.isLiked = isLiked
    }
    
}

class UserData  {
     
    var user = [User]()
    
    init() {
        setUp()
    }
    
    func setUp () {
        
        let user1 = User(id: 0, image: "unnamed", name: "Вася", surname: "Крылов", photos: [UIImage(named: "unnamed")!], photoLikes: [2], isLiked: [false])
       
        let user2 = User(id: 1, image: "d_1400x1100", name: "Александр", surname: "Петров", photos: [ UIImage(named: "d_1400x1100")!, UIImage(named: "garda")!,UIImage(named: "sunsystem")!], photoLikes: [0,14,5], isLiked: [false,false,false] )
        
        let user3 = User(id: 2,image: "photo11", name: "Елена",surname: "Смирнова", photos: [UIImage(named: "photo11")!, UIImage(named: "italy")!], photoLikes: [6,4], isLiked: [false,false] )
        
        let user4 = User(id: 3,image: "sidyaschiy-muzhchina", name: "Ваня", surname: "Коломиец", photos: [UIImage(named: "sidyaschiy-muzhchina")!], photoLikes: [2], isLiked: [false])
        
        let user5 = User(id: 4,image: "shatenka2", name: "Вера", surname: "Кондратенко", photos: [UIImage(named: "shatenka2")!], photoLikes: [100],isLiked: [false])
        
        let user6 = User(id: 5,image: "shatenka", name: "Алена", surname: "Рылова", photos: [UIImage(named: "shatenka")!, UIImage(named: "d500_1000")!,UIImage(named: "garda")!], photoLikes: [1,14,5], isLiked: [false,false,false])
        
        let user7 = User(id: 6,image: "oblozhka-6", name: "Ангелина", surname: "Ратова", photos: [UIImage(named: "oblozhka-6")!], photoLikes: [100],isLiked: [false])
        
        let user8 = User(id: 7,image: "blondinka", name: "Света", surname: "Ильина", photos: [UIImage(named: "blondinka")!, UIImage(named: "oblozhka-6")!], photoLikes: [1,14],isLiked: [false, false])
        
        let user9 = User(id: 8,image: "er3", name: "Ирина", surname: "Ганеева", photos: [UIImage(named: "er1")!, UIImage(named: "er2")!,UIImage(named: "er3")!], photoLikes: [1,14,5], isLiked: [false,false,false])
        
        
        
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
