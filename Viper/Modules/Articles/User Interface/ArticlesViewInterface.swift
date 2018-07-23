//
//  ArticlesViewInterface.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

protocol ArticlesViewInterface: class {
    func showNoContentScreen()
    func showArticlesList(articles: [Article])
}
