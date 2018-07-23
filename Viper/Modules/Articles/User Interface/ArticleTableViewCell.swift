//
//  ArticleTableViewCell.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ArticleTableViewCell : UITableViewCell {
    static let kArticlesCellIdentifier = "articlesCellIdentifier"
    let kImagePlaceHolder = "image-placeholder"
    
    // MARK: Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Lazy Instantiation
    
    lazy var articleImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.regularFontWithSize(size: 20)
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.black_87()
        
        return label
    }()
    
    lazy var authorLabel: UILabel! = {
        let label = UILabel()
        label.font = UIFont.regularFontWithSize(size: 14)
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.black_54()
        
        return label
    }()
    
    // MARK: Private
    private func setupView() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = UITableViewCellSelectionStyle.none

        self.contentView.addSubview(self.articleImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.authorLabel)
    }
    
    private func setupConstraints() {
        self.articleImageView.snp.makeConstraints {(make) -> Void in
            make.top.equalTo(self.contentView.snp.top)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
        }
        
        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.articleImageView.snp.bottom).offset(15)
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
        }
        
        self.authorLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
        }
    }
    
    // MARK: Public
    func setupWithArticle(article: Article) {
        self.authorLabel?.text = article.authors!
        self.titleLabel?.text = article.title!
        if (article.imageUrl != nil) {
            self.articleImageView.kf.setImage(with: URL(string: article.imageUrl!), placeholder: nil)
        } else {
            self.articleImageView.image = UIImage(named: self.kImagePlaceHolder)
        }
    }
}
