//
//  MainImageView.swift
//  VKapp
//
//  Created by Ovanes on 11.03.2021.
//

import UIKit

class MainImageView: UIView {

    @IBOutlet var mainImageFriend: UIImageView!
    @IBOutlet var mainImageShadowFriend: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageFriend.layer.cornerRadius = 16
        mainImageFriend.layer.masksToBounds = true
      
        
        
        mainImageShadowFriend.layer.shadowColor = UIColor.black.cgColor
        mainImageShadowFriend.layer.shadowRadius = 10
        mainImageShadowFriend.layer.shadowOpacity = 0.5
        mainImageShadowFriend.layer.shadowOffset = CGSize(width: 20, height: 10)
        mainImageShadowFriend.layer.masksToBounds = false
        mainImageShadowFriend.backgroundColor != .clear
      
        
       
 
    }
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
