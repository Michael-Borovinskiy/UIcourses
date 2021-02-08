//
//  AuthWKScreen.swift
//  AuthApp
//
//  Created by Михаил on 31.01.2021.
//

import UIKit
import WebKit

class AuthWKScreen: UIViewController {  // тестовый экран вывода данных VK API
    
    @IBOutlet weak var viewWK: WKWebView!{
        didSet{
            viewWK.navigationDelegate = self
        }
    }
    
    @IBOutlet weak var uiButtonFriend: UIButton!
    @IBOutlet weak var uiButtonGroup: UIButton!
    @IBOutlet weak var uiButtonPhotos: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    
    let networkManager: NetworkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWK.load(networkManager.getStartRequest())
        uiButtonFriend.addTarget(self, action: #selector(getFriends), for: .touchUpInside)
        uiButtonGroup.addTarget(self, action: #selector(getGroups), for: .touchUpInside)
        uiButtonPhotos.addTarget(self, action: #selector(getPhotos), for: .touchUpInside)
        search.addTarget(self, action: #selector(getGroupsWithSearch), for: .touchUpInside)
    }
    
    @objc func getFriends() {
        networkManager.getResFriends(stringURL: "https://api.vk.com/method/friends.get?fields=last_name&v=5.68&access_token=\(Session.instance.token)")
        }
        
    
    
    @objc func getGroups() {
        networkManager.getResGroups(stringURL: "https://api.vk.com/method/groups.get?extended=1&count=200&v=5.68&access_token=\(Session.instance.token)")
        }
    
    
    @objc func getPhotos() {
        networkManager.getResPhotos(stringURL: "https://api.vk.com/method/photos.getAll?extended=1&count=200&v=5.68&access_token=\(Session.instance.token)")
        }
    
    @objc func getGroupsWithSearch() {
        if self.textField.text != "" {
        guard let word = self.textField.text else {return}
        networkManager.getResGroups(stringURL: "https://api.vk.com/method/groups.search?q=\(String(describing: word))&count=200&v=5.68&access_token=\(Session.instance.token)")
        }
    }
    
    
}

    
extension AuthWKScreen: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            
            guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                decisionHandler(.allow)
                return
            }
            
            let params = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, param in
                    var dict = result
                    let key = param[0]
                    let value = param[1]
                    dict[key] = value
                    return dict
            }

            Session.instance.token = params["access_token"]!
            Session.instance.userId = Int(params["user_id"]!)!
            
            decisionHandler(.cancel)
        }

    
    
    
    
}
