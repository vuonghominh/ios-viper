//
//  ArticleTableViewCell.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell : UITableViewCell {
    // MARK: Constants
    static let kArticlesCellIdentifier = "ArticlesCellIdentifier"
    let kImagePlaceHolder = "image-placeholder"
    
    // MARK: Outlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    // MARK: Life Cycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
