//
//  TextNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit

class TextNewsTableViewCell: UITableViewCell {

 
    
    
    
    
  
    @IBOutlet var textNewsLabel: UILabel!
    
    
    func configure(with text: Newsfeed) {
        
        textNewsLabel.text = String(describing: text.text)
    
    
    }
   

}
