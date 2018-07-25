//
//  AppDependencies.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class AppDependencies: NSObject {
    // MARK: Instance Variables
    var articlesWireframe: ArticlesWireframe!
    
    // MARK: Public
    override init() {
        let rootWireframe = RootWireframe()
        
        self.articlesWireframe = ArticlesWireframe()
        self.articlesWireframe.rootWireframe = rootWireframe
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        self.articlesWireframe.presentArticlesInterfaceFromWindow(window: window)
    }
}
