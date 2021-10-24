//
//  Friends.swift
//  VKapp
//
//  Created by Ovanes on 24.02.2021.
//

import UIKit
import SwiftyJSON
import RealmSwift

//
//{
//    "response": {
//        "count": 197,
//        "items": [
//            {
//                "first_name": "Ви",
//                "id": 34678630,
//                "last_name": "Ка",
//                "can_access_closed": true,
//                "is_closed": true,
//                "photo_100": "https://sun1-25.userapi.com/s/v1/if1/d8_mMdK7UB_qJKaKLjQEOpBC9U7mSHo4GQ9jI2j9yntRswjMbh_YSZBGEO6avS2uptf41bSY.jpg?size=100x0&quality=96&crop=129,370,590,590&ava=1",
//                "nickname": "I",
//                "track_code": "5260c7239r4y4lAdy0k1X2k9JvjSQ2SsEvFUzjxWSRaOxZlLBLub1W3VbhmcSmBQX5iwUUYnBKEF6jGg"
//            },






//struct Friends {
//    let firstName: String
//    let lastName: String
//    let friendImageUrlText: String
//    var friendImage: URL? { URL(string: "\(friendImageUrlText)") }
//    let photosArray: [UIImage?] = []
//    let friendID: String
//
//    init(json: SwiftyJSON.JSON) {
//        self.firstName = json["first_name"].stringValue
//        self.lastName = json["last_name"].stringValue
//        self.friendImageUrlText = json["photo_100"].stringValue
//        self.friendID = json["id"].stringValue
//    }
//}

class Friends: Object {
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var friendImageUrlText = ""
    @objc dynamic var friendImage: URL? { URL(string: "\(friendImageUrlText)") }
    var photosArray: [UIImage?] = []
    @objc dynamic var friendID = ""
    
    convenience init(json: SwiftyJSON.JSON) {
        self.init()
        
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.friendImageUrlText = json["photo_100"].stringValue
        self.friendID = json["id"].stringValue
    }
}


