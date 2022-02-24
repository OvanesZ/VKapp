//
//  Friends.swift
//  VKapp
//
//  Created by Ovanes on 24.02.2021.
//

import UIKit
import SwiftyJSON
import RealmSwift



class Friends: Object, NewsSource {
    var name: String { "\(firstName) \(lastName)" }
    var imageUrlString: String { friendImageUrlText }
    
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var friendImageUrlText = ""
    @objc dynamic var friendImage: URL? { URL(string: "\(friendImageUrlText)") }
    var photosArray: [UIImage?] = []
    @objc dynamic var friendID = 0
    let photosFriendAlbum = List<Photo>()
    
    override static func primaryKey() -> String? {
        return "friendID"
    }
    
    convenience init(json: SwiftyJSON.JSON) {
        self.init()
        
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.friendImageUrlText = json["photo_100"].stringValue
        self.friendID = json["id"].intValue
    }
    public static let shared = Friends()
}



