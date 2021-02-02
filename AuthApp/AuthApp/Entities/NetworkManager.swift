//
//  NetworkManager.swift
//  AuthApp
//
//  Created by Михаил on 01.02.2021.
//

import Foundation

class NetworkManager {
    
    func getStartRequest () -> URLRequest {
        
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
    
    
    func getRes (stringURL string: String) //, completionHandler: @escaping ((Any) -> ()))
    {
        
        let session = URLSession.shared

        let task = session.dataTask(with: URL(string: string)!) { (data, response, error) in
            
//            let decoder = JSONDecoder()
//
//            do{
//                let words = try decoder.decode([String].self, from: data!)//}
//                completionHandler(words)
//            }catch {
//                print(error.localizedDescription)
//            }
        
        let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json!)
        }

        task.resume()
    }
    

}
