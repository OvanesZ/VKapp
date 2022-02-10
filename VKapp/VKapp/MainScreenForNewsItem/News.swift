//
//  News.swift
//  VKapp
//
//  Created by Ованес Захарян on 09.02.2022.
//

import UIKit


class HedderNews {
    var name = ""
    var photo: UIImage?
    
    init(name: String, photo: UIImage?, textNews: String) {
        self.name = name
        self.photo = photo
    }
}


class ImageNews {
    var photoNews: UIImage?
    
    init(photoNews: UIImage?) {
    self.photoNews = photoNews
    }
}


class TextNews {
    var textNews = ""
}


class LikeAndCommentNews {
    var likeValue: Int?
    var commentText = ""
}





