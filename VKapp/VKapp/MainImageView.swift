//
//  MainImageView.swift
//  VKapp
//
//  Created by Ovanes on 11.03.2021.
//

import UIKit

class MainImageView: UIView {

    @IBOutlet weak var mainImageCircle: UIImageView!
   // @IBOutlet weak var mainImageShadowFriend: UIView!
    @IBOutlet weak var mainImageContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

      

        mainImageContainer.setShadowWithCornerRadius(cornerRadius: mainImageContainer.frame.width * 0.5, shadowColor: .gray, shadowRadius: 5)
        
        mainImageCircle.makeMeCirle()
 
    }
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


extension UIView {
    
    func makeMeCirle() {
        layer.cornerRadius = frame.width * 0.5
        layer.masksToBounds = true
    }
    
    func setShadowWithCornerRadius(cornerRadius: CGFloat, shadowColor: UIColor, shadowOffset: CGSize = .zero,  shadowOpacity: Float = 1, shadowRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowRadius = shadowRadius
    }
}
