//
//  Session.swift
//  AuthApp
//
//  Created by Михаил on 30.01.2021.
//

import Foundation

class Session {
    
    static var instance = Session()
    
    var token: String = ""
    var userId: Int = 0
    
    private init(){}
    
    func setUserData(userIdStr userId:Int, tokenStr token: String) {
        self.userId = userId
        self.token = token
    }
    
    
}
