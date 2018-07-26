//
//  DetailsRouter.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class DetailsRouter: DetailsWireframe {
    static func assembleModule(_ article: Article) -> UIViewController {
        let view = R.storyboard.detailsStoryboard.detailsViewController()
        let presenter = DetailsPresenter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.article = article
        
        return view!
    }
}
