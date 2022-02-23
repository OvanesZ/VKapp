//
//  ImageNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit

class ImageNewsTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

    
   
    
    @IBOutlet var imageNews: UIImageView!
    
    
    func configure(with image: News) {
        imageNews.kf.setImage(with: image.url)
    }
        // Configure the view for the selected state
}


