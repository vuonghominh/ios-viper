//
//  ArticlesPresenter.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class ArticlesPresenter: ArticlesPresentation {
    weak var view: ArticlesView?
    var interactor: ArticlesUseCase!
    var router: ArticlesWireframe!
    
    var articles: [Article] = [] {
        didSet {
            if articles.count > 0 {
                view?.showArticlesData(articles)
            } else {
                view?.showNoContentScreen()
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchArticles()
        view?.showActivityIndicator()
    }
    
    func didClickSortButton() {
        router.presentSortOptions { option in
            self.sortArticlesList(sortBy: option)
        }
    }
    
    func didSelectArticle(_ article: Article) {
        router.presentDetails(forArticle: article)
    }
    
    fileprivate func sortArticlesList(sortBy: ArticlesSortType) {
        switch sortBy {
            case .date:
                view?.showArticlesData(articles)
            case .title:
                view?.showArticlesData(articles)
            case .author:
                view?.showArticlesData(articles)
            case .website:
                view?.showArticlesData(articles)
        }
    }
    
}

extension ArticlesPresenter: ArticlesInteractorOutput {
    func articlesFetched(_ articles: [Article]) {
        self.articles = articles
        view?.hideActivityIndicator()
    }
    
    internal func articlesFetchFailed() {
        view?.showNoContentScreen()
        view?.hideActivityIndicator()
    }
}
