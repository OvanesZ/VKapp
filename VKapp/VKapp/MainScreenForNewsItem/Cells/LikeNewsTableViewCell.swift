//
//  LikeNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit

class LikeNewsTableViewCell: UITableViewCell, AnyNewsCell {


    
    
//    @IBOutlet var likeItemsLabel: UILabel!
//
//
//    func configure(with like: News) {
//
//   //     likeItemsLabel.text = String(describing: like.likeValue)
//
//
//    }
    
    
    private let likeImageView = UIImageView()
    private let likesCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with news: News) {
        
    }

}
