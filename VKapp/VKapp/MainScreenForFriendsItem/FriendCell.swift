//
//  FriendCell.swift
//  VKapp
//
//  Created by Ovanes on 23.02.2021.
//

import UIKit
import Kingfisher

class FriendCell: UITableViewCell {


    @IBOutlet var friendLabel: UILabel!
    @IBOutlet public var friendImage: UIImageView!
    
    
    func configure(with friend: Friends) {
        //TODO: add some configure
        friendLabel.text = String(describing: (friend.firstName + " " + friend.lastName))
      //  friendImage.image = friend.friendImage
        friendImage.kf.setImage(with: friend.friendImage)
    }

    
    // Анимация нажатия
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
