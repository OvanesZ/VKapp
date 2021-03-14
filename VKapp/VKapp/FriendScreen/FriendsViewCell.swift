//
//  FriendsViewCell.swift
//  VKapp
//
//  Created by Ovanes on 04.03.2021.
//

import UIKit

class FriendsViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FriendViewCell"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet var likeControllButton: LikeControlView!
    
    
//    override func awakeFromNib() {
//        self.awakeFromNib()
//        likeControllButton.addTarget(self, action: #selector(likeTapped), for: .valueChanged)
//    }
//  
//    
//    @objc func likeTapped() {
//        if likeControllButton.isLiked {
//            print("User liked")
//        } else {
//            print("User disLiked")
//        }
//    }
    
    
}
