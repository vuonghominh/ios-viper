//
//  ArticlesContract.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

protocol ArticlesView: IndicatableView {
    var presenter: ArticlesPresentation! { get set }
    
    func showNoContentScreen()
    func showArticlesData(_ articles: [Article])
}

protocol ArticlesPresentation: class {
    var view: ArticlesView? { get set }
    var interactor: ArticlesUseCase! { get set }
    var router: ArticlesWireframe! { get set }
    
    func viewDidLoad()
    func didClickSortButton()
    func didSelectArticle(_ article: Article)
}

protocol ArticlesUseCase: class {
    var output: ArticlesInteractorOutput! { get set }
    
    func fetchArticles()
}

protocol ArticlesInteractorOutput: class {
    func articlesFetched(_ articles: [Article])
    func articlesFetchFailed()
}

protocol ArticlesWireframe: class {
    var viewController: UIViewController? { get set }
    
    func presentSortOptions(sortCompletion: ((ArticlesSortType) -> ())?)
    func presentDetails(forArticle article: Article)
    
    static func assembleModule() -> UIViewController
}
