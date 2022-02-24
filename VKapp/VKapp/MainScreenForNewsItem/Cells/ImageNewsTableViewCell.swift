//
//  ImageNewsTableViewCell.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit

class ImageNewsTableViewCell: UITableViewCell, AnyNewsCell {

    private let newsImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(newsImageView)
        newsImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with news: News) {
        newsImageView.kf.setImage(with: news.url)
    }
}


