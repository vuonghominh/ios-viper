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
    var articlesPresenter: ArticlesModuleInterface!
    var articles: [Article]!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.articlesPresenter.updateView()
    }
    
    // MARK: Private
    private func setupView() {
        self.setupNavigationBar()
        self.setupTableView()
    }
    
    func setupNavigationBar() {
        let sortButton = UIBarButtonItem(title: self.buttonSortTitle.localized, style: .plain, target:self, action: #selector(ArticlesViewController.onSortButtonClicked(sender:)))
        
        self.navigationItem.rightBarButtonItem = sortButton
        self.navigationItem.title = self.navigationBarTitle.localized
    }
    
    private func setupTableView() {
        self.articlesTableView.dataSource = self
        self.articlesTableView.delegate = self
        self.articlesTableView.rowHeight = UITableViewAutomaticDimension
        self.articlesTableView.estimatedRowHeight = 230.0
    }
    
    @objc private func onSortButtonClicked(sender: UIBarButtonItem) {
        self.articlesPresenter.sortArticles()
    }
    
    // MARK: ArticlesViewInterface
    
    func showNoContentScreen() {
        // Show custom empty screen.
    }
    
    func showArticlesList(articles: [Article]) {
        self.articles = articles
        self.articlesTableView.reloadData()
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
        let articleCell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.kArticlesCellIdentifier) as! ArticleTableViewCell
        
        if self.articles != nil {
            articleCell.setupWithArticle(article: self.articles[indexPath.section])
        }
        
        return articleCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? UIView() : nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.articlesPresenter.showDetailsForArticle(article: self.articles[indexPath.section])
    }
}
