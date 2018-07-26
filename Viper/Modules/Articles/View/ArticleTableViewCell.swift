//
//  ArticleTableViewCell.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    func setup(_ article: Article) {
        authorsLabel?.text = article.authors
        titleLabel?.text = article.title
        articleImageView.kf.setImage(
            with: URL(string: article.imageUrl),
            placeholder: UIImage(named: Constants.imagePlaceholder),
            options: nil,
            progressBlock: nil,
            completionHandler: nil
        )
    }
}
