//
//  ArticlesProvider.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

protocol ArticlesModuleInterface: class {
    func updateView()
    func sortArticles()
    func showDetails(forArticle article: [String: Any])
}
