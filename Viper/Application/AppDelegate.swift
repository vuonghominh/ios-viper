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
    
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let appDependencies = AppDependencies()
        appDependencies.configureDependencies()
        appDependencies.installRootViewControllerIntoWindow(window: self.window!)
        
        return true
    }
}

