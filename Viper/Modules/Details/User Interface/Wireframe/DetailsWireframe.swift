//
//  DetailsWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/24/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class DetailsWireframe : NSObject {
    // MARK: Constants
    let storyboardName = "DetailsStoryboard"
    let detailsViewControllerIdentifier = "DetailsViewController"
    
    // MARK: Instance Variables
    weak var detailsViewController: DetailsViewController!
    var detailsPresenter: DetailsPresenter!
    var presentedViewController: UIViewController!
    
    // MARK: Public
    override init() {
        super.init()
        self.detailsPresenter = DetailsPresenter()
    }
    
    func presentArticleDetailsInterfaceFromViewController(controller: UIViewController) {
        self.detailsViewController = self.detailsViewControllerFromStoryboard()
        self.detailsViewController.presenter = self.detailsPresenter
        self.detailsPresenter.view = detailsViewController
        self.detailsPresenter.wireframe = self
        
        controller.navigationController!.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: Private
    private func detailsViewControllerFromStoryboard() -> DetailsViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.detailsViewControllerIdentifier) as! DetailsViewController
        return viewController
    }
}
