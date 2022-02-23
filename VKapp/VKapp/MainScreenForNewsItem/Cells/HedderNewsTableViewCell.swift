//
//  HedderNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit
import Kingfisher


class HedderNewsTableViewCell: UITableViewCell {

    
    @IBOutlet var hedderLabel: UILabel!
    

    
    @IBOutlet var hedderImage: UIImageView!
    
    func configure(with hedder: News) {
        
//        hedderLabel.text = String(describing: hedder.text)
//        hedderImage.image = hedder.photosURL
       // hedderImage.kf.setImage(with: hedder.avatarURL)
        // Configure the view for the selected state
    }

}
