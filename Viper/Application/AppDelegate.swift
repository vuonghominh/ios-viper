//
//  AppDelegate.swift
//  Viper
//
//  Created by Leon Ho on 7/16/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let appDependencies = AppDependencies()
        appDependencies.configureDependencies()
        appDependencies.installRootViewControllerIntoWindow(window: self.window!)
        
        return true
    }
}

