//
//  ArticlesView.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit
import SnapKit

class ArticlesView: UIView {
    // MARK: Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Setup
    func setupView() {
        self.backgroundColor = UIColor.backgroundWhite()
        self.addSubview(self.articlesTableView)
    }
    
    func setupConstraints() {
        self.articlesTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp.top).offset(16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
            make.left.equalTo(self.snp.left).offset(16)
            make.right.equalTo(self.snp.right).offset(-16)
        }
    }
    
    // MARK: Lazy Instantiation
    lazy var articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.kArticlesCellIdentifier)
        tableView.backgroundColor = UIColor.backgroundWhite()
        tableView.rowHeight = 230.0
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
}
