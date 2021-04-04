//
//  VKLoginController.swift
//  VKapp
//
//  Created by Ovanes on 28.03.2021.
//

import UIKit
import WebKit
import Alamofire


class VKLoginController: UIViewController {
    
    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7806227"),
            URLQueryItem(name: "scope", value: "262144"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        let request = URLRequest(url: components.url!)
        webView.load(request)
        
    }

}


extension VKLoginController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard navigationResponse.response.url?.path == "/blank.html",
              let fragment = navigationResponse.response.url?.fragment else {
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
        
        //print(params)
        
        Session.shared.token = params["access_token"] ?? ""
        Session.shared.userID = params["user_id"] ?? ""
        
        /// get groups of user
        let userToken = Session.shared.token
        loadGroups(token: userToken)
        
        /// get friends ID
        loadFriendsID(token: userToken)
        
        //Friend.shared.friendID = params
        
        /// get friend name and some data
        loadFriendsNameAndPhoto(token: userToken)
        
        /// get groups by search
        searchGroups(token: userToken, search: "music")
        
        performSegue(withIdentifier: "ShowMainViewController", sender: nil)
        decisionHandler(.cancel)
    }
    
    
    func loadGroups(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"

        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "count": 5,
            "v": "5.92"
        ]
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            response in
            guard let jsonGroups = response.value else { return }

            print(jsonGroups)
        }
    }
    
    
    func loadFriendsID(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "order": "hints",
            "count": 5,
            "v": "5.130"
        ]
        
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            response in
            guard let jsonFriendsID = response.value else { return }
            
            print(jsonFriendsID)
            
        }
    }

    
    
    
    func loadFriendsNameAndPhoto(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/users.get"
        
        let params: Parameters = [
            "access_token": token,
            "user_ids": 34678630,
            "fields": "photo_100",
            "v": "5.89"
        ]
        
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            response in
            guard let jsonFriends = response.value else { return }
            
            print(jsonFriends)
        }
    }
    
    
    
    func searchGroups(token: String, search: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.search"

        let params: Parameters = [
            "q": search,
            "access_token": token,
            "count": 5,
            "v": "5.54"
        ]
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON {
            response in
            guard let jsonSearchGroups = response.value else { return }

            print(jsonSearchGroups)
        }
    }
    
    
    
    
}



