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

      
        webView.load(buildAuthRequest())
    }
    
    @IBAction func unwindAndClearCookies(segue: UIStoryboardSegue) {
        let cookieStore = webView.configuration.websiteDataStore.httpCookieStore
        
        cookieStore.getAllCookies {
            cookies in
            
            for cookie in cookies {
                cookieStore.delete(cookie)
            }
        }
        webView.load(buildAuthRequest())
    }
    
    private func buildAuthRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7806227"),
            URLQueryItem(name: "scope", value: "262148"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.92")
        ]
        
        return URLRequest(url: components.url!)
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
        
  
      
                
                    
                   
        
        performSegue(withIdentifier: "ShowMainViewController", sender: nil)
        decisionHandler(.cancel)
    }
}



