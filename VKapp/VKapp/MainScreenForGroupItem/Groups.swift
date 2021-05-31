//
//  File.swift
//  VKapp
//
//  Created by Ovanes on 26.02.2021.
//

import UIKit
import SwiftyJSON
import RealmSwift



//"response": {
//    "count": 96,
//    "items": [
//        {
//            "id": 49466089,
//            "name": "CASIO | CT X | MZ X | WK | CTK | Стили Styles",
//            "screen_name": "vkcasio",
//            "is_closed": 0,
//            "type": "group",
//            "is_admin": 0,
//            "is_member": 1,
//            "is_advertiser": 0,
//            "photo_50": "https://sun1-28.userapi.com/s/v1/if1/66anNr_GpBSbcSFavZHzJQJ0-FA5Cp2OiVqIR_vfudF87AnJAgq8TBrEO_JrN6agY8A1zkUN.jpg?size=50x0&quality=96&crop=68,0,516,516&ava=1",
//            "photo_100": "https://sun1-28.userapi.com/s/v1/if1/QLVEy46Pati0i9ggBUsp-XooboNHWUEfCpoFcHx2PkIL2lOrxCv8trz8Cgv-G-0xRym16Unl.jpg?size=100x0&quality=96&crop=68,0,516,516&ava=1",
//            "photo_200": "https://sun1-28.userapi.com/s/v1/if1/i03DYVkeAftQv6O0OJ3SJirdESv9VKaPXZqvuj0kZPOSlWdRUKVeXPz1KKrMKHFkDrY0bbVc.jpg?size=200x0&quality=96&crop=68,0,516,516&ava=1"
//        }




struct MyGroups: Equatable {
    let name: String
   // let groupImage: UIImage? = nil
    let photoUrl: String
    var iconUrl: URL? { URL(string: "\(photoUrl)") }
    
    init(json: SwiftyJSON.JSON) {
        self.name = json["name"].stringValue
        self.photoUrl = json["photo_100"].stringValue
      
    }
}

 
/*
class Session: RealmSwift.Object {
    @objc dynamic var token: String = ""
    @objc dynamic var userID: String = ""
    
    convenience init(token: String, userID: String) {
        self.init()
        
        self.token = token
        self.userID = userID
    }
    public static let shared = Session()
}
*/


//class MyGroups: RealmSwift.Object {
//    @objc dynamic var name: String = ""
//    @objc dynamic var photoUrl: String = ""
//    @objc dynamic var iconUrl: URL? { URL(string: "\(photoUrl)") }
//
//
//
//
//    init(json: SwiftyJSON.JSON) {
//        self.name = json["name"].stringValue
//        self.photoUrl = json["photo_100"].stringValue
//    }
//}



