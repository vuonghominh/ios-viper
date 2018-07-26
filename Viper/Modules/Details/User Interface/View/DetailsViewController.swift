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
        presenter.updateView()
        navigationController!.title = kNavigationTitle.localized()
    }
    
    // MARK: DetailsViewInterface
    func showArticleDetails(_ article: Article) {
        if let image = article.imageUrl {
            articleImageView.kf.setImage(with: URL(string: image)!, placeholder: nil)
        } else {
            articleImageView.image = UIImage(named: kImagePlaceHolder)
        }
        authorsLabel.text = article.authors
        titleLabel.text = article.title
    }
}
