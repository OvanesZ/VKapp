//
//  FriendsViewCell.swift
//  VKapp
//
//  Created by Ovanes on 04.03.2021.
//

import UIKit
import Kingfisher

class FriendsViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FriendViewCell"
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet var likeControllButton: LikeControlView!
    
    
//    func configure(with friend: Friends) {
//        //TODO: add some configure
//        friendLabel.text = String(describing: (friend.firstName + " " + friend.lastName))
//      //  friendImage.image = friend.friendImage
//        friendImage.kf.setImage(with: friend.friendImage)
//    }
    
    func configure(with friends: Photo) {
        icon.kf.setImage(with: friends.iconUrl)
    }
    
    
    
}
