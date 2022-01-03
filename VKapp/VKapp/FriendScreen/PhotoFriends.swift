//
//  PhotoFriends.swift
//  VKapp
//
//  Created by Ованес Захарян on 01.06.2021.
//

import UIKit
import SwiftyJSON
import RealmSwift


/*
{
    "response": {
        "count": 5,
        "items": [
            {
                "album_id": -6,
                "date": 1490969591,
                "id": 456239086,
                "owner_id": 34678630,
                "has_tags": false,
                "post_id": 1806,
                "sizes": [
                    {
                        "height": 130,
                        "url": "https://sun9-25.userapi.com/impf/c837538/v837538630/2ceb4/CXfXgM-QIRU.jpg?size=97x130&quality=96&sign=8685b75c3a9637cfd5b8cb02b1cb9f74&c_uniq_tag=wD__6j3xhpUrSEJk50yScypBMIm709_flxKZ4OhGaTI&type=album",
                        "type": "m",
                        "width": 97
                    },
*/




class Photo {

    private let url: String
    var iconUrl: URL? { URL(string: "\(url)")}
    
    init(json: JSON) {

        let firstJson = json["sizes"].arrayValue.first
        self.url = firstJson?["url"].stringValue ?? ""
    }
}


