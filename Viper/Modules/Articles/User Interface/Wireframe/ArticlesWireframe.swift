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
    
    let storyboardName = "ArticlesStoryboard"
    let articlesViewControllerIdentifier = "ArticlesViewController"
    
    // MARK: Instance Variables
    
    weak var articlesViewController: ArticlesViewController!
    var articlesPresenter: ArticlesPresenter!
    var rootWireframe: RootWireframe!
    var detailsWireframe: DetailsWireframe!
    
    // MARK: Public
    override init() {
        super.init()
        let articlesInteractor = ArticlesInteractor()
        self.articlesPresenter = ArticlesPresenter()
        self.articlesPresenter.interactor = articlesInteractor
        self.articlesPresenter.wireframe = self
        
        articlesInteractor.output = self.articlesPresenter
    }
    
    func presentArticlesInterfaceFromWindow(window: UIWindow) {
        self.articlesViewController = self.articlesViewControllerFromStoryboard()
        self.articlesViewController.presenter = self.articlesPresenter
        self.articlesPresenter.view = self.articlesViewController
        self.rootWireframe.showRootViewControllerInWindow(viewController: self.articlesViewController, window: window)
    }
    
    // MARK: ArticlesWireframeInput
    
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
    
    func presentDetailsInterfaceForArticle(article: Article) {
        self.detailsWireframe = DetailsWireframe()
        self.sendArticleToDetailsPresenter(detailsPresenter: self.detailsWireframe.detailsPresenter, article: article)
        self.detailsWireframe.presentArticleDetailsInterfaceFromViewController(controller: self.articlesViewController)
    }
    
    // MARK: Private
    private func sendArticleToDetailsPresenter(detailsPresenter: DetailsPresenter, article: Article) {
        detailsPresenter.article = article
    }
    
    private func articlesViewControllerFromStoryboard() -> ArticlesViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.articlesViewControllerIdentifier) as! ArticlesViewController
        return viewController
    }
}
