//
//  AppDependencies.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class AppDependencies {
    // MARK: Instance Variables
    var articlesWireframe: ArticlesWireframe
    
    // MARK: Public
    init() {
        let rootWireframe = RootWireframe()
        
        articlesWireframe = ArticlesWireframe()
        articlesWireframe.rootWireframe = rootWireframe
    }
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        articlesWireframe.presentArticlesInterfaceFromWindow(window)
    }
}
