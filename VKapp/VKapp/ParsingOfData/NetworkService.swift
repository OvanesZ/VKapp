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
    
    func loadPhoto(token: String, owner: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
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




// MARK: - get news
    
    func loadNewsfeed (token: String, completionHandler: @escaping (Result<[NewsfeedItems], Error>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/newsfeed.get"
        let params: Parameters = [
            "access_token": token,
            "filters": "post",
            "v": "5.131",
            "source_ids": "friends",
            "count": 10
        ]
        AF.request(baseUrl + path, method: .get, parameters: params).responseData { response in
          
                switch response.result {
                case let .success(data):
                    do {
                       let newsfeedItems = try JSONDecoder().decode(NewsfeedResponse.self, from: data)
                        let newsfeed = newsfeedItems.response.items
                        completionHandler(.success(newsfeed))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
        }
    }
    
    
    
    
    func loadNewsfeedItemsWithProfile (token: String, completionHandler: @escaping (Result<[NewsfeedItems], AppError>) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/newsfeed.get"
        let params: Parameters = [
            "access_token": token,
            "filters": "post",
            "v": "5.131",
            "source_ids": "friends",
            "count": 10
        ]
        AF.request(baseUrl + path, method: .get, parameters: params).responseData { response in
          
              
        }
    }
    
    
    
    
    
    
    private var urlConstructor = URLComponents()
    
    func loadNews (completion: @escaping ([NewsfeedItems]) -> Void, onError: @escaping (Error) -> Void) {
//        let baseUrl = "https://api.vk.com"
//        let path = "/method/newsfeed.get"
//        let params: Parameters = [
//            "access_token": token,
//            "filters": "post",
//            "v": "5.131",
//            "source_ids": "friends",
//            "count": 10
//        ]
        
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/newsfeed.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "filters", value: "post"),
            URLQueryItem(name: "start_from", value: "next_from"),
            URLQueryItem(name: "count", value: "10"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131"),
        ]
        
        
//        let url = URL(string: (baseUrl + path))
        let session = URLSession.shared
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
           
            if error != nil {
                onError(AppError.errorTask)
            }
            
            guard let data = data else {
                onError(AppError.noDataProvided)
                return
            }
            
            guard var news = try? JSONDecoder().decode(NewsfeedResponse.self, from: data).response.items else {
                onError(AppError.failedToDecode)
                return
            }
            guard let profiles = try? JSONDecoder().decode(NewsfeedResponse.self, from: data).response.profiles else {
                onError(AppError.failedToDecode)
                print("Error profiles")
                return
            }
            
            for i in 0..<news.count {
                let profile = profiles.first(where: { $0.id == news[i].sourceID })
            news[i].avatarURL = profile?.avatarURL
            news[i].creatorName = (profile?.firstName ?? "") + (profile?.lastName ?? "")
            }
            
//            DispatchQueue.main.async {
//                completion(news)
//            }
            completion(news)
        }
        task.resume()
    }
    
    
    
    
    
    func loadNews(token: String, completionHandler: @escaping ((Result<[News], Error>) -> Void)) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/newsfeed.get"
        let params: Parameters = [
            "access_token": token,
            "filters": "post",
            "v": "5.131",
            "source_ids": "friends",
            "count": 10
        ]
    
        AF.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case let .failure(error):
                completionHandler(.failure(error))
            case let .success(json):
                
                let dispatchGroup = DispatchGroup()
                
                var news: [News] = []
                var profiles: [Friends] = []
                var groupsJson: [JSON] = []
                
                DispatchQueue.global().async(group: dispatchGroup) {
                    let newsJson = JSON(json)["response"]["items"].arrayValue
                    
                    news = newsJson.map(News.init)
                }
                
                DispatchQueue.global().async(group: dispatchGroup) {
                    let profilesJson = JSON(json)["response"]["profiles"].arrayValue
                    profiles = profilesJson.map { Friends(json: $0) }
                }
                
                DispatchQueue.global().async(group: dispatchGroup) {
                    groupsJson = JSON(json)["response"]["groups"].arrayValue
                }
                
               
                dispatchGroup.notify(queue: DispatchQueue.global()) {
                    let newsWithoutSources = news.compactMap { news -> News? in
                        if news.sourceId > 0 {
                            var newsCopy = news
                            guard let newsSource = profiles.first(where: { $0.friendID == news.sourceId }) else { return nil }
                            newsCopy.source = newsSource
                            return newsCopy
                        } else {
                            print("TODO add group parsing")
                            return nil
                        }
                    }
                    
                    
                    DispatchQueue.main.async {
                        completionHandler(.success(newsWithoutSources))
                    }
                }   
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
    
    
    
    














