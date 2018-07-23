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
        self.setupRootViewController()
        return true
    }

    // MARK: Private Methods
    func setupRootViewController() {
        let articlesViewController = ArticlesViewController()
        let articlesPresenter = ArticlesPresenter()
        let articlesInteractor = ArticlesInteractor()
        
        articlesViewController.articlesPresenter = articlesPresenter
        articlesPresenter.provider = articlesInteractor
        articlesPresenter.view = articlesViewController
        articlesInteractor.output = articlesPresenter
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.white;
        self.window!.rootViewController = articlesViewController
        self.window!.makeKeyAndVisible()
    }
}

