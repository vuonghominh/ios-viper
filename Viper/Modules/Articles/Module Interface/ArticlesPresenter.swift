//
//  ArticlesPresenter.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class ArticlesPresenter: ArticlesOutput {
    weak var view: ArticlesViewInterface!
    var wireframe: ArticlesWireframe!
    
    var provider: ArticlesProvider!
    
    var articles: [Article]!
    
    enum ArticlesSortBy {
        case Date
        case Title
        case Author
        case Website
    }
    
    // MARK: ArticlesOutput
    
    func receiveArticles(articles: [Article]) {
        if articles.count > 0 {
            self.articles = articles
            view.showArticlesList(articles: articles)
        } else {
            view.showNoContentScreen()
        }
    }
    
    // MARK: Public
    
    func requestArticles() {
        self.provider.downloadArticles()
    }
    
    func sortArticles() {
        self.wireframe.presentArticlesSortOptions()
    }
    
    func sortArticlesList(sortBy: ArticlesSortBy) {
        switch sortBy {
        case .Date:
            view.showArticlesList(articles: self.articles)
            break
        case .Title:
            view.showArticlesList(articles: self.articles)
            break
        case .Author:
            view.showArticlesList(articles: self.articles)
            break
        case .Website:
            view.showArticlesList(articles: self.articles)
            break
        }
    }
}
