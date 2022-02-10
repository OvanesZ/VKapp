//
//  HedderNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit

class HedderNewsTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    
    @IBOutlet var hedderLabel: UILabel!
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    
    
    
    func configure(with hedder: HedderNews) {
        
        hedderLabel.text = String(describing: hedder.name)

        // Configure the view for the selected state
    }

}
