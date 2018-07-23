//
//  ArticlesViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesViewController : UIViewController, ArticlesViewInterface, UITableViewDataSource, UITableViewDelegate {
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!
    var articles: [Article]!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupArticlesView()
        self.articlesPresenter.requestArticles()
    }
    
    // MARK: ArticlesViewInterface
    
    func showNoContentScreen() {
    }
    
    func showArticlesList(articles: [Article]) {
        self.articles = articles
        self.articlesView.articlesTableView.reloadData()
    }
    
    // MARK: Private
    
    func setupArticlesView() {
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.articlesView.articlesTableView.delegate = self
        self.articlesView.articlesTableView.dataSource = self
        
        self.view.addSubview(self.articlesView)
    }
    
    // MARK: UITableView Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.articles != nil ? self.articles.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.kArticlesCellIdentifier,
                                                        for: indexPath as IndexPath) as! ArticleTableViewCell
        if self.articles != nil {
            articleCell.setupWithArticle(article: self.articles[indexPath.section])
            
            articleCell.contentView.layoutIfNeeded()
        }
        
        return articleCell
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 16
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Clicked on \(indexPath)")
    }
}
