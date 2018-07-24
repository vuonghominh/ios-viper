//
//  ArticlesViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import PKHUD

class ArticlesViewController : UIViewController, ArticlesViewInterface, UITableViewDataSource, UITableViewDelegate {
    // MARK: constants
    let navigationBarTitle = "NAVIGATION_BAR_TITLE"
    let buttonSortTitle = "BUTTON_SORT_TITLE"
    
    // MARK: Instance Variables
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!
    var articles: [Article]!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
        self.setupArticlesView()
        
        HUD.show(.progress)
        self.articlesPresenter.requestArticles()
    }
    
    // MARK: Private
    
    func setupArticlesView() {
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.articlesView.articlesTableView.delegate = self
        self.articlesView.articlesTableView.dataSource = self
        
        self.view.addSubview(self.articlesView)
    }
    
    func setupNavigationBar() {
        let sortButton = UIBarButtonItem(title: self.buttonSortTitle.localized, style: .plain, target:self, action: #selector(onSortButtonClicked(sender:)))
        
        self.navigationItem.rightBarButtonItem = sortButton
        self.navigationItem.title = self.navigationBarTitle.localized
    }
    
    @objc func onSortButtonClicked(sender: UIBarButtonItem) {
        self.articlesPresenter.sortArticles()
    }
    
    // MARK: ArticlesViewInterface
    
    func showNoContentScreen() {
    }
    
    func showArticlesList(articles: [Article]) {
        HUD.hide()
        self.articles = articles
        self.articlesView.articlesTableView.reloadData()
    }
    
    // MARK: UITableView Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
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
        self.articlesPresenter.presentDetailsScreenForArticle(article: self.articles[indexPath.row])
    }
}
