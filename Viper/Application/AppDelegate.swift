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
    
    // MARK: Application Delegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let appDependencies = AppDependencies()
        appDependencies.configureDependencies()
        appDependencies.installRootViewControllerIntoWindow(window: self.window!)
        
        return true
    }
}

