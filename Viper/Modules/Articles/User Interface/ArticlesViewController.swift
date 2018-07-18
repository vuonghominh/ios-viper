//
//  ArticlesViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesViewController : UIViewController, ArticlesViewInterface {
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.view.addSubview(self.articlesView)
        
        self.articlesPresenter.requestArticles()
    }
    
    func showNoContentScreen() {
    }
    
    func showArticlesList() {
    }
}
