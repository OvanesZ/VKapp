//
//  News.swift
//  VKapp
//
//  Created by Ованес Захарян on 09.02.2022.
//

import UIKit
import SwiftyJSON


// MARK: - Response

struct NewsfeedResponse: Codable {
    let response: NewsfeedContainer
}

struct NewsfeedContainer: Codable {
    var items: [NewsfeedItems]
    var profiles: [NewsfeedProfiles]
}
// MARK: - Items

struct NewsfeedItems: Codable {
   
    var text = ""
    var attachments: [Attachments]?
    var likes: Likes
    var comments: Comments
    let sourceID: Int
    var creatorName: String?
    var avatarURL: String?
    var photosURL: [String]? {
        get {
            let photosURL = attachments?.compactMap{ $0.photo?.sizes?.last?.url }
            return photosURL
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case text
        case attachments
        case likes
        case comments
        case sourceID
        case creatorName
    }
}

struct Likes: Codable {
    let count: Int
}

struct Comments: Codable {
    let count: Int
}

struct Attachments: Codable {
    let type: String?
    let photo: PhotoNewsAvatar?
}

struct PhotoNewsAvatar: Codable {
    let id: Int?
    let ownerId: Int?
    let sizes: [SizesPhoto]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case sizes
    }
}

struct SizesPhoto: Codable {
    let type: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
    }
}



// MARK: - Profiles

struct NewsfeedProfiles: Codable {
    var firstName = ""
    var lastName = ""
    var id = 0
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
        case avatarURL = "photo_100"
    }
}
enum AppError: Error {
    case noDataProvided
    case failedToDecode
    case errorTask
    case notCorrectUrl
}



// MARK: - model for SwiftyJson


protocol NewsSource {
    var name: String { get }
    var imageUrlString: String { get }
}

extension NewsSource {
    var imageUrl: URL? { URL(string: imageUrlString) }
}


struct News {
    var url: URL? { urlString.flatMap { URL(string: $0) } }
    let name: String
    let urlString: String?
    let isLiked: Bool
    let sourceId: Int
    let date: Date
    
    var source: NewsSource?
    //let description: String?
    //let date: Date?
    //let pics: [UIImage?]
    
    init(json: JSON) {
        self.name = json["text"].stringValue
        self.urlString = json["attachments"].arrayValue.first(where: { $0["type"] == "photo" })?["photo"]["sizes"].arrayValue.last?["url"].stringValue
        self.isLiked = json["is_favorite"].boolValue
        self.sourceId = json["source_id"].intValue
        self.date = Date(timeIntervalSince1970: json["date"].doubleValue)
    }
}
