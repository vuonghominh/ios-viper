//
//  ArticlesPresenter.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class ArticlesPresenter: ArticlesModuleInterface, ArticlesInteractorOutput {
    // MARK: Instance Variables
    weak var view: ArticlesViewInterface!
    var wireframe: ArticlesWireframe!
    
    var interactor: ArticlesInteractorInput!
    
    var articles: [Article]!
    
    // MARK: Enums
    
    enum ArticlesSortBy {
        case date
        case title
        case author
        case website
    }
    
    // MARK: ArticlesModuleInterface
    func updateView() {
        interactor.fetchArticles()
    }
    
    func sortArticles() {
        wireframe.presentArticlesSortOptions()
    }
    
    func showDetails(forArticle article: Article) {
        wireframe.presentDetailsInterfaceForArticle(article)
    }
    
    // MARK: ArticlesInteractorOutput
    func articlesFetched(_ articles: [Article]) {
        if articles.count > 0 {
            self.articles = articles
            view.showArticlesList(articles)
        } else {
            view.showNoContentScreen()
        }
    }
    
    // MARK: Public
    func sortArticlesList(sortBy: ArticlesSortBy) {
        switch sortBy {
        case .date:
            self.view.showArticlesList(self.articles)
            break
        case .title:
            self.view.showArticlesList(self.articles)
            break
        case .author:
            self.view.showArticlesList(self.articles)
            break
        case .website:
            self.view.showArticlesList(self.articles)
            break
        }
    }
}
