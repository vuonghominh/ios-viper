//
//  ArticlesWireframe.swift
//  Viper
//
//  Created by Leon Ho on 7/23/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesWireframe: NSObject {
    // MARK: Constants
    
    let alertSortByTitle = "ALERT_SORT_BY_TITLE"
    let dateString = "ALERT_DATE_OPTION"
    let titleString = "ALERT_TITLE_OPTION"
    let authorString = "ALERT_AUTHOR_OPTION"
    let webSiteString = "ALERT_WEBSITE_OPTION"
    let cancelString = "ALERT_CANCEL_OPTION"
    
    // MARK: Instance Variables
    
    var articlesPresenter: ArticlesPresenter!
    var articlesViewController: ArticlesViewController!
    var rootWireframe: RootWireframe!
    
    // MARK: Public
    
    func presentArticlesInterfaceFromWindow(window: UIWindow) {
        self.articlesViewController = ArticlesViewController()
        self.articlesViewController.articlesPresenter = self.articlesPresenter
        
        self.articlesPresenter.view = self.articlesViewController
        
        self.rootWireframe.showRootViewControllerInWindow(viewController: self.articlesViewController, window: window)
    }
    
    func presentArticlesSortOptions() {
        let alert = UIAlertController(title: self.alertSortByTitle.localized, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: self.dateString.localized, style: .default,
                                      handler: {(alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .Date)}))
        alert.addAction(UIAlertAction(title: self.titleString.localized, style: .default,
                                      handler: {(alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .Title)}))
        alert.addAction(UIAlertAction(title: self.authorString.localized, style: .default,
                                      handler: {(alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .Author)}))
        alert.addAction(UIAlertAction(title: self.webSiteString.localized, style: .default,
                                      handler: {(alert: UIAlertAction!) in self.articlesPresenter.sortArticlesList(sortBy: .Website)}))
        alert.addAction(UIAlertAction(title: self.cancelString.localized, style: .cancel, handler: nil))
        
        self.articlesViewController.present(alert, animated: true, completion: nil)
    }
}
