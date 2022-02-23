//
//  News.swift
//  VKapp
//
//  Created by Ованес Захарян on 09.02.2022.
//

import UIKit
import SwiftyJSON
import SwiftUI
import RealmSwift











struct NewsfeedResponse: Decodable {
    let response: NewsfeedContainer
}

struct NewsfeedContainer: Decodable {
    let items: [Newsfeed]
}


class Newsfeed: Decodable {
   
    var text = ""
    var commentCount: Int = 0
    var likesCount: Int = 0
    var commentCountPost: Int = 0
    var likesCountPost: Int = 0
    
   
    enum CodingKeys: String, CodingKey {
        case text
        case attachments
        case comments
        case likes
    }
    
    
    enum CommentKeys: String, CodingKey {
        case count
        case commentCountPost = "can_post"
    }
    
    enum LikesKeys: String, CodingKey {
        case count
        case likesCountPost = "can_like"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
  
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try values.decode(String.self, forKey: .text)

        let commentValues = try values.nestedContainer(keyedBy: CommentKeys.self, forKey: .comments)
        self.commentCount = try commentValues.decode(Int.self, forKey: .count)
        self.commentCountPost = try commentValues.decode(Int.self, forKey: .commentCountPost)

        let likesValue = try values.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
        self.likesCount = try likesValue.decode(Int.self, forKey: .count)
        self.likesCountPost = try likesValue.decode(Int.self, forKey: .likesCountPost)
    }
    
    public static let shared = Newsfeed()
}



