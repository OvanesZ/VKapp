//
//  News.swift
//  VKapp
//
//  Created by Ованес Захарян on 09.02.2022.
//

import UIKit


class News {
    var name = ""
    var photo: UIImage?
    var textNews = ""
    
    init(name: String, photo: UIImage?, textNews: String) {
        self.name = name
        self.photo = photo
        self.textNews = textNews
    }
}




