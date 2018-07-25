//
//  DetailsViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/25/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController : UIViewController, DetailsViewInterface {
    // MARK: Constants
    let kNavigationTitle = "Details"
    let kImagePlaceHolder = "image-placeholder"
    
    // MARK: Outlets
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    
    // MARK: Instance Variables
    var presenter: DetailsPresenter!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.updateView()
        self.navigationController!.title = self.kNavigationTitle.localized
    }
    
    // MARK: DetailsViewInterface
    func showArticleDetails(article: Article) {
        self.setupArticleImage(article: article)
        self.authorsLabel.text = article.authors
        self.titleLabel.text = article.title
    }
    
    // MARK: Private
    func setupArticleImage(article: Article) {
        if (article.imageUrl != nil) {
            self.articleImageView.kf.setImage(with: URL(string: article.imageUrl!), placeholder: nil)
        } else {
            self.articleImageView.image = UIImage(named: self.kImagePlaceHolder)
        }
    }
}
