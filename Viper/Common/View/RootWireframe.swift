//
//  RootWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {
    func showRootViewControllerInWindow(viewController: UIViewController, window: UIWindow) {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.viewControllers = [viewController]
    }
}
