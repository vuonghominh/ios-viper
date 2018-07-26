//
//  AppDelegate.swift
//  Viper
//
//  Created by Leon Ho on 7/16/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let appDependencies = AppDependencies()
        appDependencies.installRootViewControllerIntoWindow(window!)
        
        return true
    }
}

