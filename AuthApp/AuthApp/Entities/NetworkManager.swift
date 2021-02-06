//
//  NetworkManager.swift
//  AuthApp
//
//  Created by Михаил on 01.02.2021.
//

import Foundation

class NetworkManager {
    
    
    func getStartRequest () -> URLRequest { // загрузка страницы авторизации
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7746892"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        return URLRequest(url: urlComponents.url!)
    }
    
    func getRes (stringURL string: String) // вывод сырых данных групп, фото
    {
        
        let session = URLSession.shared
        
        let task =  session.dataTask(with: URL(string: string)!) { (data, response, error) in
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json!)
        }
        task.resume()
        
    }
    
    
    
    func getResFriends (stringURL string: String) //  вывод "имя фамилия" всех друзей
    {
        
        let session = URLSession.shared
        
        session.dataTask(with: URL(string: string)!) { (data, response, error) in
            
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            
            let array = json as! NSDictionary
            let response = array["response"] as! Dictionary<String,Any>
            let items = response["items"] as! NSMutableArray
            
            for item in items {
                let dict = item as! Dictionary<String,Any>
                let lastName = dict["last_name"] as! String
                let firstName = dict["first_name"] as! String
                print(firstName,lastName)
                
            }
        }.resume()
        
        
    }
    
}
