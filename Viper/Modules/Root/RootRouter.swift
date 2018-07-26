//
//  RootRouter.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    func presentArticlesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ArticlesRouter.assembleModule()
    }
}
