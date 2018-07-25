//
//  AppDependencies.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class AppDependencies: NSObject {
    var articlesWireframe: ArticlesWireframe!
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        
        // Articles Module Classes
        let articlesInteractor = ArticlesInteractor()
        let articlesPresenter = ArticlesPresenter()
        let articlesWireframe = ArticlesWireframe()
        
        // Details Module Classes
        let detailsPresenter = DetailsPresenter()
        let detailsWireframe = DetailsWireframe()
        
        // Articles Module Setup
        articlesInteractor.output = articlesPresenter
        articlesPresenter.interactor = articlesInteractor
        articlesPresenter.wireframe = articlesWireframe
        
        articlesWireframe.rootWireframe = rootWireframe
        articlesWireframe.articlesPresenter = articlesPresenter
        articlesWireframe.detailsWireframe = detailsWireframe
        
        self.articlesWireframe = articlesWireframe
        
        // Details Module Setup
        detailsPresenter.wireframe = detailsWireframe
        detailsWireframe.detailsPresenter = detailsPresenter
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        self.articlesWireframe.presentArticlesInterfaceFromWindow(window: window)
    }
}
