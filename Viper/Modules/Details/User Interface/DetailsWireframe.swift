//
//  DetailsWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/24/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class DetailsWireframe : NSObject {
    // MARK: Instance Variables
    var detailsPresenter: DetailsPresenter!
    var presentedViewController: UIViewController!
    
    func presentArticleDetailsInterfaceFromViewController(controller: UIViewController, article: Article) {
        let detailsViewController = DetailsViewController()
        detailsViewController.presenter = self.detailsPresenter
        
        self.detailsPresenter.prepareDetailsInterfaceForPresentation(article: article)
        
        controller.navigationController!.pushViewController(detailsViewController, animated: true)
    }
}
