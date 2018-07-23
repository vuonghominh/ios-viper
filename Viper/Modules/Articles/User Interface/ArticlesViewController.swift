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
    let alertSortByTitle = "ALERT_SORT_BY_TITLE"
    let dateString = "ALERT_DATE_OPTION"
    let titleString = "ALERT_TITLE_OPTION"
    let authorString = "ALERT_AUTHOR_OPTION"
    let webSiteString = "ALERT_WEBSITE_OPTION"
    let cancelString = "ALERT_CANCEL_OPTION"
    
    let sortAction = "showSortOptions:"
    
    // MARK: Instance Variables
    var articlesView: ArticlesView!
    var articlesPresenter: ArticlesPresenter!
    var articles: [Article]!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupArticlesView()
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
        let sortButton = UIBarButtonItem(title: self.buttonSortTitle.localized, style: .plain, target:self, action: Selector(self.sortAction))
        
        self.navigationItem.rightBarButtonItem = sortButton
        self.navigationItem.title = self.navigationBarTitle.localized
    }
    
    func showSortOptions(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: self.alertSortByTitle.localized, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: self.dateString.localized, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: self.titleString.localized, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: self.authorString.localized, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: self.webSiteString.localized, style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: self.cancelString.localized, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: ArticlesViewInterface
    
    func showNoContentScreen() {
    }
    
    func showArticlesList(articles: [Article]) {
        self.articles = articles
        self.articlesView.articlesTableView.reloadData()
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
