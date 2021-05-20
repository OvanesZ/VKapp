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
        
  
        let userToken = Session.shared.token
        
                    /// get groups of user
                    loadGroup(token: userToken)
                    
                    /// get friends ID
                    loadFriendsNameAndPhoto(token: userToken, userID: "43674819")
                    
                    
                    //Friend.shared.friendID = params
                    
                    /// get friend name and some data
                    loadFriendsNameAndPhoto(token: userToken)
                    
                    /// get groups by search
                    searchGroups(token: userToken, search: "музыка")
        
        performSegue(withIdentifier: "ShowMainViewController", sender: nil)
        decisionHandler(.cancel)
    }
}


