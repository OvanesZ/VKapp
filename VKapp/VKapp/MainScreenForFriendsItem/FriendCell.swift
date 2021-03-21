//
//  FriendCell.swift
//  VKapp
//
//  Created by Ovanes on 23.02.2021.
//

import UIKit

class FriendCell: UITableViewCell {


    @IBOutlet var friendLabel: UILabel!
    @IBOutlet public var friendImage: UIImageView!
    
    
    func configure(with friend: Friends) {
        //TODO: add some configure
        friendLabel.text = String(describing: friend.name)
        friendImage.image = friend.friendImage
    }

    
    // Анимация нажатия
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
