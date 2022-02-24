//
//  TextNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit
import SnapKit

class TextNewsTableViewCell: UITableViewCell, AnyNewsCell {

    //    @IBOutlet var textNewsLabel: UILabel!
    
        private let newsTextLabel = UILabel()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(newsTextLabel)
            newsTextLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        public func configure(with news: News) {
            newsTextLabel.text = news.name
        }
    
    }
   



//func configure(with text: News) {
//textNewsLabel.text = String(describing: text.name)
