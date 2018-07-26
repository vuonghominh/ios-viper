//
//  RootWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class RootWireframe {
    func showRootViewController(_ viewController: UIViewController, inWindow window: UIWindow) {
        let navigationController = UINavigationController()
        navigationController.viewControllers = [viewController]
        
        window.backgroundColor = UIColor.white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
