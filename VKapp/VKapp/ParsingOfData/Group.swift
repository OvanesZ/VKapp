//
//  Group.swift
//  VKapp
//
//  Created by Ованес on 06.04.2021.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON


class Group: Decodable {
    let items: [Items]
}



class Items: Decodable {
    var id: Int = 0
    var name: String = ""
    var screenName: String = ""


    enum CodingKeys: String, CodingKey {
        case screenName = "screen_name"
        case id
        case name
    }
   
    convenience required init(from decoder: Decoder) throws {
        self.init()
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.screenName = try values.decode(String.self, forKey: .screenName)
    }
    
    
    
}








// MARK: - respons group

/* 
 
 
    {
        "response": {
            "count": 93,
            "items": [
                {
                    "id": 39644772,
                    "name": "Северодвинск life",
                    "screen_name": "severodvinsk_life",
                    "is_closed": 0,
                    "type": "page",
                    "is_admin": 0,
                    "is_member": 1,
                    "is_advertiser": 0,
                    "photo_50": "https://sun1-22.userapi.com/s/v1/ig1/nWR1zrMIrutgOcDFNNlyQN0g6RRDkLL1McyUTc8uAh31CzeGhItZqWp2l4ADmNIm4pFQ8EFz.jpg?size=50x0&quality=96&crop=14,14,398,398&ava=1",
                    "photo_100": "https://sun1-22.userapi.com/s/v1/ig1/O3pDhmFnSqx2WtGsKvDtBjQjjmKwEeX-kN5RxVbBoncEisoNjnJ-KsPU5GqhJu57fttxL5_Y.jpg?size=100x0&quality=96&crop=14,14,398,398&ava=1",
                    "photo_200": "https://sun1-22.userapi.com/s/v1/ig1/CJAFYjpLhFolLBtSOUYCz_x7ZwsW6THeSw_9QdUa5PZ_SmB4lE3-nnLekVusZ6fW2LH8j0mh.jpg?size=200x0&quality=96&crop=14,14,398,398&ava=1"
                }
            ]
        }
    }
 
 
*/
