//
//  DetailsWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/24/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class DetailsWireframe {
    // MARK: Constants
    let storyboardName = "DetailsStoryboard"
    let detailsViewControllerIdentifier = "DetailsViewController"
    
    // MARK: Instance Variables
    weak var detailsViewController: DetailsViewController!
    var detailsPresenter: DetailsPresenter!
    var presentedViewController: UIViewController!
    
    // MARK: Public
    init() {
        detailsPresenter = DetailsPresenter()
    }
    
    func presentArticleDetailsInterfaceFromViewController(_ controller: UIViewController) {
        detailsViewController = detailsViewControllerFromStoryboard()
        detailsViewController.presenter = detailsPresenter
        detailsPresenter.view = detailsViewController
        detailsPresenter.wireframe = self
        
        controller.navigationController!.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: Private
    private func detailsViewControllerFromStoryboard() -> DetailsViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: detailsViewControllerIdentifier) as! DetailsViewController
        return viewController
    }
}
