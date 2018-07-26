//
//  DetailsViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController : UIViewController {
    var presenter: DetailsPresentation!
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
        navigationController!.title = Localization.Details.navigationBarTitle
    }
}

extension DetailsViewController: DetailsView {
    func showDetails(forArticle article: Article) {
        authorsLabel.text = article.authors
        titleLabel.text = article.title
        articleImageView.kf.setImage(
            with: URL(string: article.imageUrl),
            placeholder: UIImage(named: Constants.imagePlaceholder),
            options: nil,
            progressBlock: nil,
            completionHandler: nil
        )
    }
}
