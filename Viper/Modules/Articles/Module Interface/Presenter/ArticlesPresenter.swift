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
        case Date
        case Title
        case Author
        case Website
    }
    
    // MARK: ArticlesModuleInterface
    func updateView() {
        self.interactor.fetchArticles()
    }
    
    func sortArticles() {
        self.wireframe.presentArticlesSortOptions()
    }
    
    func showDetailsForArticle(article: Article) {
        self.wireframe.presentDetailsInterfaceForArticle(article: article)
    }
    
    func articlesFetched(articles: [Article]) {
        if articles.count > 0 {
            self.articles = articles
            self.view.showArticlesList(articles: articles)
        } else {
            self.view.showNoContentScreen()
        }
    }
    
    // MARK: Public
    func sortArticlesList(sortBy: ArticlesSortBy) {
        switch sortBy {
        case .Date:
            self.view.showArticlesList(articles: self.articles)
            break
        case .Title:
            self.view.showArticlesList(articles: self.articles)
            break
        case .Author:
            self.view.showArticlesList(articles: self.articles)
            break
        case .Website:
            self.view.showArticlesList(articles: self.articles)
            break
        }
    }
    
    func presentDetailsScreenForArticle(article: Article) {
        self.wireframe.presentDetailsInterfaceForArticle(article: article)
    }
}
