//
//  GroupCell.swift
//  VKapp
//
//  Created by Ovanes on 25.02.2021.
//

import UIKit
import Kingfisher

class GroupCell: UITableViewCell {

    @IBOutlet var groupsLabel: UILabel!
    @IBOutlet var groupImage: UIImageView!
    
    
    func configure(with groups: MyGroups) {
        groupsLabel.text = String(describing: groups.name)
        //groupImage.image = groups.groupImage
        groupImage.kf.setImage(with: groups.iconUrl)
        
    }

}
