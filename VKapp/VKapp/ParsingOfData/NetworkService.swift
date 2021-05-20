//
//  NetworkService.swift
//  VKapp
//
//  Created by Ованес on 06.04.2021.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON



// MARK: - load friend ID

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


// MARK: - load photo and name friend to ID

func loadFriendsNameAndPhoto(token: String, userID: String = "34678630") {
    let baseUrl = "https://api.vk.com"
    let path = "/method/users.get"
    
    let params: Parameters = [
        "access_token": token,
        "user_ids": userID,
        "fields": "photo_100",
        "v": "5.89"
    ]
    
    AF.request(baseUrl + path, method: .get, parameters: params).responseJSON {
        response in
        guard let jsonFriends = response.value else { return }
        
        print(jsonFriends)
    }
}

// MARK: - search groups

func searchGroups(token: String, search: String = "электрика") {
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

    // MARK: - load user groups

func loadGroup(token: String) {
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
        guard let jsonLoadGroups = response.value else { return }
        
        print(jsonLoadGroups)
    }
}
