//
//  ArticlesViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesViewController : UIViewController, ArticlesViewInterface, UITableViewDataSource, UITableViewDelegate {
    // MARK: constants
    let navigationBarTitle = "NAVIGATION_BAR_TITLE"
    let buttonSortTitle = "BUTTON_SORT_TITLE"
    
    // MARK: Outlets
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    // MARK: Instance Variables
    var articlesPresenter: ArticlesPresenter!
    var articles: [Article]!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.articlesTableView.dataSource = self
        self.articlesTableView.delegate = self
        
        self.setupNavigationBar()
        
        self.articlesPresenter.requestArticles()
    }
    
    // MARK: Private
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
        self.articles = articles
        self.articlesTableView.reloadData()
    }
    
    // MARK: UITableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles != nil ? self.articles.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.kArticlesCellIdentifier) as! ArticleTableViewCell
        
        if self.articles != nil {
            articleCell.setupWithArticle(article: self.articles[indexPath.row])
        }
        
        return articleCell
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.articlesPresenter.presentDetailsScreenForArticle(article: self.articles[indexPath.row])
    }
}
