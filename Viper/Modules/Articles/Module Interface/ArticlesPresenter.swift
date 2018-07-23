//
//  ArticlesPresenter.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class ArticlesPresenter: ArticlesOutput {
    weak var provider: ArticlesProvider!
    weak var view: ArticlesViewInterface!
    
    func receiveArticles(articles: [Article]) {
        if articles.count > 0 {
            view.showArticlesList(articles: articles)
        } else {
            view.showNoContentScreen()
        }
    }
    
    func requestArticles() {
        self.provider.downloadArticles()
    }
}
