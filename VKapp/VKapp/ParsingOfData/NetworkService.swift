//
//  NetworkService.swift
//  VKapp
//
//  Created by Ованес on 06.04.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class NetworkService {
    
    private let token = Session.shared.token

// MARK: - load friend ID

func loadFriendsID(token: String, completion: @escaping (Result<[Friends], Error>) -> Void) {
    let baseUrl = "https://api.vk.com"
    let path = "/method/friends.get"
    let params: Parameters = [
        "access_token": token,
        "order": "hints",
        "fields": "nickname, photo_100",
     //   "count": 5,
        "v": "5.130"
    ]
    
    AF.request(baseUrl + path, method: .get, parameters: params).response {
        response in
        switch response.result {
        case .failure(let error):
            completion(.failure(error))
        case .success(let data):
            guard let data = data,
                  let json = try? JSON(data: data) else { return }
        

            let friendsJson = json["response"]["items"].arrayValue
            let friends = friendsJson.map { Friends(json: $0) }
            
          
            
            completion(.success(friends))
        }
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

func searchGroups(token: String, search: String = "", completion: @escaping (Result<[MyGroups], Error>) -> Void) {
    let baseUrl = "https://api.vk.com"
    let path = "/method/groups.search"

    let params: Parameters = [
        "q": search,
        "access_token": token,
        "count": 50,  ////////////    by default return 20 groups
        "v": "5.54"
    ]
    AF.request(baseUrl + path, method: .get, parameters: params).response {
        response in
        switch response.result {
        case .failure(let error):
            completion(.failure(error))
        case .success(let data):
            guard let data = data,
                  let jsonSearchGroups = try? JSON(data: data) else { return }
            
            
            let searchGroupsJson = jsonSearchGroups["response"]["items"].arrayValue
            let searchGroups = searchGroupsJson.map { MyGroups(json: $0) }
            
            completion(.success(searchGroups))
        }
    }
}

    // MARK: - load user groups

func loadGroup(token: String, completion: @escaping (Result<[MyGroups], Error>) -> Void) {
    let baseUrl = "https://api.vk.com"
    let path = "/method/groups.get"
    let params: Parameters = [
        "access_token": token,
        "extended": 1,
      //  "count": 1,
        "v": "5.92"
    ]
    
    AF.request(baseUrl + path, method: .get, parameters: params).response {
        response in
        switch response.result {
        case .failure(let error):
            completion(.failure(error))
        case .success(let data):
            guard let data = data,
                  let json = try? JSON(data: data) else { return }
            
     
            let groupsJson = json["response"]["items"].arrayValue
            let groups = groupsJson.map { MyGroups(json: $0) }
            
            
            completion(.success(groups))
        }
    }
}


// MARK: - get all photos for users

//private let owner = friendsID
    
    func loadPhoto(token: String, owner: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
    let baseUrl = "https://api.vk.com"
    let path = "/method/photos.get"
    let params: Parameters = [
        "access_token": token,
        "extended": 1,
        "v": "5.131",
        "owner_id": owner,
        "album_id": "profile",
        "photo_sizes": 1
    ]
    
    AF.request(baseUrl + path, method: .get, parameters: params).response {
        response in
        switch response.result {
        case .failure(let error):
            completion(.failure(error))
        case .success(let data):
            guard let data = data,
                  let json = try? JSON(data: data) else { return }
            
     
            let friendPhotoJson = json["response"]["items"].arrayValue
            let friendPhoto = friendPhotoJson.map { Photo(json: $0) }

            completion(.success(friendPhoto))
        }
    }
}
}
