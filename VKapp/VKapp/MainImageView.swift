//
//  MainImageView.swift
//  VKapp
//
//  Created by Ovanes on 11.03.2021.
//

import UIKit

class MainImageView: UIView {

    @IBOutlet var mainImageFriend: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageFriend.layer.cornerRadius = 16
        mainImageFriend.layer.masksToBounds = true
        mainImageFriend.layer.shadowColor = UIColor.black.cgColor
        mainImageFriend.layer.shadowRadius = 10
        mainImageFriend.layer.shadowOpacity = 0.5
        mainImageFriend.layer.shadowOffset = CGSize(width: 20, height: 10)
        
 
    }
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
