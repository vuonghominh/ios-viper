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
        
        let articlesInteractor = ArticlesInteractor()
        let articlesPresenter = ArticlesPresenter()
        let articlesWireframe = ArticlesWireframe()
        
        articlesInteractor.output = articlesPresenter
        
        articlesPresenter.provider = articlesInteractor
        articlesPresenter.wireframe = articlesWireframe
        
        articlesWireframe.rootWireframe = rootWireframe
        articlesWireframe.articlesPresenter = articlesPresenter
        
        self.articlesWireframe = articlesWireframe
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        self.articlesWireframe.presentArticlesInterfaceFromWindow(window: window)
    }
}
