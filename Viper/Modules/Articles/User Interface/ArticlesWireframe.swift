//
//  ArticlesWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesWireframe: NSObject {
    var articlesPresenter: ArticlesPresenter!
    var articlesViewController: ArticlesViewController!
    var rootWireframe: RootWireframe!
    
    func presentArticlesInterfaceFromWindow(window: UIWindow) {
        self.articlesViewController = ArticlesViewController()
        self.articlesViewController.articlesPresenter = self.articlesPresenter
        
        self.articlesPresenter.view = self.articlesViewController
        
        self.rootWireframe.showRootViewControllerInWindow(viewController: self.articlesViewController, window: window)
    }
}
