//
//  NetworkService.swift
//  VKapp
//
//  Created by Ованес on 06.04.2021.
//

import UIKit
import WebKit
import Alamofire




func loadGroups(token: String) {
    let baseUrl = "https://api.vk.com"
    let path = "/method/groups.get"

    let params: Parameters = [
        "access_token": token,
        "extended": 1,
        "count": 1,
        "v": "5.92"
    ]
   
//    Alamofire.request(baseUrl + path, method: .get, parameters: params).responseData {
//        response in
//        guard let jsonGroups = response.value else { return }
//
//        let json = JSON(data: jsonGroups)
       // print(jsonGroups)
    
    AF.request(baseUrl + path, method: .get, parameters: params).responseData {
        response in
        guard let dataGroups = response.value else { return }
        
        let json = JSON(data: dataGroups)
        
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
